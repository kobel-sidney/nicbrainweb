package br.com.kolss.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

import org.primefaces.event.SelectEvent;
import org.primefaces.model.DualListModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.dto.EventoDTO;
import br.com.kolss.dto.UsuarioDTO;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Regra;
import br.com.kolss.service.EventoService;
import br.com.kolss.service.RegraService;
import br.com.kolss.service.UsuarioService;
import br.com.kolss.util.FacesUtil;

@Controller(value = "usuarioBean")
@Scope("session")
public class UsuarioController implements Serializable {

	private static final long serialVersionUID = -7215087914626626627L;

	private UsuarioDTO usuarioDTO;
	private List<UsuarioDTO> usuarioDTOs;
	private DualListModel<Regra> regras;
	private DualListModel<Evento> eventos;

	@Autowired
	private UsuarioService usuarioService;

	@Autowired
	private RegraService regraService;
	
	@Autowired
	private EventoService eventoService;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	@PostConstruct
	public void init() {
		usuarioDTO = new UsuarioDTO();
		regras = preencherRegras();
		eventos = preencherEventos();
	}

	private DualListModel<Regra> preencherRegras() {
		List<Regra> regrasSource = new ArrayList<>();
		List<Regra> regrasTarget = new ArrayList<>();

		regrasSource = regraService.obterRegras();
		regrasTarget.addAll(usuarioDTO.getRegras());
		
		for (Regra regra : regrasTarget) {
			if (regrasSource.contains(regra)) {
				regrasSource.remove(regra);
			}
		}

		return new DualListModel<>(regrasSource, regrasTarget);
	}
	
	private DualListModel<Evento> preencherEventos() {
		List<Evento> eventosSource = new ArrayList<>();
		List<Evento> eventosTarget = new ArrayList<>();

		eventosSource = eventoService.eventosPorContratante(usuarioLogado.obterContratanteUsuarioLogado());
		
		List<EventoDTO> eventosDTO = usuarioDTO.getLstEventoDTO();
		List<Evento> eventos = new ArrayList<>();
		if (eventosDTO != null) {
			for (EventoDTO eventoDTO : eventosDTO) {
				Evento evento = eventoService.obter(Long.valueOf(eventoDTO.getIdEvento()));
				eventos.add(evento);
			}
		}
		
		eventosTarget.addAll(eventos);
		
		for (Evento evento : eventosTarget) {
			if (eventosSource.contains(evento)) {
				eventosSource.remove(evento);
			}
		}

		return new DualListModel<>(eventosSource, eventosTarget);
	}

	public void excluir() {
		try {
			usuarioService.excluir(usuarioDTO);
		} catch (Exception e) {
			FacesUtil.addErrorMessage(e.getMessage());
		}
	}

	public void salvarOuAtualizar() {
		try {
			usuarioDTO.setRegras(regras.getTarget());
			usuarioDTO.setLstEventoDTO(obterEventosDTOdoTarget());
			usuarioService.salvarOuAtualizar(usuarioDTO);
		} catch (Exception e) {
			FacesUtil.addErrorMessage("Não foi possível salvar ou atualizar: " + e.getMessage());
		}
		regras = preencherRegras();
		irParaLista();
	}
	
	private List<EventoDTO> obterEventosDTOdoTarget() {
		List<Evento> eventoList = eventos.getTarget();
		List<EventoDTO> dtos = new ArrayList<>();
		
		if (eventoList != null) {
			for (Evento evento : eventoList) {
				EventoDTO eventoDTO = new EventoDTO();
				eventoDTO.setIdEvento(evento.getId().toString());
				dtos.add(eventoDTO);
			}
		}
		
		return dtos;
	}

	public void criarNovo() {
		limparCampos();
		irParaCadastro();
	}

	public void cancelar() {
		irParaLista();
	}

	private void limparCampos() {
		this.usuarioDTO = new UsuarioDTO();
	}

	private void irParaCadastro() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/Usuario.nicbrain?faces-redirect=true");
	}

	private void irParaLista() {
		limparCampos();
		/* listarFuncionariosAtivos(); */
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/ListaUsuario.nicbrain?faces-redirect=true");
	}

	public void rowSelect(SelectEvent event) {
		this.usuarioDTO = (UsuarioDTO) event.getObject();
		regras = preencherRegras();
		eventos = preencherEventos();
		irParaCadastro();
	}

	public boolean isCampoAtivoHabilitado() {
		return usuarioDTO.getIdUsuario() != null;
	}

	public UsuarioDTO getUsuarioDTO() {
		return usuarioDTO;
	}

	public void setUsuarioDTO(UsuarioDTO usuarioDTO) {
		this.usuarioDTO = usuarioDTO;
	}

	public List<UsuarioDTO> getUsuarioDTOs() {
		return usuarioDTOs;
	}

	public void setUsuarioDTOs(List<UsuarioDTO> usuarioDTOs) {
		this.usuarioDTOs = usuarioDTOs;
	}

	public DualListModel<Regra> getRegras() {
		return regras;
	}

	public void setRegras(DualListModel<Regra> regras) {
		this.regras = regras;
	}

	public DualListModel<Evento> getEventos() {
		return eventos;
	}

	public void setEventos(DualListModel<Evento> eventos) {
		this.eventos = eventos;
	}

}
