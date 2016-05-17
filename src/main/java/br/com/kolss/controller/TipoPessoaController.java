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
import br.com.kolss.model.entities.TipoPessoa;
import br.com.kolss.service.TipoPessoaService;

@Controller(value = "tipoPessoaBean")
@Scope("session")
public class TipoPessoaController {
	
	@Autowired
	private TipoPessoaService pessoaService;

	private TipoPessoa model = new TipoPessoa();

	@SuppressWarnings("rawtypes")
	private EntityDataModel<? extends AbstractEntity> dataModel;

	public TipoPessoaController() {
	}

	public String novo() {
		limpar();
		avancaPagina();
		return null;
	}

	private void limpar() {
		model = new TipoPessoa();
	}

	private void insert() {
		pessoaService.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		pessoaService.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		model = new TipoPessoa();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaTipoPessoa.nicbrain");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		try {
			pessoaService.remover(model);

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
		return "/restrict/ListaTipoPessoa.nicbrain";
	}

	public TipoPessoa getModel() {
		return model;
	}

	public void setModel(TipoPessoa tipo) {
		this.model = tipo;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel getDataModel() {
		return this.dataModel;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> getListaTiposPessoas() {
		dataModel = new EntityDataModel<>(pessoaService.obterTodos());
		return dataModel;
	}

	public void avancaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/TipoPessoa.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaTipoPessoa.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		setModel((TipoPessoa) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		setModel((TipoPessoa) event.getObject());
		avancaPagina();
	}
}
