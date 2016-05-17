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
import br.com.kolss.model.entities.Segmento;
import br.com.kolss.service.FornecedorService;
import br.com.kolss.service.SegmentoService;


@Controller(value = "fornecedorBean")
@Scope("session")
public class FornecedorController {

	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	protected FornecedorService fornecedorService;
	
	@Autowired
	private SegmentoService segmentoService;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	private Fornecedor model = new Fornecedor();

	private List<Segmento> segmentos;

	@SuppressWarnings("rawtypes")
	private EntityDataModel<? extends AbstractEntity> dataModel;

	/** Metodo construtor padrao. */
	public FornecedorController() {
	}

	public String novo() {
		logger.info("Criando novo Fornecedor");
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		logger.info("Limpar dados do Fornecedor");
		model = new Fornecedor();
		return null;
	}

	private void insert() {
		logger.info("Salvar Fornecedor: " + this.model);
		fornecedorService.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		logger.info("Atualizar Fornecedor: " + this.model);
		fornecedorService.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		logger.info("Cancela a operacao de adicao/edicao");
		model = new Fornecedor();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaFornecedor.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		logger.info("Excluir Fornecedor: " + this.model);
		try {
			fornecedorService.remover(model);

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
		logger.info("Salvar/Atualizar Fornecedor[ActionEvent]: " + evento);
		return add();
	}

	public String add() {
		logger.info("Salvar/Atualizar Fornecedor: " + this.model);

		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaFornecedor.nicbrain";
	}

	public Fornecedor getModel() {
		logger.info("Obter: " + this.model);
		return model;
	}

	public void setModel(Fornecedor fornecedor) {
		logger.info("Selecionar: " + fornecedor);
		this.model = fornecedor;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel getDataModel() {
		return this.dataModel;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> getListaFornecedores() {
		dataModel = new EntityDataModel<>(fornecedorService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado()));
		return dataModel;
	}

	public List<Segmento> getSegmentos() {
	
		if(segmentos==null || segmentos.isEmpty()){
			segmentos = segmentoService.buscarTodos();
		}
		return segmentos;
	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/Fornecedor.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		logger.info("Volta para a lista de Fornecedor ");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaFornecedor.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Fornecedor) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Fornecedor) event.getObject());
		avancaPagina();
	}
}
