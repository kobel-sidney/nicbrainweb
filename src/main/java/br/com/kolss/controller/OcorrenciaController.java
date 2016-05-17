package br.com.kolss.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.kolss.dto.EventoDTO;
import br.com.kolss.dto.OcorrenciaDTO;
import br.com.kolss.dto.OcorrenciaRondaDTO;
import br.com.kolss.dto.RetornoDTO;
import br.com.kolss.dto.TipoClassificacaoOcorrenciaDTO;
import br.com.kolss.enums.RetornoEnum;
import br.com.kolss.model.entities.ClassificacaoOcorrencia;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.GravidadeOcorrencia;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.ClassificacaoOcorrenciaService;
import br.com.kolss.service.EventoService;
import br.com.kolss.service.GravidadeOcorrenciaService;
import br.com.kolss.service.OcorrenciaService;
import br.com.kolss.service.UsuarioService;
import br.com.kolss.view.SelectHtml;
import br.com.kolss.view.SelectOptionHtml;

@Controller
@RequestMapping("/ocorrencias")
public class OcorrenciaController {

	@Autowired
	private EventoService eventoService;

	@Autowired
	private ClassificacaoOcorrenciaService classificacaoOcorrenciaService;

	@Autowired
	private GravidadeOcorrenciaService gravidadeOcorrenciaService;

	@Autowired
	private OcorrenciaService ocorrenciaService;

	@Autowired
	private UsuarioService usuarioService;

	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public ModelAndView form() {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		Usuario usuario = usuarioService.getUsuarioPorEmail(username);

		List<Evento> eventos = eventoService.eventosPorContratante(usuario.getCliente().getContratante());
		List<EventoDTO> eventoDTOs = new ArrayList<>(0);
		for (Evento evento : eventos) {
			eventoDTOs.add(new EventoDTO(evento));
		}

		List<ClassificacaoOcorrencia> classificacoesOcorrencia = classificacaoOcorrenciaService
				.obterTodos(usuario.getCliente().getContratante());
		SelectHtml selectClassificacoes = montarSelectClassificacoes(classificacoesOcorrencia);

		List<GravidadeOcorrencia> gravidades = gravidadeOcorrenciaService.obterTodos();
		SelectHtml selectGravidades = montarSelectGravidades(gravidades);

		ModelAndView mv = new ModelAndView("ocorrencia");
		mv.addObject("eventos", eventoDTOs);
		mv.addObject("classificacoes", selectClassificacoes);
		mv.addObject("gravidades", selectGravidades);
		mv.addObject("userName", usuario.getNome());

		return mv;
	}

	@RequestMapping(value = "/abrir", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody RetornoDTO abrirOcorrencia(@RequestBody OcorrenciaDTO ocorrenciaDTO) {
		RetornoDTO retornoDTO = new RetornoDTO(RetornoEnum.SUCESSSO);

		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		try {
			Usuario usuario = usuarioService.getUsuarioPorEmail(username);
			if(usuario!=null){
				ocorrenciaDTO.setIdUsuario(String.valueOf(usuario.getId()));
			}
			ocorrenciaService.abrirNovaOcorrencia(ocorrenciaDTO);

		} catch (Exception ex) {
			retornoDTO = new RetornoDTO(RetornoEnum.ERRO_NEGOCIO);
		}

		return retornoDTO;
	}

	@RequestMapping(value = "/alterarResponsavel", method = RequestMethod.PUT)
	public @ResponseBody RetornoDTO alterarResponsavel(@RequestBody OcorrenciaRondaDTO ocorrenciaRondaDTO) {
		RetornoDTO retornoDTO = new RetornoDTO(RetornoEnum.SUCESSSO);

		try {
			ocorrenciaService.alterarResponsavel(ocorrenciaRondaDTO);
		} catch (Exception e) {
			retornoDTO = new RetornoDTO(RetornoEnum.ERRO_NEGOCIO);
		}
		
		return retornoDTO;
	}
	
	@RequestMapping(value = "/{occurrenceID}", method = RequestMethod.GET)
	public @ResponseBody OcorrenciaRondaDTO getOccurrenceByID(@PathVariable(value = "occurrenceID") final Long occurrenceID) {
		
		return ocorrenciaService.getOccurrenceByIDDTO(occurrenceID);
	}
	
	@RequestMapping(value = "/tipos/{classificationID}", method = RequestMethod.GET)
	public @ResponseBody List<TipoClassificacaoOcorrenciaDTO> getOccurrenceByClassification(@PathVariable(value = "classificationID") final Long classificationID) {
		
		return ocorrenciaService.getTypeByClassificationDTO(classificationID);
	}

	private SelectHtml montarSelectClassificacoes(List<ClassificacaoOcorrencia> classificacoes) {
		SelectHtml selectClassificacoes = new SelectHtml();

		if (classificacoes != null) {
			List<SelectOptionHtml> options = new ArrayList<>(0);
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

	private SelectHtml montarSelectGravidades(List<GravidadeOcorrencia> gravidades) {
		SelectHtml selectGravidades = new SelectHtml();

		if (gravidades != null) {
			List<SelectOptionHtml> options = new ArrayList<>(0);
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

}
