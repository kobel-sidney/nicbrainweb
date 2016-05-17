package br.com.kolss.model.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;


@Entity
@Table(name = "cliente")
public class Cliente extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -8631643435763493482L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_cliente", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "razao_social", nullable = false)
	private String razaoSocial;
	
	
	@Column(name = "nome_fantasia", nullable = true)
	private String nomeFantasia;
	
	
	@Column(name = "cnpj", nullable = false)
	private String cnpj;
	
	
	@Column(name = "ie", nullable = true)
	private String ie;
	
	
	@Column(name = "site", nullable = true)
	private String site;
	
	@Lob
	@Basic(optional = true, fetch = FetchType.LAZY)
	@Column(name = "logo", nullable = true)
	private byte[] logo;

	
	@Column(name = "nome_contato", nullable = false)
	private String nomeContato;
	
	
	@Column(name = "telefone_contato", nullable = false)
	private String telefoneContato;

	
	@Column(name = "celular_contato", nullable = true)
	private String celularContato;

	
	@Column(name = "email_contato", nullable = true)
	private String emailContato;
	
	
	@Column(name = "ativo", nullable = false)
	private boolean ativo = false;
	
	@Temporal(TemporalType.TIMESTAMP)
	
	@Column(name = "data_cadastro", nullable = true)
	private Date dataCadastro;
	
	@ManyToOne(fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name = "id_contratante", nullable = true)
	private Contratante contratante = new Contratante();
	
	@OneToMany(mappedBy = "cliente", fetch = FetchType.LAZY)
	private Set<Pessoa> pessoas = new HashSet<Pessoa>();
	
	@OneToMany(mappedBy = "cliente", fetch = FetchType.LAZY)
	private Set<Usuario> usuarios = new HashSet<Usuario>();

	@OneToMany(mappedBy = "cliente", fetch = FetchType.LAZY)
	private Set<Local> locais = new HashSet<Local>();
	
	@OneToMany(mappedBy = "cliente", fetch = FetchType.LAZY)
	private Set<Endereco> enderecos = new HashSet<Endereco>();
	
	@OneToMany(mappedBy = "cliente", fetch = FetchType.LAZY)
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private Set<ChecklistPadraoCliente> checklistsPadraoClientes =
			new HashSet<ChecklistPadraoCliente>();

	@OneToMany(mappedBy = "cliente", fetch = FetchType.LAZY)
	@Cascade({CascadeType.DELETE})
	private List<ClienteMensagem> clientesMensagens = new ArrayList<>();
	
	@OneToMany(mappedBy = "cliente", fetch = FetchType.LAZY)
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private Set<ProcedimentoCliente> procedimentosClientes =
			new HashSet<ProcedimentoCliente>();
	
	@ManyToMany(mappedBy = "clientes", fetch = FetchType.LAZY)
	private Set<ClassificacaoOcorrencia> classificacoesOcorrencias =
			new HashSet<ClassificacaoOcorrencia>();
	
	
	/** Método Construtor padrão. */
	public Cliente() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param razaoSocial
	 * @param cnpj
	 * @param nomeContato
	 * @param telefoneContato
	 * @param ativo
	 */
	public Cliente(Long id, String razaoSocial, String cnpj,
			String nomeContato, String telefoneContato, boolean ativo) {
		this(id, razaoSocial, null, cnpj, null, null, null, nomeContato,
				telefoneContato, null, null, null, null, ativo);
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param razaoSocial
	 * @param nomeFantasia
	 * @param cnpj
	 * @param ie
	 * @param site
	 * @param logo
	 * @param nomeContato
	 * @param telefoneContato
	 * @param celularContato
	 * @param emailContato
	 * @param dataCadastro
	 * @param contratante
	 * @param ativo
	 */
	public Cliente(Long id, String razaoSocial, String nomeFantasia,
			String cnpj, String ie, String site, byte[] logo, String nomeContato,
			String telefoneContato, String celularContato, String emailContato,
			Date dataCadastro, Contratante contratante, boolean ativo) {
		this();
		this.id = id;
		this.razaoSocial = razaoSocial;
		this.nomeFantasia = nomeFantasia;
		this.cnpj = cnpj;
		this.ie = ie;
		this.site = site;
		this.logo = logo;
		this.nomeContato = nomeContato;
		this.telefoneContato = telefoneContato;
		this.celularContato = celularContato;
		this.emailContato = emailContato;
		this.ativo = ativo;
		this.dataCadastro = dataCadastro;
		this.contratante = contratante;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (ativo ? 1231 : 1237);
		result = prime * result
				+ ((celularContato == null) ? 0 : celularContato.hashCode());
		result = prime * result + ((cnpj == null) ? 0 : cnpj.hashCode());
		result = prime * result
				+ ((contratante == null) ? 0 : contratante.hashCode());
		result = prime * result
				+ ((dataCadastro == null) ? 0 : dataCadastro.hashCode());
		result = prime * result
				+ ((emailContato == null) ? 0 : emailContato.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((ie == null) ? 0 : ie.hashCode());
		result = prime * result
				+ ((nomeContato == null) ? 0 : nomeContato.hashCode());
		result = prime * result
				+ ((nomeFantasia == null) ? 0 : nomeFantasia.hashCode());
		result = prime * result
				+ ((razaoSocial == null) ? 0 : razaoSocial.hashCode());
		result = prime * result + ((site == null) ? 0 : site.hashCode());
		result = prime * result
				+ ((telefoneContato == null) ? 0 : telefoneContato.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cliente other = (Cliente) obj;
		if (ativo != other.ativo)
			return false;
		if (celularContato == null) {
			if (other.celularContato != null)
				return false;
		} else if (!celularContato.equals(other.celularContato))
			return false;
		if (cnpj == null) {
			if (other.cnpj != null)
				return false;
		} else if (!cnpj.equals(other.cnpj))
			return false;
		if (contratante == null) {
			if (other.contratante != null)
				return false;
		} else if (!contratante.equals(other.contratante))
			return false;
		if (dataCadastro == null) {
			if (other.dataCadastro != null)
				return false;
		} else if (!dataCadastro.equals(other.dataCadastro))
			return false;
		if (emailContato == null) {
			if (other.emailContato != null)
				return false;
		} else if (!emailContato.equals(other.emailContato))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (ie == null) {
			if (other.ie != null)
				return false;
		} else if (!ie.equals(other.ie))
			return false;
		if (nomeContato == null) {
			if (other.nomeContato != null)
				return false;
		} else if (!nomeContato.equals(other.nomeContato))
			return false;
		if (nomeFantasia == null) {
			if (other.nomeFantasia != null)
				return false;
		} else if (!nomeFantasia.equals(other.nomeFantasia))
			return false;
		if (razaoSocial == null) {
			if (other.razaoSocial != null)
				return false;
		} else if (!razaoSocial.equals(other.razaoSocial))
			return false;
		if (site == null) {
			if (other.site != null)
				return false;
		} else if (!site.equals(other.site))
			return false;
		if (telefoneContato == null) {
			if (other.telefoneContato != null)
				return false;
		} else if (!telefoneContato.equals(other.telefoneContato))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "Cliente [id=" + id
				+ ", razaoSocial=" + razaoSocial
				+ ", nomeFantasia=" + nomeFantasia
				+ ", cnpj=" + cnpj
				+ ", ie=" + ie
				+ ", site=" + site
				+ ", nomeContato=" + nomeContato
				+ ", telefoneContato=" + telefoneContato
				+ ", celularContato=" + celularContato
				+ ", emailContato=" + emailContato
				+ ", ativo=" + ativo
				+ ", dataCadastro=" + dataCadastro
				+ ", contratante=" + contratante
				+ "]";
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getRazaoSocial() {
		return razaoSocial;
	}
	
	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}
	
	public String getNomeFantasia() {
		return nomeFantasia;
	}
	
	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}
	
	public String getCnpj() {
		return cnpj;
	}
	
	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}
	
	public String getIe() {
		return ie;
	}
	
	public void setIe(String ie) {
		this.ie = ie;
	}
	
	public String getSite() {
		return site;
	}
	
	public void setSite(String site) {
		this.site = site;
	}
	
	public byte[] getLogo() {
		return logo;
	}
	
	public void setLogo(byte[] logo) {
		this.logo = logo;
	}
	
	public String getNomeContato() {
		return nomeContato;
	}
	
	public void setNomeContato(String nomeContato) {
		this.nomeContato = nomeContato;
	}
	
	public String getTelefoneContato() {
		return telefoneContato;
	}
	
	public void setTelefoneContato(String telefoneContato) {
		this.telefoneContato = telefoneContato;
	}
	
	public String getCelularContato() {
		return celularContato;
	}
	
	public void setCelularContato(String celularContato) {
		this.celularContato = celularContato;
	}
	
	public String getEmailContato() {
		return emailContato;
	}
	
	public void setEmailContato(String emailContato) {
		this.emailContato = emailContato;
	}
	
	public boolean isAtivo() {
		return ativo;
	}
	
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	
	public Date getDataCadastro() {
		return dataCadastro;
	}
	
	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	
	public Contratante getContratante() {
		return contratante;
	}
	
	public void setContratante(Contratante contratante) {
		this.contratante = contratante;
	}
	
	public Set<Endereco> getEnderecos() {
		return enderecos;
	}
	
	public List<ClienteMensagem> getClientesMensagens() {
		return clientesMensagens;
	}

	public void setClientesMensagens(List<ClienteMensagem> clientesMensagens) {
		this.clientesMensagens = clientesMensagens;
	}

	public void setEnderecos(Set<Endereco> enderecos) {
		this.enderecos = enderecos;
	}
	
	public Set<Local> getLocais() {
		return locais;
	}
	
	public void setLocais(Set<Local> locais) {
		this.locais = locais;
	}
	
	public Set<Usuario> getUsuarios() {
		return usuarios;
	}
	
	public void setUsuarios(Set<Usuario> usuarios) {
		this.usuarios = usuarios;
	}
	
	public Set<Pessoa> getPessoas() {
		return pessoas;
	}
	
	public void setPessoas(Set<Pessoa> pessoas) {
		this.pessoas = pessoas;
	}
	
	public Set<ClassificacaoOcorrencia> getClassificacoesOcorrencias() {
		return classificacoesOcorrencias;
	}
	
	public void setClassificacoesOcorrencias(
			Set<ClassificacaoOcorrencia> classificacoesOcorrencias) {
		this.classificacoesOcorrencias = classificacoesOcorrencias;
	}
	
	public Set<ProcedimentoCliente> getProcedimentosClientes() {
		return procedimentosClientes;
	}
	
	public void setProcedimentosClientes(
			Set<ProcedimentoCliente> procedimentosClientes) {
		this.procedimentosClientes = procedimentosClientes;
	}
	
	public Set<ChecklistPadraoCliente> getChecklistsPadraoClientes() {
		return checklistsPadraoClientes;
	}
	
	public void setChecklistsPadraoClientes(Set<ChecklistPadraoCliente> checklistsClientes) {
		this.checklistsPadraoClientes = checklistsClientes;
	}
	
}
