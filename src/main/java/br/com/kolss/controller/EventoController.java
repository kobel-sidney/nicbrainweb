package br.com.kolss.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.datamodel.EventoDataModel;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.EventoService;
import br.com.kolss.service.LocalService;
import br.com.kolss.service.UsuarioService;

@Controller(value = "eventoBean")
@Scope("session")
public class EventoController {

	private Evento model = new Evento();

	EventoDataModel listaEventos;

	@Autowired
	EventoService eventoService;

	@Autowired
	LocalService localService;

	@Autowired
	UsuarioService usuarioService;
	
	@Autowired
	private BbUsuarioLogado bbUsuarioLogado;

	public EventoController() {
	}

	public EventoDataModel getListaEventos() {
		return listaEventos = new EventoDataModel(eventoService.eventosPorContratante(bbUsuarioLogado.obterContratanteUsuarioLogado()));
	}

	public List<Local> getLocais() {
		return localService.getLocais();
	}

	public List<Usuario> getUsuarios() {
		return usuarioService.getUsuariosAtivos();
	}

	public String novo() {
		limpar();
		avancaPagina();
		return null;
	}

	public void delete() {
		try {
			eventoService.remover(model);
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
							.getI18nMessage(BbLocale.DELETE_SUCCESSFULLY), ""));

		} catch (DataIntegrityViolationException ex) {
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
							.getI18nMessage(BbLocale.CONSTRAINT_ERROR), ""));

		}
	}

	public String add() {
		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaEvento.nicbrain";
	}

	public String limpar() {
		model = new Evento();
		return null;
	}

	private void insert() {
		// TODO: ajustar de acordo com o formato do banco
		Calendar cal = Calendar.getInstance();
		model.setDataCadastro(cal.getTime());

		eventoService.salvar(model);
		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		eventoService.atualizar(model);
		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		model = new Evento();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaEvento.nicbrain");
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public void onRowSelect(SelectEvent event) {
		setModel((Evento) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		setModel((Evento) event.getObject());
		avancaPagina();
	}

	public void avancaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/Evento.nicbrain?faces-redirect=true");
	}

	public Evento getModel() {
		return model;
	}

	public void setModel(Evento model) {
		this.model = model;
	}

}