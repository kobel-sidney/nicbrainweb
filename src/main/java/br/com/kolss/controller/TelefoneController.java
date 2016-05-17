package br.com.kolss.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import org.primefaces.event.SelectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.PessoaNovoModelo;
import br.com.kolss.model.entities.Telefone;
import br.com.kolss.service.TelefoneService;
import br.com.kolss.util.FacesUtil;

@Controller(value = "telefoneBean")
@Scope("session")
public class TelefoneController {

	private List<Telefone> telefones;
	private Telefone telefone;
	private PessoaNovoModelo pessoa;
	private boolean gridAbilitada;

	@Autowired
	private TelefoneService service;

	@PostConstruct
	public void init() {
		this.telefones = new ArrayList<>();
		this.telefone = new Telefone();
		this.pessoa = new PessoaNovoModelo();
		this.gridAbilitada = true;
	}

	public void salvar() {
		try {
			service.adicionar(telefone, pessoa);
		} catch (ServiceException e) {
			FacesUtil.addErrorMessage(e.getMessage());
		}

		listarTelPorPessoa();
	}

	public void remover() {
		this.service.remover(telefone);

		listarTelPorPessoa();
	}

	public void cancelar() {
		listarTelPorPessoa();
	}

	public void limparCampos() {
		this.telefone = new Telefone();
	}

	public void listarTelPorPessoa() {
		abilitaGrid();
		limparCampos();
		this.telefones = service.listarPorPessoa(pessoa);
	}

	public void exporPessoa() {
		ExternalContext externalContext = obterExternalContext();
		externalContext.getFlash().put("pessoa", pessoa);
		externalContext.getFlash().setKeepMessages(true);
		desabilitaGrid();
	}

	private ExternalContext obterExternalContext() {
		FacesContext instance = FacesContext.getCurrentInstance();
		ExternalContext externalContext = instance.getExternalContext();
		return externalContext;
	}

	public List<Telefone> getTelefones() {
		return telefones;
	}

	public void setTelefones(List<Telefone> telefones) {
		this.telefones = telefones;
	}

	public Telefone getTelefone() {
		return telefone;
	}

	public void setTelefone(Telefone telefone) {
		this.telefone = telefone;
	}

	public PessoaNovoModelo getPessoa() {
		return pessoa;
	}

	public void setPessoa(PessoaNovoModelo pessoa) {
		this.pessoa = pessoa;
	}

	public boolean isGridAbilitada() {
		return gridAbilitada;
	}

	public void abilitaGrid() {
		this.gridAbilitada = true;
	}

	public void desabilitaGrid() {
		this.gridAbilitada = false;
	}

	public void rowSelect(SelectEvent event) {
		this.telefone = (Telefone) event.getObject();
	}

	public boolean isEditando() {
		return !telefone.isNew();
	}

	public boolean isNovo() {
		return telefone.isNew();
	}
}
