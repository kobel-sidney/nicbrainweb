package br.com.kolss.controller;

import java.io.IOException;

import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.datamodel.EntityDataModel;
import br.com.kolss.model.entities.AbstractEntity;
import br.com.kolss.model.entities.TipoMensagem;
import br.com.kolss.service.TipoMensagemService;

@Controller(value = "tipoMensagemBean")
@Scope("session")
public class TipoMensagemController {

	@Autowired
	private TipoMensagemService tipoMensagemService;

	private TipoMensagem model = new TipoMensagem();

	@SuppressWarnings("rawtypes")
	private EntityDataModel<? extends AbstractEntity> dataModel;

	public TipoMensagemController() {
	}

	public String novo() {
		limpar();
		avancaPagina();
		return null;
	}

	private void limpar() {
		model = new TipoMensagem();
	}
	
	private void insert() {
		tipoMensagemService.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		tipoMensagemService.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		model = new TipoMensagem();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaTipoMensagem.nicbrain");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		try {
			tipoMensagemService.remover(model);

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

	public String add(ActionEvent evento) {
		return add();
	}

	public String add() {

		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaTipoMensagem.nicbrain";
	}

	public TipoMensagem getModel() {
		return model;
	}

	public void setModel(TipoMensagem tipo) {
		this.model = tipo;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel getDataModel() {
		return this.dataModel;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> getListaTiposMensagens() {
		dataModel = new EntityDataModel<>(tipoMensagemService.obterTodos());
		return dataModel;
	}

	public void avancaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/TipoMensagem.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaTipoMensagem.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		setModel((TipoMensagem) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		setModel((TipoMensagem) event.getObject());
		avancaPagina();
	}
}
