package br.com.kolss.controller;

import java.io.ByteArrayInputStream;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.AjaxBehaviorEvent;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.event.FlowEvent;
import org.primefaces.event.SelectEvent;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.EmailPessoa;
import br.com.kolss.model.entities.Endereco;
import br.com.kolss.model.entities.Estado;
import br.com.kolss.model.entities.Municipio;
import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.TelefonePessoa;
import br.com.kolss.service.EmailPessoaService;
import br.com.kolss.service.EnderecoService;
import br.com.kolss.service.MunicipioService;
import br.com.kolss.service.PessoaService;
import br.com.kolss.service.TelefonePessoaService;
import br.com.kolss.util.FacesUtil;

@Controller(value = "pessoaBean")
@Scope("session")
public class PessoaController {

	private Pessoa pessoa;
	private Endereco endereco;
	private TelefonePessoa telefone;
	private EmailPessoa email;
	private List<Municipio> municipios;
	private List<Endereco> enderecos;
	private List<TelefonePessoa> telefones;
	private List<EmailPessoa> emails;
	private long idUf;
	private boolean municipioHabilitado;
	private boolean gridEndereco;
	private boolean gridTelefone;

	@Autowired
	private PessoaService pessoaPervice;

	@Autowired
	private EnderecoService enderecoService;

	@Autowired
	private MunicipioService municipioService;

	@Autowired
	private TelefonePessoaService telefonePessoaService;

	@Autowired
	private EmailPessoaService emailPessoaService;

	@PostConstruct
	public void init() {
		this.pessoa = new Pessoa();
		this.endereco = new Endereco();
		this.telefone = new TelefonePessoa();
		this.email = new EmailPessoa();
		this.enderecos = new ArrayList<>();
		this.telefones = new ArrayList<>();
		this.emails = new ArrayList<>();
		this.municipioHabilitado = true;
		this.setGridEndereco(true);
		this.setGridTelefone(true);
	}

	public void handleFileUpload(FileUploadEvent event) {
		byte bytes[] = event.getFile().getContents();
		pessoa.setFoto(bytes);
		if (!pessoa.isNew()) {
			try {
				pessoaPervice.salvar(pessoa);
				pessoa = pessoaPervice.obter(pessoa.getId());
			} catch (Exception e) {
				FacesUtil.addErrorMessage(e.getMessage());
			}
		}
	}
	
	public long getFotoId() {
		return new SecureRandom().nextLong();
	}

	public String avancarTab(FlowEvent event) {
		if (event.getNewStep().equals("address")) {
			try {
				pessoaPervice.salvar(pessoa);
				pessoa = pessoaPervice.obter(pessoa.getId());
			} catch (Exception e) {
				FacesUtil.addErrorMessage(e.getMessage());
				return event.getOldStep();
			}

			this.enderecos = listarEnderecos();
		} else if (event.getNewStep().equals("telefone") && enderecos.isEmpty()) {
			FacesUtil.addWarnMessage("Adicione ao menos um endereço para prosseguir.");
			habilitarGridEndereco();
			return event.getOldStep();
		}

		return event.getNewStep();
	}

	public void excluirPessoa() {
		try {
			pessoaPervice.excluir(pessoa);
		} catch (Exception e) {
			FacesUtil.addWarnMessage(e.getMessage());
		}
	}

	private void limparCamposPessoa() {
		this.pessoa = new Pessoa();
	}

	public void rowPessoaSelect(SelectEvent event) {
		this.pessoa = (Pessoa) event.getObject();
		/*
		 * foto = new DefaultStreamedContent(new
		 * ByteArrayInputStream(this.pessoa.getFoto()));
		 */
		irParaEdicao();
	}

	public boolean isCampoAtivoHabilitado() {
		return !pessoa.isNew();
	}

	// Métodos de endereco
	public void salvarEndereco() {
		endereco.setPessoa(pessoa);
		endereco.getMunicipio().getEstado().setId(idUf);
		enderecoService.salvar(endereco);

		enderecos = listarEnderecos();
		habilitarOuDesabilitarMunicipio();
	}

	public void excluirEndereco() {
		if (enderecos.size() == 1) {
			FacesUtil.addWarnMessage(
					"Não é possível excluir o único endereço. Salve um novo endereço e tente novamente.");
		} else {
			try {
				enderecoService.remover(endereco);
			} catch (Exception e) {
				FacesUtil.addWarnMessage(e.getMessage());
			}
		}
		this.enderecos = listarEnderecos();
	}

	public void cancelarEndereco() {
		this.enderecos = listarEnderecos();
		habilitarOuDesabilitarMunicipio();
	}

	private List<Endereco> listarEnderecos() {
		limparCamposEndereco();
		return enderecoService.listarPorPessoa(pessoa);
	}

	private void limparCamposEndereco() {
		this.idUf = -1;
		this.endereco = new Endereco();
	}

	public void rowEnderecoSelect(SelectEvent event) {
		this.endereco = (Endereco) event.getObject();
		this.idUf = endereco.getMunicipio().getEstado().getId();
		habilitarOuDesabilitarMunicipio();
	}

	public void filtrarCidades(AjaxBehaviorEvent event) {

	}

	public void habilitarGridEndereco() {
		this.gridEndereco = true;
	}

