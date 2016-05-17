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
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.datamodel.EntityDataModel;
import br.com.kolss.model.entities.AbstractEntity;
import br.com.kolss.model.entities.TelefoneUtil;
import br.com.kolss.service.TelefoneUtilService;


@Controller(value = "telefoneUtilBean")
@Scope("session")
public class TelefoneUtilController {
	
	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private TelefoneUtilService telefoneUtilService;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	private TelefoneUtil model = new TelefoneUtil();

	@SuppressWarnings("rawtypes")
	private EntityDataModel<? extends AbstractEntity> dataModel;

	/** Metodo construtor padrao. */
	public TelefoneUtilController() {
	}

	public String novo() {
		logger.info("Criando novo TelefoneUtil");
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		logger.info("Limpar dados do TelefoneUtil");
		model = new TelefoneUtil();
		return null;
	}

	private void insert() {
		logger.info("Salvar TelefoneUtil: " + this.model);
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		telefoneUtilService.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		logger.info("Atualizar TelefoneUtil: " + this.model);
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		telefoneUtilService.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		logger.info("Cancela a operacao de adicao/edicao");
		model = new TelefoneUtil();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaTelefoneUtil.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		logger.info("Excluir TelefoneUtil: " + this.model);
		try {
			telefoneUtilService.remover(model);

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
		logger.info("Salvar/Atualizar TelefoneUtil[ActionEvent]: " + evento);
		return add();
	}

	public String add() {
		logger.info("Salvar/Atualizar TelefoneUtil: " + this.model);

		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaTelefoneUtil.nicbrain";
	}

	public TelefoneUtil getModel() {
		logger.info("Obter: " + this.model);
		return model;
	}

	public void setModel(TelefoneUtil telefoneUtil) {
		logger.info("Selecionar: " + telefoneUtil);
		this.model = telefoneUtil;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel getDataModel() {
		return this.dataModel;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> getListaTelefonesUteis() {
		dataModel = new EntityDataModel<>(telefoneUtilService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado()));
		return dataModel;
	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/TelefoneUtil.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		logger.info("Volta para a lista de TelefoneUtil");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaTelefoneUtil.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((TelefoneUtil) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((TelefoneUtil) event.getObject());
		avancaPagina();
	}
}