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
import br.com.kolss.model.entities.TipoTelefone;
import br.com.kolss.service.TipoTelefoneService;

@Controller(value = "tipoTelefoneBean")
@Scope("session")
public class TipoTelefoneController {

	@Autowired
	private TipoTelefoneService telefoneService;

	private TipoTelefone model = new TipoTelefone();

	@SuppressWarnings("rawtypes")
	private EntityDataModel<? extends AbstractEntity> dataModel;

	public TipoTelefoneController() {
		// TODO Auto-generated constructor stub
	}

	public String novo() {
		limpar();
		avancaPagina();
		return null;
	}

	private void limpar() {
		model = new TipoTelefone();
	}

	private void insert() {
		telefoneService.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		telefoneService.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		model = new TipoTelefone();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaTipoTelefone.nicbrain");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		try {
			telefoneService.remover(model);

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
		return "/restrict/ListaTipoTelefone.nicbrain";
	}

	public TipoTelefone getModel() {
		return model;
	}

	public void setModel(TipoTelefone tipo) {
		this.model = tipo;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel getDataModel() {
		return this.dataModel;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> getListaTiposTelefones() {
		dataModel = new EntityDataModel<>(telefoneService.obterTodos());
		return dataModel;
	}

	public void avancaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/TipoTelefone.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaTipoTelefone.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		setModel((TipoTelefone) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		setModel((TipoTelefone) event.getObject());
		avancaPagina();
	}
}