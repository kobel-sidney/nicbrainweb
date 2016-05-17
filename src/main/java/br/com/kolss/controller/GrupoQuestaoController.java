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
import br.com.kolss.datamodel.GrupoQuestaoDataModel;
import br.com.kolss.model.entities.GrupoQuestao;
import br.com.kolss.service.GrupoQuestaoService;

@Controller(value = "grupoQuestaoBean")
@Scope("session")
public class GrupoQuestaoController {

	private GrupoQuestao model = new GrupoQuestao();

	private GrupoQuestaoDataModel listaGrupoQuestoes;

	@Autowired
	private GrupoQuestaoService service;
	
	@Autowired
	private  BbUsuarioLogado usuarioLogado;

	public GrupoQuestaoController() {
		
	}

	public GrupoQuestaoDataModel getListaGrupoQuestoes() {
		listaGrupoQuestoes = new GrupoQuestaoDataModel(
				service.obterTodos(usuarioLogado.obterContratanteUsuarioLogado()));
		return listaGrupoQuestoes;
	}

	public String novo() {
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		model = new GrupoQuestao();
		return null;
	}

	public String add() {
		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaGrupoQuestao.nicbrain";
	}

	private void insert() {
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		service.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));

	}

	private void update() {
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		service.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		model = new GrupoQuestao();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaGrupoQuestao.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		try {
			service.remover(model);

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

	public GrupoQuestao getModel() {
		return model;
	}

	public void setModel(GrupoQuestao model) {
		this.model = model;
	}

	public void onRowSelect(SelectEvent event) {
		setModel((GrupoQuestao) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		setModel((GrupoQuestao) event.getObject());
		avancaPagina();
	}

	public void avancaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/GrupoQuestao.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/GrupoQuestao.nicbrain?faces-redirect=true");
	}

}
