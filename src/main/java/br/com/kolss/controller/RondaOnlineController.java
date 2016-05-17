package br.com.kolss.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import br.com.kolss.dto.EquipamentoDTO;
import br.com.kolss.dto.EventoDTO;
import br.com.kolss.dto.FiltroRonda;
import br.com.kolss.dto.GuarnicaoDTO;
import br.com.kolss.dto.ListaOcorrenciaRondaDTO;
import br.com.kolss.dto.ListaPostoServicoDTO;
import br.com.kolss.dto.OcorrenciaRondaDTO;
import br.com.kolss.dto.PessoaDTO;
import br.com.kolss.dto.PostoServicoDTO;
import br.com.kolss.dto.RetornoRondaDTO;
import br.com.kolss.dto.RondaDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.CercaVirtual;
import br.com.kolss.model.entities.ClassificacaoOcorrencia;
import br.com.kolss.model.entities.Equipamento;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.GravidadeOcorrencia;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.Ronda;
import br.com.kolss.model.entities.TipoClassificacao;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.ClassificacaoOcorrenciaService;
import br.com.kolss.service.EquipamentoService;
import br.com.kolss.service.EventoService;
import br.com.kolss.service.GravidadeOcorrenciaService;
import br.com.kolss.service.LocalService;
import br.com.kolss.service.OcorrenciaService;
import br.com.kolss.service.PessoaService;
import br.com.kolss.service.PostoServicoService;
import br.com.kolss.service.RondaService;
import br.com.kolss.service.TipoClassificacaoService;
import br.com.kolss.service.UsuarioService;
import br.com.kolss.view.SelectGroupHtml;
import br.com.kolss.view.SelectHtml;
import br.com.kolss.view.SelectOptionHtml;

@Controller
@RequestMapping("/ronda/online")
public class RondaOnlineController {

	@Autowired
	private EventoService eventoService;

	@Autowired
	private RondaService rondaService;
	
	@Autowired
	private PessoaService pessoaService;

	@Autowired
	private OcorrenciaService ocorrenciaService;

	@Autowired
	private PostoServicoService postoServicoService;

	@Autowired
	private EquipamentoService equipamentoService;

	@Autowired
	private LocalService localService;

	@Autowired
	private UsuarioService usuarioService;

	@Autowired
	private ClassificacaoOcorrenciaService classificacaoOcorrenciaService;

	@Autowired
	private TipoClassificacaoService tipoClassificacaoService;

	@Autowired
	private GravidadeOcorrenciaService gravidadeOcorrenciaService;


	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView form2() {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		Usuario usuario = usuarioService.getUsuarioPorEmail(username);

		ModelAndView mv = new ModelAndView("mapa-online2");
		mv.addObject("userName", usuario.getNome());
		return mv;
	}

