package br.com.kolss.controller;

import java.io.IOException;

import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import org.apache.log4j.Logger;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.datamodel.EntityDataModel;
import br.com.kolss.model.entities.AbstractEntity;
import br.com.kolss.model.entities.Formulario;
import br.com.kolss.service.FormularioService;


@Controller(value = "formularioBean")
@Scope("session")
public class FormularioController {
	
	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private FormularioService formularioService;

	private Formulario model = new Formulario();

	@SuppressWarnings("rawtypes")
	private EntityDataModel<? extends AbstractEntity> dataModel;

	/** Metodo construtor padrao. */
	public FormularioController() {
		
	}

	public String novo() {
		logger.info("Criando novo Formulario");
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		logger.info("Limpar dados do Formulario");
		model = new Formulario();
		return null;
	}

	private void insert() {
		logger.info("Salvar Formulario: " + this.model);
		formularioService.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		logger.info("Atualizar Formulario: " + this.model);
		formularioService.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		logger.info("Cancela a operacao de adicao/edicao");
		model = new Formulario();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaFormulario.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		logger.info("Excluir Formulario: " + this.model);
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

	public String add(ActionEvent evento) {
		logger.info("Salvar/Atualizar Formulario[ActionEvent]: " + evento);
		return add();
	}

	public String add() {
		logger.info("Salvar/Atualizar Formulario: " + this.model);

		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaFormulario.nicbrain";
	}

	public Formulario getModel() {
		logger.info("Obter: " + this.model);
		return model;
	}

	public void setModel(Formulario formulario) {
		logger.info("Selecionar: " + formulario);
		this.model = formulario;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel getDataModel() {
		return this.dataModel;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> getListaFormularios() {
		dataModel = new EntityDataModel<>(formularioService.obterTodos());
		return dataModel;
	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/Formulario.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		logger.info("Volta para a lista de Formulario");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaFormulario.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Formulario) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Formulario) event.getObject());
		avancaPagina();
	}

}