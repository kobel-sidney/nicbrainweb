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
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Departamento;
import br.com.kolss.service.DepartamentoService;


@Controller(value = "departamentoBean")
@Scope("session")
public class DepartamentoController {
	
	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private DepartamentoService departamentoService;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;
	
	private Contratante contratante;
	
	private Departamento model = new Departamento();

	@SuppressWarnings("rawtypes")
	private EntityDataModel<? extends AbstractEntity> dataModel;

	/** Metodo construtor padrao. */
	public DepartamentoController() {
	}

	public String novo() {
		logger.info("Criando novo Departamento");
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		logger.info("Limpar dados do Departamento");
		model = new Departamento();
		return null;
	}

	private void insert() {
		logger.info("Salvar Departamento: " + this.model);
		model.setContratante(getContrante());
		departamentoService.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		logger.info("Atualizar Departamento: " + this.model);
		model.setContratante(getContrante());
		departamentoService.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		logger.info("Cancela a operacao de adicao/edicao");
		model = new Departamento();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaDepartamento.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		logger.info("Excluir Departamento: " + this.model);
		try {
			model.setContratante(getContrante());
			departamentoService.remover(model);

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
		logger.info("Salvar/Atualizar Departamento[ActionEvent]: " + evento);
		return add();
	}

	public String add() {
		logger.info("Salvar/Atualizar Departamento: " + this.model);

		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaDepartamento.nicbrain";
	}

	public Departamento getModel() {
		logger.info("Obter: " + this.model);
		return model;
	}

	public void setModel(Departamento departamento) {
		logger.info("Selecionar: " + departamento);
		this.model = departamento;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel getDataModel() {
		return this.dataModel;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> getListaDepartamentos() {
		dataModel = new EntityDataModel<>(departamentoService.obterTodos(getContrante()));
		return dataModel;
	}

	private Contratante getContrante() {
		if(contratante==null){
			contratante = usuarioLogado.obterContratanteUsuarioLogado();
		}
		return contratante;
	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/Departamento.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		logger.info("Volta para a lista de Departamento ");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaDepartamento.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Departamento) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Departamento) event.getObject());
		avancaPagina();
	}
}