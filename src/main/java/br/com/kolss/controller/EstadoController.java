package br.com.kolss.controller;

import java.io.IOException;
import java.util.List;

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
import br.com.kolss.model.entities.Estado;
import br.com.kolss.service.EstadoService;
import br.com.kolss.service.PaisService;


@Controller(value = "estadoBean")
@Scope("session")
public class EstadoController {
	
	private Logger logger = Logger.getLogger(this.getClass());

	private Estado model = new Estado();

	@SuppressWarnings({ "rawtypes", "unused" })
	private List<? extends AbstractEntity> paises;

	@SuppressWarnings("rawtypes")
	private EntityDataModel<? extends AbstractEntity> dataModel;
	
	@Autowired
	private EstadoService estadoService;
	
	@Autowired
	private PaisService  paisService;

	/** Metodo construtor padrao. */
	public EstadoController() {
	}

	public String novo() {
		logger.info("Criando novo Estado");
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		logger.info("Limpar dados do Estado");
		model = new Estado();
		return null;
	}

	private void insert() {
		logger.info("Salvar Estado: " + this.model);
		estadoService.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		logger.info("Atualizar Estado: " + this.model);
		estadoService.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		logger.info("Cancela a operacao de adicao/edicao");
		model = new Estado();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaEstado.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		logger.info("Excluir Estado: " + this.model);
		try {
			estadoService.remover(model);

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
		logger.info("Salvar/Atualizar Estado[ActionEvent]: " + evento);
		return add();
	}

	public String add() {
		logger.info("Salvar/Atualizar Estado: " + this.model);

		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaEstado.nicbrain";
	}

	public Estado getModel() {
		logger.info("Obter: " + this.model);
		return model;
	}

	public void setModel(Estado estado) {
		logger.info("Selecionar: " + estado);
		this.model = estado;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel getDataModel() {
		return this.dataModel;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> getListaEstados() {
		dataModel = new EntityDataModel<>(estadoService.obterTodos());
		return dataModel;
	}

	@SuppressWarnings("rawtypes")
	public List<? extends AbstractEntity> getPaises() {
		return paises = paisService.obterTodos();

	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/Estado.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		logger.info("Volta para a lista de Estado ");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaEstado.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Estado) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Estado) event.getObject());
		avancaPagina();
	}

}