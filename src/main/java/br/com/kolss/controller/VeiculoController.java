package br.com.kolss.controller;

import java.io.IOException;
import java.util.List;

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
import br.com.kolss.model.entities.TipoVeiculo;
import br.com.kolss.model.entities.Veiculo;
import br.com.kolss.service.TipoVeiculoService;
import br.com.kolss.service.VeiculoService;
import br.com.kolss.util.FacesContextUtil;

@Controller(value = "veiculoBean")
@Scope("session")
public class VeiculoController {

	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired private VeiculoService veiculoService;
	@Autowired private TipoVeiculoService tipoVeiculoService;
	@Autowired private BbUsuarioLogado usuarioLogado;
		
	private Veiculo model = new Veiculo();
	private EntityDataModel<Veiculo> dataModel;
	private List<TipoVeiculo> veiculoTipos;
	

	/** Metodo construtor padrao. */
	public VeiculoController() {
		
	}

	public String novo() {
		logger.info("Criando novo Veiculo");
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		logger.info("Limpar dados do Veiculo");
		model = new Veiculo();
		return null;
	}

	private void inserir() {
		logger.info("Salvar Veiculo: " + this.model);
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		veiculoService.inserir(model);
		FacesContextUtil.addMessageInfo("",BbLocale.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY));
	}

	private void atualizar() {
		logger.info("Atualizar Veiculo: " + this.model);
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		veiculoService.atualizar(model);
		FacesContextUtil.addMessageInfo("" ,BbLocale.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY));
	}

	public String cancel() {
		logger.info("Cancela a operacao de adicao/edicao");
		model = new Veiculo();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaVeiculo.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public void deletar() {
		logger.info("Excluir Veiculo: " + this.model);
		try {
			veiculoService.deletar(model);
			FacesContextUtil.addMessageInfo("" , BbLocale.getI18nMessage(BbLocale.DELETE_SUCCESSFULLY));

		} catch (DataIntegrityViolationException ex) {
			FacesContextUtil.addMessageError("" ,BbLocale.getI18nMessage(BbLocale.CONSTRAINT_ERROR));
		}

	}

	public String add(ActionEvent evento) {
		logger.info("Salvar/Atualizar Veiculo[ActionEvent]: " + evento);
		return add();
	}

	public String add() {
		logger.info("Salvar/Atualizar Veiculo: " + this.model);

		if (model.getId() == null || model.getId() == 0) {
			inserir();
		} else {
			atualizar();
		}
		limpar();
		return "/restrict/ListaVeiculo.nicbrain";
	}

	public Veiculo getModel() {
		logger.info("Obter: " + this.model);
		return model;
	}

	public void setModel(Veiculo veiculo) {
		logger.info("Selecionar: " + veiculo);
		this.model = veiculo;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel getDataModel() {
		return this.dataModel;
	}

	// Popula a lista de Veiculo via service
	public EntityDataModel<Veiculo> getListaVeiculos() {
		dataModel = new EntityDataModel<>(veiculoService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado()));
		return dataModel;
	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,"/restrict/Veiculo.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		logger.info("Volta para a lista de Veiculo ");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,"/restrict/ListaVeiculo.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Veiculo) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Veiculo) event.getObject());
		avancaPagina();
	}

	public List<TipoVeiculo> getVeiculoTipos() {
		veiculoTipos = tipoVeiculoService.obterTodos();
		return veiculoTipos;
	}

}