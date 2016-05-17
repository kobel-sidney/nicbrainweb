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
import br.com.kolss.datamodel.TipoQuestaoDataModel;
import br.com.kolss.model.entities.TipoQuestao;
import br.com.kolss.service.TipoQuestaoService;

@Controller(value = "tipoQuestaoBean")
@Scope("session")
public class TipoQuestaoController {

	private TipoQuestao model = new TipoQuestao();

	private TipoQuestaoDataModel listaTipoQuestoes;

	@Autowired
	private TipoQuestaoService tipoQuestaoService;

	@Autowired
	private BbUsuarioLogado usuarioLogado;
	

	public TipoQuestaoController() {
		
	}

	public TipoQuestaoDataModel getListaTipoQuestoes() {
		listaTipoQuestoes = new TipoQuestaoDataModel(tipoQuestaoService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado()));
		return listaTipoQuestoes;
	}

	public String novo() {
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		model = new TipoQuestao();
		return null;
	}

	public String add() {
		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaTipoQuestao.nicbrain";
	}

	private void insert() {
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		tipoQuestaoService.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));

	}

	private void update() {		
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		tipoQuestaoService.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		model = new TipoQuestao();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaTipoQuestao.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		try {
			model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
			tipoQuestaoService.remover(model);

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

	public TipoQuestao getModel() {
		return model;
	}

	public void setModel(TipoQuestao model) {
		this.model = model;
	}

	public void onRowSelect(SelectEvent event) {
		setModel((TipoQuestao) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		setModel((TipoQuestao) event.getObject());
		avancaPagina();
	}

	public void avancaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/TipoQuestao.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/TipoQuestao.nicbrain?faces-redirect=true");
	}
}
