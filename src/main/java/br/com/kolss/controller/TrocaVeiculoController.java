package br.com.kolss.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.TrocaVeiculo;
import br.com.kolss.model.entities.Veiculo;
import br.com.kolss.service.PessoaService;
import br.com.kolss.service.TrocaVeiculoService;
import br.com.kolss.service.VeiculoService;
import br.com.kolss.util.FacesContextUtil;

@Controller(value = "trocaVeiculoBean")
@Scope("session")
public class TrocaVeiculoController {

	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired private TrocaVeiculoService trocaVeiculoService;
	@Autowired private VeiculoService veiculoService;
	@Autowired private PessoaService pessoaService;
	@Autowired private BbUsuarioLogado usuarioLogado;

	
	private EntityDataModel<TrocaVeiculo> dataModel;
	private Pessoa pessoaSelecionada = new Pessoa();
	private TrocaVeiculo model = new TrocaVeiculo();
	private List<Veiculo> veiculos;
	private List<Pessoa> pessoas;
	
	
	public void adicionarPessoa() {
		logger.info("Adicionando pessoa");
		if(pessoaSelecionada!=null && pessoaSelecionada.getId()!=null){
			pessoaSelecionada = pessoaService.obter(pessoaSelecionada.getId());
			model.getPessoas().add(pessoaSelecionada);
		}
		pessoaSelecionada = new Pessoa();
	}
	
	
	public void removerPessoa() {
		logger.info("Deletando pessoa");
		if(pessoaSelecionada!=null && pessoaSelecionada.getId()!=null){
			model.getPessoas().remove(pessoaSelecionada);
			pessoaSelecionada = new Pessoa();
		}	
		
	}

	public String novo() {
		logger.debug("Criando nova Troca Veiculo");
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		logger.debug("Limpar dados do Troca Veiculo");
		model = new TrocaVeiculo();
		pessoaSelecionada = new Pessoa();
		return null;
	}

	private void inserir() {
		logger.debug("Salvar Troca Veiculo: " + this.model);
		trocaVeiculoService.inserir(model);
		FacesContextUtil.addMessageInfo("", BbLocale.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY));
	}

	private void atualizar() {
		logger.debug("Atualizar Troca Veiculo: " + this.model);
		trocaVeiculoService.atualizar(model);
		FacesContextUtil.addMessageInfo("", BbLocale.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY));
	}

	public String cancel() {
		logger.debug("Cancela a operacao de adicao/edicao");
		model = new TrocaVeiculo();
		try {
			FacesContext.getCurrentInstance().getExternalContext().redirect("ListaTrocaVeiculo.nicbrain");
			} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void deletar() {
		logger.info("Excluir Veiculo: " + this.model);
		try {
			trocaVeiculoService.deletar(model);
			FacesContextUtil.addMessageInfo("", BbLocale.getI18nMessage(BbLocale.DELETE_SUCCESSFULLY));

		} catch (DataIntegrityViolationException ex) {
			FacesContextUtil.addMessageInfo("", BbLocale.getI18nMessage(BbLocale.CONSTRAINT_ERROR));
		}

	}

	public String add(ActionEvent evento) {
		logger.debug("Salvar/Atualizar Veiculo[ActionEvent]: " + evento);
		return add();
	}

	public String add() {
		logger.debug("Salvar/Atualizar Troca Veiculo: " + this.model);
			if(validarAntesInserir(model)){
				if (model.getId() == null || model.getId() == 0) {
					inserir();
				} else {
					atualizar();
				}
				limpar();
				return "/restrict/ListaTrocaVeiculo.nicbrain";
			}
		return "";
	}

	private boolean validarAntesInserir(TrocaVeiculo trocaVeiculo) {
		if(trocaVeiculo.getPessoas().size()==0){
			FacesContextUtil.addMessageError("", BbLocale.getI18nMessage("message.required_field.person_minimum"));
			return false;
		}
		return true;
	}

	public TrocaVeiculo getModel() {
		logger.info("Obter: " + this.model);
		return model;
	}

	public void setModel(TrocaVeiculo veiculo) {
		logger.info("Selecionar: " + veiculo);
		this.model = veiculo;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel getDataModel() {
		return this.dataModel;
	}

	public EntityDataModel<TrocaVeiculo> getListaTrocaVeiculos() {
		dataModel = new EntityDataModel<TrocaVeiculo>(trocaVeiculoService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado()));
		return dataModel;
	}

	public void avancaPagina() {
		logger.debug("Avancando para a pagina de edicao/adicao");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,"/restrict/TrocaVeiculo.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		logger.debug("Volta para a lista de Troca Veiculo ");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,"/restrict/ListaTrocaVeiculo.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		logger.debug("Seta o objeto selecionado na lista");
		setModel((TrocaVeiculo) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.debug("Seta o objeto selecionado na lista");
		setModel((TrocaVeiculo) event.getObject());
		avancaPagina();
	}

	public List<Veiculo> getVeiculos() {
		
		veiculos = veiculoService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado());
		
		if(veiculos==null){
			veiculos = new ArrayList<>();
		}
		return veiculos;
	}

	public List<Pessoa> getPessoas() {
		
		pessoas = pessoaService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado());
		
		if(pessoas==null){
			pessoas = new ArrayList<>();
		}
		
		return pessoas;
	}

	public Pessoa getPessoaSelecionada() {
		return pessoaSelecionada;
	}

	public void setPessoaSelecionada(Pessoa pessoaSelecioada) {
		this.pessoaSelecionada = pessoaSelecioada;
	}

}