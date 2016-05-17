package br.com.kolss.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;

import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import org.apache.log4j.Logger;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.datamodel.EntityDataModel;
import br.com.kolss.model.entities.AbstractEntity;
import br.com.kolss.model.entities.GravidadeOcorrencia;
import br.com.kolss.service.DadosMestresService;
import br.com.kolss.service.GravidadeOcorrenciaService;


@Controller(value = "gravidadeOcorrenciaBean")
@Scope("session")
public class GravidadeOcorrenciaController {
	
	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	protected DadosMestresService service;
	
	@Autowired
	private GravidadeOcorrenciaService gravidadeOcorrenciaService;

	private GravidadeOcorrencia model = new GravidadeOcorrencia();

	private EntityDataModel<? extends AbstractEntity> dataModel;

	private static StreamedContent image;

	/** Metodo construtor padrao. */
	public GravidadeOcorrenciaController() {
		image = new DefaultStreamedContent();
	}

	public String novo() {
		logger.info("Criando novo GravidadeOcorrencia");
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		logger.info("Limpar dados do GravidadeOcorrencia");
		model = new GravidadeOcorrencia();
		return null;
	}

	private void insert() {
		logger.info("Salvar GravidadeOcorrencia: " + this.model);
		service.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		logger.info("Atualizar GravidadeOcorrencia: " + this.model);
		service.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		logger.info("Cancela a operacao de adicao/edicao");
		model = new GravidadeOcorrencia();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaGravidadeOcorrencia.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		logger.info("Excluir GravidadeOcorrencia: " + this.model);
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

	public String add(ActionEvent evento) {
		logger.info("Salvar/Atualizar GravidadeOcorrencia[ActionEvent]: "
				+ evento);
		return add();
	}

	public String add() {
		logger.info("Salvar/Atualizar GravidadeOcorrencia: " + this.model);

		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaGravidadeOcorrencia.nicbrain";
	}

	public GravidadeOcorrencia getModel() {
		logger.info("Obter: " + this.model);
		return model;
	}

	public void setModel(GravidadeOcorrencia gravidadeOcorrencia) {
		logger.info("Selecionar: " + gravidadeOcorrencia);
		this.model = gravidadeOcorrencia;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel getDataModel() {
		return this.dataModel;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> getListaGravidadeOcorrencias() {
		dataModel = new EntityDataModel<>(
				gravidadeOcorrenciaService.obterTodos());
		return dataModel;
	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/GravidadeOcorrencia.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		logger.info("Volta para a lista de GravidadeOcorrencia");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaGravidadeOcorrencia.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((GravidadeOcorrencia) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((GravidadeOcorrencia) event.getObject());
		avancaPagina();
	}

	public StreamedContent getImage() {
		image = null;
		if (model.getIcone() != null) {
			image = new DefaultStreamedContent(new ByteArrayInputStream(
					model.getIcone()), null);
		}
		return image;
	}
}