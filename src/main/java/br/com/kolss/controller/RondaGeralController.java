package br.com.kolss.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import br.com.kolss.dto.CercaVirtualDTO;
import br.com.kolss.dto.CoordenadaDTO;
import br.com.kolss.dto.FiltroRonda;
import br.com.kolss.dto.GuarnicaoDTO;
import br.com.kolss.dto.ListaPostoServicoDTO;
import br.com.kolss.dto.OcorrenciaRondaDTO;
import br.com.kolss.dto.OcorrenciasRondaDTO;
import br.com.kolss.dto.PostoServicoDTO;
import br.com.kolss.dto.RetornoRondaDTO;
import br.com.kolss.dto.RondaDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.LocalService;
import br.com.kolss.service.OcorrenciaService;
import br.com.kolss.service.PostoServicoService;
import br.com.kolss.service.RondaService;
import br.com.kolss.service.TrocaVeiculoService;
import br.com.kolss.service.UsuarioService;

/**
 *
 * @author weverton
 */
@Controller
@RequestMapping(value = "/rondaGeral")
public class RondaGeralController {

	@Autowired
	private RondaService rondaService;

	@Autowired
	private OcorrenciaService ocorrenciaService;

	@Autowired
	private TrocaVeiculoService trocaVeiculoService;

	@Autowired
	private PostoServicoService postoServicoService;
	
	@Autowired
	private LocalService localService;

	@Autowired
	private UsuarioService usuarioService;

	@RequestMapping(value = "/obterCoordenadasViaturas", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody RetornoRondaDTO obterRondas() {
		final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");

		Calendar dataAtual = Calendar.getInstance();
		dataAtual.setTimeZone(TimeZone.getTimeZone("Brazil/East"));
		dataAtual.setTime(new Date());

		dateFormat.setTimeZone(TimeZone.getTimeZone("Brazil/East"));

		FiltroRonda filtroRonda = new FiltroRonda();
		filtroRonda.setFim(dateFormat.format(dataAtual.getTime()));
		dataAtual.add(Calendar.SECOND, -15);
		filtroRonda.setInicio(dateFormat.format(dataAtual.getTime()));

		String rondasJson = rondaService.obterRondas(filtroRonda);
		List<GuarnicaoDTO> guarnicoes = new ArrayList<>();
		Gson gson = new Gson();
		RetornoRondaDTO retornoRondaDTO = gson.fromJson(rondasJson, RetornoRondaDTO.class);
		for (RondaDTO ronda : retornoRondaDTO.getListRonda()) {

			List<GuarnicaoDTO> list = null;
			try {
				list = trocaVeiculoService.buscarGuarnicoes(ronda.getIdVeiculo());
			} catch (ServiceException e) {
				list = new ArrayList<>();
			} finally {
				guarnicoes.addAll(list);
			}
		}
//		retornoRondaDTO.setGuarnicoes(guarnicoes);

		return retornoRondaDTO;
	}

	@RequestMapping(value = "/obterOcorrencias", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody OcorrenciasRondaDTO obterOcorrencias() {
		OcorrenciasRondaDTO ocorrencias = new OcorrenciasRondaDTO();
		List<OcorrenciaRondaDTO> ocorrenciaRondaDTOs = null;

		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		Usuario usuario = usuarioService.getUsuarioPorEmail(username);
		if (usuario != null) {
			ocorrenciaRondaDTOs = ocorrenciaService.listarOcorrenciasEmEspera(usuario);
		}

		if (ocorrenciaRondaDTOs != null) {
			ocorrencias.setOcorrencias(ocorrenciaRondaDTOs);
		}

		return ocorrencias;
	}

	@RequestMapping(value = "/obterPostosServico", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody ListaPostoServicoDTO obterPostosServicos() {
		List<PostoServicoDTO> postos = new ArrayList<>();
		postos.addAll(postoServicoService.obterTodosDTO());

		ListaPostoServicoDTO lista = new ListaPostoServicoDTO();
		lista.setPostosServicos(postos);

		return lista;
	}
	
	
	@RequestMapping(value = "/buscarCoordenadasLocal", method = RequestMethod.POST, produces = "application/json")
	private @ResponseBody CoordenadaDTO buscarCoordenadasLocal(@RequestBody final CercaVirtualDTO cercaVirtualDTO) {

		CoordenadaDTO coordenadaDTO = new CoordenadaDTO();
		
		Local local = localService.getLocal(cercaVirtualDTO.getIdLocal());
		if (local != null) {
			coordenadaDTO.setLatitude(local.getLatitude());
			coordenadaDTO.setLongitude(local.getLongitude());
		}
		
		return coordenadaDTO;
	}
}
