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
import br.com.kolss.model.entities.TipoEquipamento;


@Controller(value = "tipoEquipamentoBean")
@Scope("session")
public class TipoEquipamentoController {
	
	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private TipoEquipamentoService equipamentoService;

	private TipoEquipamento model = new TipoEquipamento();

	@SuppressWarnings("rawtypes")
	private EntityDataModel<? extends AbstractEntity> dataModel;

	/** Metodo construtor padrao. */
	public TipoEquipamentoController() {
	}

	public String novo() {
		logger.info("Criando novo Tipo de Equipamento");
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		logger.info("Limpar dados do Tipo de Equipamento");
		model = new TipoEquipamento();
		return null;
	}

	private void insert() {
		logger.info("Salvar TipoEquipamento: " + this.model);
		equipamentoService.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		logger.info("Atualizar TipoEquipamento: " + this.model);
		equipamentoService.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		logger.info("Cancela a operacao de adicao/edicao");
		model = new TipoEquipamento();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaTipoEquipamento.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		logger.info("Excluir TipoEquipamento: " + this.model);
		try {
			equipamentoService.remover(model);

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
		logger.info("Salvar/Atualizar TipoEquipamento [ActionEvent]: " + evento);
		return add();
	}

	public String add() {
		logger.info("Salvar/Atualizar TipoEquipamento: " + this.model);

		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaTipoEquipamento.nicbrain";
	}

	public TipoEquipamento getModel() {
		logger.info("Obter: " + this.model);
		return model;
	}

	public void setModel(TipoEquipamento tipoEquipamento) {
		logger.info("Selecionar: " + tipoEquipamento);
		this.model = tipoEquipamento;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel getDataModel() {
		return this.dataModel;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> getListaTipoEquipamentos() {
		dataModel = new EntityDataModel<>(equipamentoService.obterTodos());
		return dataModel;
	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/TipoEquipamento.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		logger.info("Volta para a lista de TipoEquipamento");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaTipoEquipamento.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((TipoEquipamento) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((TipoEquipamento) event.getObject());
		avancaPagina();
	}
}