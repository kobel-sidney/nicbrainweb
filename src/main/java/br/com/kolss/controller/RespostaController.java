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
import br.com.kolss.datamodel.RespostaDataModel;
import br.com.kolss.model.entities.Resposta;
import br.com.kolss.service.RespostaService;

@Controller(value = "respostaBean")
@Scope("session")
public class RespostaController {

	private Resposta model = new Resposta();

	private RespostaDataModel listaRespostas;

	@Autowired
	private RespostaService respostaService;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	public RespostaController() {
	}

	public RespostaDataModel getListaRespostas() {
		listaRespostas = new RespostaDataModel(respostaService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado()));
		return listaRespostas;
	}

	public String novo() {
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		model = new Resposta();
		return null;
	}

	public String add() {
		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaResposta.nicbrain";
	}

	private void insert() {
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		respostaService.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));

	}

	private void update() {
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		respostaService.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		model = new Resposta();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaResposta.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		try {
			respostaService.remover(model);

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

	public Resposta getModel() {
		return model;
	}

	public void setModel(Resposta model) {
		this.model = model;
	}

	public void onRowSelect(SelectEvent event) {
		setModel((Resposta) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		setModel((Resposta) event.getObject());
		avancaPagina();
	}

	public void avancaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/Resposta.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/Resposta.nicbrain?faces-redirect=true");
	}

}
