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
import br.com.kolss.model.entities.Municipio;
import br.com.kolss.service.EstadoService;
import br.com.kolss.service.MunicipioService;


@Controller(value = "municipioBean")
@Scope("session")
public class MunicipioController {

	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private MunicipioService municipioService;
	
	@Autowired
	private EstadoService estadoService;

	private Municipio model = new Municipio();

	private List<Estado> estados;

	@SuppressWarnings("rawtypes")
	private EntityDataModel<? extends AbstractEntity> dataModel;

	/** Metodo construtor padrao. */
	public MunicipioController() {
	}

	public String novo() {
		logger.info("Criando novo Municipio");
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		logger.info("Limpar dados do Municipio");
		model = new Municipio();
		return null;
	}

	private void insert() {
		logger.info("Salvar Municipio: " + this.model);
		municipioService.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		logger.info("Atualizar Municipio: " + this.model);
		municipioService.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		logger.info("Cancela a operacao de adicao/edicao");
		model = new Municipio();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaMunicipio.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		logger.info("Excluir Municipio: " + this.model);
		try {
			municipioService.remover(model);

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
		logger.info("Salvar/Atualizar Municipio[ActionEvent]: " + evento);
		return add();
	}

	public String add() {
		logger.info("Salvar/Atualizar Municipio: " + this.model);

		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaMunicipio.nicbrain";
	}

	public Municipio getModel() {
		logger.info("Obter: " + this.model);
		return model;
	}

	public void setModel(Municipio municipio) {
		logger.info("Selecionar: " + municipio);
		this.model = municipio;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel getDataModel() {
		return this.dataModel;
	}

	// Popula a lista de Municipios via service
	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> getListaMunicipios() {
		dataModel = new EntityDataModel<>(municipioService.obterTodos());
		return dataModel;
	}

	// Popula a combobox de Estados via service
	public List<Estado> getEstados() {
		
		if(estados==null || estados.isEmpty()){
			estados = estadoService.obterTodos();
		}
		return estados;
	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/Municipio.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		logger.info("Volta para a lista de Municipio ");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaMunicipio.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Municipio) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Municipio) event.getObject());
		avancaPagina();
	}
}