	public void desabilitarGridEndereco() {
		this.gridEndereco = false;
		this.telefones = listarTelefones();
		this.gridTelefone = true;
	}

	public boolean isEditandoEndereco() {
		return !endereco.isNew();
	}

	public boolean isNovoEndereco() {
		return endereco.isNew();
	}

	// Métodos de Telefone
	public void salvarTelefone() {
		telefone.setPessoa(pessoa);
		telefonePessoaService.salvar(telefone);

		telefones = listarTelefones();
	}

	public void excluirTelefone() {
		try {
			telefonePessoaService.excluir(telefone);
			this.telefones = listarTelefones();
		} catch (Exception e) {
			FacesUtil.addWarnMessage(e.getMessage());
		}
	}

	public void cancelarTelefone() {
		this.telefones = listarTelefones();
	}

	private List<TelefonePessoa> listarTelefones() {
		limparCamposTelefone();
		return telefonePessoaService.listarPorPessoa(pessoa);
	}

	private void limparCamposTelefone() {
		this.telefone = new TelefonePessoa();
	}

	public void rowTelefoneSelect(SelectEvent event) {
		this.telefone = (TelefonePessoa) event.getObject();
	}

	public void habilitarGridTelefone() {
		this.gridTelefone = true;
	}

	public void desabilitarGridTelefone() {
		this.gridTelefone = false;
		this.emails = listarEmails();
	}

	public boolean isEditandoTelefone() {
		return !telefone.isNew();
	}

	public boolean isNovoTelefone() {
		return telefone.isNew();
	}

	// Métodos de Email
	public void salvarEmail() {
		email.setPessoa(pessoa);
		emailPessoaService.salvar(email);

		emails = listarEmails();
	}

	public void excluirEmail() {
		try {
			emailPessoaService.excluir(email);
			this.emails = listarEmails();
		} catch (Exception e) {
			FacesUtil.addWarnMessage(e.getMessage());
		}
	}

	public void cancelarEmail() {
		this.emails = listarEmails();
	}

	private List<EmailPessoa> listarEmails() {
		limparCamposEmail();
		return emailPessoaService.listarPorPessoa(pessoa);
	}

	private void limparCamposEmail() {
		this.email = new EmailPessoa();
	}

	public void rowEmailSelect(SelectEvent event) {
		this.email = (EmailPessoa) event.getObject();
	}

	public boolean isEditandoEmail() {
		return !email.isNew();
	}

	public boolean isNovoEmail() {
		return email.isNew();
	}

	public void complete() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/ListaPessoa.nicbrain?faces-redirect=true");
	}

	public void irParaEdicao() {
		avancarPagina();
	}

	public void irParaCadastro() {
		limparCamposPessoa();

		avancarPagina();
	}

	private void avancarPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/Pessoa.nicbrain?faces-redirect=true");
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public Long getIdUf() {
		return idUf;
	}

	public void setIdUf(Long idUf) {
		this.idUf = idUf;
		habilitarOuDesabilitarMunicipio();
	}

	public boolean isMunicipioHabilitado() {
		return municipioHabilitado;
	}

	public void setMunicipioHabilitado(boolean municipioHabilitado) {
		this.municipioHabilitado = municipioHabilitado;
	}

	private void habilitarOuDesabilitarMunicipio() {
		if (idUf == -1) {
			municipioHabilitado = true;
		} else {
			Estado estado = new Estado(idUf);
			municipios = municipioService.obterPorEstado(estado);
			municipioHabilitado = false;
		}
	}

	public void filtrarCidade() {
		if (idUf == -1) {
			municipioHabilitado = true;
		} else {
			Estado estado = new Estado(idUf);
			municipios = municipioService.obterPorEstado(estado);
			municipioHabilitado = false;
		}
	}

	public List<Municipio> getMunicipios() {
		return municipios;
	}

	public void setMunicipios(List<Municipio> municipios) {
		this.municipios = municipios;
	}

	public List<Endereco> getEnderecos() {
		return enderecos;
	}

	public void setEnderecos(List<Endereco> enderecos) {
		this.enderecos = enderecos;
	}

	public boolean isGridEndereco() {
		return gridEndereco;
	}

	public void setGridEndereco(boolean gridEndereco) {
		this.gridEndereco = gridEndereco;
	}

	public List<TelefonePessoa> getTelefones() {
		return telefones;
	}

	public void setTelefones(List<TelefonePessoa> telefones) {
		this.telefones = telefones;
	}

	public TelefonePessoa getTelefone() {
		return telefone;
	}

	public void setTelefone(TelefonePessoa telefone) {
		this.telefone = telefone;
	}

	public boolean isGridTelefone() {
		return gridTelefone;
	}

	public void setGridTelefone(boolean gridTelefone) {
		this.gridTelefone = gridTelefone;
	}

	public EmailPessoa getEmail() {
		return email;
	}

	public void setEmail(EmailPessoa email) {
		this.email = email;
	}

	public List<EmailPessoa> getEmails() {
		return emails;
	}

	public void setEmails(List<EmailPessoa> emails) {
		this.emails = emails;
	}

	public StreamedContent getFoto() {
		if (pessoa.getFoto() != null)
			return new DefaultStreamedContent(new ByteArrayInputStream(pessoa.getFoto()));
		
		return null;
	}
	
	public long getParametroFoto() {
		return System.currentTimeMillis();
	}
}