	@RequestMapping(value = "/rondas", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody RetornoRondaDTO obterRondas(HttpServletRequest request) {
		
		String username = (String) request.getSession().getAttribute("usuario");
		Usuario usuario = usuarioService.getUsuarioPorEmail(username);
		
		List<Ronda> rondasPorContexto = rondaService.obterEmAndamento(usuario);
		if (rondasPorContexto == null) {
			rondasPorContexto = Collections.emptyList();
		}
		
		List<Ronda> rondasFinalizadasPorContexto = rondaService.obterFinalizadasRecentes(usuario);
		if (rondasFinalizadasPorContexto == null) {
			rondasFinalizadasPorContexto = Collections.emptyList();
		}
		
		RetornoRondaDTO rondasParaRetornar = new RetornoRondaDTO();
		
		for (Ronda rondaPorContexto : rondasPorContexto) {
			final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");

			Calendar dataAtual = Calendar.getInstance();
			dataAtual.setTimeZone(TimeZone.getTimeZone("Brazil/East"));
			dataAtual.setTime(new Date());

			dateFormat.setTimeZone(TimeZone.getTimeZone("Brazil/East"));

			FiltroRonda filtroRonda = new FiltroRonda();
			filtroRonda.setFim(dateFormat.format(dataAtual.getTime()));
			dataAtual.add(Calendar.SECOND, -15);
			filtroRonda.setInicio(dateFormat.format(dataAtual.getTime()));
			filtroRonda.setIdUsuario(rondaPorContexto.getResponsavelRonda().getId().intValue());
			
			//Coordenadas das rondas - Api
			String rondasJson = rondaService.obterRondas(filtroRonda);
			
			RetornoRondaDTO retornoRondaDTO = new Gson().fromJson(rondasJson, RetornoRondaDTO.class);
			for (RondaDTO ronda : retornoRondaDTO.getListRonda()) {

				List<GuarnicaoDTO> list = null;
				try {
					list = rondaService.buscarGuarnicoes(ronda.getIdVeiculo());
				} catch (ServiceException e) {
					System.out.println("Não há guarnições");
				}

				if (list != null) {
					for (GuarnicaoDTO guarnicaoDTO : list) {
							rondasParaRetornar.getGuarnicoes().add(guarnicaoDTO);
					}
				}
				
				rondasParaRetornar.getListRonda().add(ronda);
			}
		}
		
		for (Ronda rondaFinalizada : rondasFinalizadasPorContexto) {
			final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");

			Calendar dataAtual = Calendar.getInstance();
			dataAtual.setTimeZone(TimeZone.getTimeZone("Brazil/East"));
			dataAtual.setTime(new Date());

			dateFormat.setTimeZone(TimeZone.getTimeZone("Brazil/East"));

			FiltroRonda filtroRonda = new FiltroRonda();
			filtroRonda.setFim(dateFormat.format(dataAtual.getTime()));
			dataAtual.add(Calendar.SECOND, -10);
			filtroRonda.setInicio(dateFormat.format(dataAtual.getTime()));
			filtroRonda.setIdUsuario(rondaFinalizada.getResponsavelRonda().getId().intValue());
			
			//Coordenadas das rondas - Api
			String rondasJson = rondaService.obterRondas(filtroRonda);
			
			RetornoRondaDTO retornoRondaDTO = new Gson().fromJson(rondasJson, RetornoRondaDTO.class);
			for (RondaDTO ronda : retornoRondaDTO.getListRonda()) {
				rondasParaRetornar.getRondasFinalizadas().add(ronda);
			}
		}

		return rondasParaRetornar;
	}

	@RequestMapping(value = "/ocorrencias", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody ListaOcorrenciaRondaDTO obterOcorrencias(HttpServletRequest request) {
		ListaOcorrenciaRondaDTO ocorrencias = new ListaOcorrenciaRondaDTO();
		List<OcorrenciaRondaDTO> ocorrenciaRondaDTOs = null;
		List<OcorrenciaRondaDTO> ocorrenciasFinalizadas = null;

		String username = (String) request.getSession().getAttribute("usuario");
		Usuario usuario = usuarioService.getUsuarioPorEmail(username);

		if (usuario != null) {
			ocorrenciaRondaDTOs = ocorrenciaService.obterOcorrenciasEmEsperaPorUsuario(usuario);
			ocorrenciasFinalizadas = ocorrenciaService.obterOcorrenciasFinalizadasPorUsuario(usuario);
		}

		if (ocorrenciaRondaDTOs != null) {
			ocorrencias.setOcorrencias(ocorrenciaRondaDTOs);
		}

		if (ocorrenciasFinalizadas != null) {
			ocorrencias.setOcorrenciasFinalizadas(ocorrenciasFinalizadas);
		}

		return ocorrencias;
	}
	
	@RequestMapping(value = "/ocorrencias/{userID}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<OcorrenciaRondaDTO> obterOcorrenciasPorResponsavel(@PathVariable(value = "userID") final Long userID) {
		List<OcorrenciaRondaDTO> ocorrenciaRondaDTOs = null;

		if (userID != null) {
			ocorrenciaRondaDTOs = ocorrenciaService.obterOcorrenciasEmEsperaPorResponsavel(userID);
		}

		return ocorrenciaRondaDTOs;
	}

	@RequestMapping(value = "/postosServico", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody ListaPostoServicoDTO obterPostosServicos() {
		List<PostoServicoDTO> postos = new ArrayList<>();
		postos.addAll(postoServicoService.obterTodosDTO());

		ListaPostoServicoDTO lista = new ListaPostoServicoDTO();
		lista.setPostosServicos(postos);

		return lista;
	}

	@RequestMapping(value = "/cameras", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<EquipamentoDTO> obterCameras(HttpServletRequest request) {
		String username = (String) request.getSession().getAttribute("usuario");
		Usuario usuario = usuarioService.getUsuarioPorEmail(username);
		Long idModeloCamera = Long.valueOf(1);

		List<Equipamento> cameras = equipamentoService.getEquipamentosPorContexto(idModeloCamera, null,
				usuario.getId());
		List<EquipamentoDTO> camerasDTO = new ArrayList<>(0);
		for (Equipamento equipamento : cameras) {
			camerasDTO.add(new EquipamentoDTO(equipamento));
		}

		return camerasDTO;
	}

	@RequestMapping(value = "/usuario/{idUsuario}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody PessoaDTO obterDadosPessoa(@PathVariable(value = "idUsuario") final Long idUsuario) {
		Usuario usuario = usuarioService.obter(idUsuario);
		Pessoa pessoa = pessoaService.obter(usuario.getPessoa().getId());

		PessoaDTO pessoaDTO = new PessoaDTO(pessoa);
		return pessoaDTO;
	}

	private SelectHtml montarSelectClassificacoes(List<ClassificacaoOcorrencia> classificacoes) {
		SelectHtml selectClassificacoes = new SelectHtml();

		if (classificacoes != null) {
			Set<SelectOptionHtml> options = new HashSet<>(0);
			for (ClassificacaoOcorrencia classificacao : classificacoes) {
				SelectOptionHtml option = new SelectOptionHtml();
				option.setLabel(classificacao.getNome());
				option.setValue(classificacao.getId().toString());

				options.add(option);
			}
			selectClassificacoes.setOptions(options);
		}
		return selectClassificacoes;
	}

	private SelectHtml montarSelectTipos(List<TipoClassificacao> tipos) {
		SelectHtml selectTipos = new SelectHtml();

		if (tipos != null) {
			Set<SelectOptionHtml> options = new HashSet<>(0);
			for (TipoClassificacao tipo : tipos) {
				SelectOptionHtml option = new SelectOptionHtml();
				option.setLabel(tipo.getNome());
				option.setValue(tipo.getId().toString());

				options.add(option);
			}
			selectTipos.setOptions(options);
		}
		return selectTipos;
	}

	private SelectHtml montarSelectGravidades(List<GravidadeOcorrencia> gravidades) {
		SelectHtml selectGravidades = new SelectHtml();

		if (gravidades != null) {
			Set<SelectOptionHtml> options = new HashSet<>(0);
			for (GravidadeOcorrencia gravidade : gravidades) {
				SelectOptionHtml option = new SelectOptionHtml();
				option.setLabel(gravidade.getNome());
				option.setValue(gravidade.getId().toString());

				options.add(option);
			}
			selectGravidades.setOptions(options);
		}
		return selectGravidades;
	}

	public String getUserName() {
		return SecurityContextHolder.getContext().getAuthentication().getName();
	}
	
}
