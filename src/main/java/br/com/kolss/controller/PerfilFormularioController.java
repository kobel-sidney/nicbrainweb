package br.com.kolss.controller;

import java.io.IOException;

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
import br.com.kolss.datamodel.PerfilFormularioDataModel;
import br.com.kolss.model.entities.PerfilFormulario;
import br.com.kolss.service.PerfilFormularioService;

@Controller(value = "perfilFormularioBean")
@Scope("session")
public class PerfilFormularioController {

	private PerfilFormulario model = new PerfilFormulario();
	PerfilFormularioDataModel listaPerfilFormularios;

	@Autowired
	private PerfilFormularioService formularioService;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;
	

	public PerfilFormularioController() {
	}

	public PerfilFormularioDataModel getListaPerfilFormularios() {
		listaPerfilFormularios = new PerfilFormularioDataModel(formularioService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado()));
		return listaPerfilFormularios;
	}

	public String novo() {
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		model = new PerfilFormulario();
		return null;
	}

	public String add() {
		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaPerfilFormulario.nicbrain";
	}

	private void insert() {
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		formularioService.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		formularioService.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		model = new PerfilFormulario();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaPerfilFormulario.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		try {
			formularioService.remover(model);

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

	public PerfilFormulario getModel() {
		return model;
	}

	public void setModel(PerfilFormulario model) {
		this.model = model;
	}

	public void onRowSelect(SelectEvent event) {
		setModel((PerfilFormulario) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		setModel((PerfilFormulario) event.getObject());
		avancaPagina();
	}

	public void avancaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/PerfilFormulario.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/PerfilFormulario.nicbrain?faces-redirect=true");
	}

}
