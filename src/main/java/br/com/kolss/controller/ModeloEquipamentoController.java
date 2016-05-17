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
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.datamodel.EntityDataModel;
import br.com.kolss.model.entities.AbstractEntity;
import br.com.kolss.model.entities.Fornecedor;
import br.com.kolss.model.entities.ModeloEquipamento;
import br.com.kolss.model.entities.TipoEquipamento;
import br.com.kolss.service.FornecedorService;


@Controller(value = "modeloEquipamentoBean")
@Scope("session")
public class ModeloEquipamentoController {
	
	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private ModeloEquipamentoService modeloEquipamentoService;
	
	@Autowired
	private TipoEquipamentoService tipoEquipamentoService;

	@Autowired
	private FornecedorService fornecedorService;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	private ModeloEquipamento model = new ModeloEquipamento();

	// Lista que irá armazenar os TipoEquipametos vinculados aos
	private List<TipoEquipamento> tiposEquipamentos;

	// Lista que armazena os Fornecedores associados ao ModeloEquipamento
	private List<Fornecedor> fornecedores;

	// Lista que armazena os ModeloEquipamentos para a tela de listagem
	@SuppressWarnings("rawtypes")
	private EntityDataModel<? extends AbstractEntity> dataModel;

	/** Metodo construtor padrao. */
	public ModeloEquipamentoController() {
	}

	public String novo() {
		logger.info("Criando novo ModeloEquipamento");
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		logger.info("Limpar dados do ModeloEquipamento");
		model = new ModeloEquipamento();
		return null;
	}

	private void insert() {
		logger.info("Salvar ModeloEquipamento: " + this.model);
		modeloEquipamentoService.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		logger.info("Atualizar ModeloEquipamento: " + this.model);
		modeloEquipamentoService.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		logger.info("Cancela a operacao de adicao/edicao");
		model = new ModeloEquipamento();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaModeloEquipamento.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		logger.info("Excluir ModeloEquipamento: " + this.model);
		try {
			modeloEquipamentoService.remover(model);

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
		logger.info("Salvar/Atualizar ModeloEquipamento[ActionEvent]: "
				+ evento);
		return add();
	}

	public String add() {
		logger.info("Salvar/Atualizar ModeloEquipamento: " + this.model);

		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaModeloEquipamento.nicbrain";
	}

	public ModeloEquipamento getModel() {
		logger.info("Obter: " + this.model);
		return model;
	}

	public void setModel(ModeloEquipamento modeloEquipamento) {
		logger.info("Selecionar: " + modeloEquipamento);
		this.model = modeloEquipamento;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel getDataModel() {
		return this.dataModel;
	}

	// Popula a lista de ModeloEquipamento via service
	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> getListaModelosEquipamentos() {
		dataModel = new EntityDataModel<>(modeloEquipamentoService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado()));
		return dataModel;
	}

	// Popula o combobox de Fornecedor
	public List<Fornecedor> getFornecedores() {
		if(fornecedores==null || fornecedores.isEmpty()){
			fornecedores = fornecedorService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado());
		}
		return fornecedores;
	}

	// Popula o combobox de TipoEquipamento
	public List<TipoEquipamento> getTiposEquipamentos() {
		
		if(tiposEquipamentos==null || tiposEquipamentos.isEmpty()){
			tiposEquipamentos = tipoEquipamentoService.obterTodos();
		}
		
		return tiposEquipamentos;
	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ModeloEquipamento.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		logger.info("Volta para a lista de ModeloEquipamento ");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaModeloEquipamento.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((ModeloEquipamento) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((ModeloEquipamento) event.getObject());
		avancaPagina();
	}

}