package br.com.kolss.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.primefaces.event.SelectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Email;
import br.com.kolss.model.entities.PessoaNovoModelo;
import br.com.kolss.service.ContatoService;
import br.com.kolss.service.EmailService;
import br.com.kolss.util.FacesUtil;

@Controller(value = "emailBean")
@Scope("session")
public class EmailController {

	private List<Email> emails;
	private Email email;
	private PessoaNovoModelo pessoa;

	@Autowired
	private EmailService service;

	@Autowired
	private ContatoService contatoService;

	@PostConstruct
	public void init() {
		this.emails = new ArrayList<Email>();
		this.email = new Email();
		this.pessoa = new PessoaNovoModelo();
	}

	public void salvar() {
		try {
			service.adicionar(email, pessoa);
		} catch (ServiceException e) {
			FacesUtil.addErrorMessage(e.getMessage());
		}

		listarEmailPorPessoa();
	}

	public void remover() {
		this.service.remover(email);

		listarEmailPorPessoa();
	}

	public void cancelar() {
		listarEmailPorPessoa();
	}

	public void limparCampos() {
		this.email = new Email();
	}

	public void listarEmailPorPessoa() {
		limparCampos();
		this.emails = service.listarPorPessoa(pessoa);
	}

	public List<Email> getEmails() {
		return emails;
	}

	public void setEmails(List<Email> emails) {
		this.emails = emails;
	}

	public Email getEmail() {
		return email;
	}

	public void setEmail(Email email) {
		this.email = email;
	}

	public PessoaNovoModelo getPessoa() {
		return pessoa;
	}

	public void setPessoa(PessoaNovoModelo pessoa) {
		this.pessoa = pessoa;
	}

	public void rowSelect(SelectEvent event) {
		this.email = (Email) event.getObject();
	}

	public boolean isEditando() {
		return !email.isNew();
	}

	public boolean isNovo() {
		return email.isNew();
	}
}
