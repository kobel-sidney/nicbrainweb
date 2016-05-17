package br.com.kolss.controller;

import java.io.IOException;
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
import br.com.kolss.datamodel.QuestaoDataModel;
import br.com.kolss.model.entities.Questao;
import br.com.kolss.model.entities.TipoQuestao;
import br.com.kolss.service.QuestaoService;

@Controller(value = "questaoBean")
@Scope("session")
public class QuestaoController {

	private Questao model = new Questao();

	private QuestaoDataModel listaQuestoes;

	@Autowired
	private QuestaoService service;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	public QuestaoController() {
	}

	public QuestaoDataModel getListaQuestoes() {
			listaQuestoes = new QuestaoDataModel(service.obterTodos(usuarioLogado.obterContratanteUsuarioLogado()));
    	return listaQuestoes;
	}

	public List<TipoQuestao> getTipoQuestoes() {
		return service.obterTipoQuestao(usuarioLogado.obterContratanteUsuarioLogado());
	}

	public String novo() {
		limpar();
		avancaPagina();
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

	public String limpar() {
		model = new Questao();
		return null;
	}

	public String add() {
		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaQuestao.nicbrain";
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
		model = new Questao();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaQuestao.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public Questao getModel() {
		return model;
	}

	public void setModel(Questao model) {
		this.model = model;
	}

	public void onRowSelect(SelectEvent event) {
		setModel((Questao) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		setModel((Questao) event.getObject());
		avancaPagina();
	}

	public void avancaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/Questao.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/Questao.nicbrain?faces-redirect=true");
	}
}
