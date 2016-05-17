package br.com.kolss.model.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "contratante")
public class Contratante extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 1212267821166348635L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_contratante", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "ativo", nullable = false)
	private boolean ativo = false;
	
	
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
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_segmento", nullable = true)
	private Segmento segmento = new Segmento();
	
	
	@Column(name = "observacao", nullable = true)
	private String observacao;
	
	@Temporal(TemporalType.TIMESTAMP)
	
	@Column(name = "data_cadastro", nullable = true)
	private Date dataCadastro;
	
	@OneToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_config_email", nullable = true)
	private ConfiguracaoEmail configuracaoEmail;
	
	@OneToMany(mappedBy = "contratante", fetch = FetchType.LAZY)
	private Set<Cliente> clientes = new HashSet<Cliente>();
	
	@OneToMany(mappedBy = "contratante", fetch = FetchType.LAZY)
	private Set<Endereco> enderecos = new HashSet<Endereco>();
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "modulo",
			joinColumns = @JoinColumn(name = "id_contratante"),
			inverseJoinColumns = @JoinColumn(name = "id_menu"))
	private Set<Menu> menus = new HashSet<Menu>();
	
	
	/** Método Construtor padrão. */
	public Contratante() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param razaoSocial
	 * @param cnpj
	 * @param nomeContato
	 * @param telefoneContato
	 */
	public Contratante(Long id, String razaoSocial, String cnpj,
			String nomeContato, String telefoneContato) {
		this(id, razaoSocial, null, cnpj, null, null, null, nomeContato,
				telefoneContato, null, null, null, null, null, null);
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
	 * @param observacao
	 * @param dataCadastro
	 * @param configuracaoEmail
	 * @param segmento
	 */
	public Contratante(Long id, String razaoSocial, String nomeFantasia,
			String cnpj, String ie, String site, byte[] logo,
			String nomeContato, String telefoneContato, String celularContato,
			String emailContato, String observacao, Date dataCadastro,
			ConfiguracaoEmail configuracaoEmail, Segmento segmento) {
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
		this.segmento = segmento;
		this.observacao = observacao;
		this.dataCadastro = dataCadastro;
		this.configuracaoEmail = configuracaoEmail;
	}
	

	
	@Override
	public String toString() {
		return "Contratante [id=" + id
				+ ", razaoSocial=" + razaoSocial
				+ ", nomeFantasia=" + nomeFantasia
				+ ", cnpj=" + cnpj
				+ ", ie=" + ie
				+ ", site=" + site
				+ ", nomeContato=" + nomeContato
				+ ", telefoneContato=" + telefoneContato
				+ ", celularContato=" + celularContato
				+ ", emailContato=" + emailContato
				+ ", segmento=" + segmento
				+ ", observacao=" + observacao
				+ ", dataCadastro=" + dataCadastro
				+ "]";
	}
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
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
	
	public Segmento getSegmento() {
		return segmento;
	}
	
	public void setSegmento(Segmento segmento) {
		this.segmento = segmento;
	}

	public String getObservacao() {
		return observacao;
	}
	
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	
	public Date getDataCadastro() {
		return dataCadastro;
	}
	
	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	
	public ConfiguracaoEmail getConfiguracaoEmail() {
		return configuracaoEmail;
	}
	
	public void setConfiguracaoEmail(ConfiguracaoEmail configuracaoEmail) {
		this.configuracaoEmail = configuracaoEmail;
	}
	
	public Set<Menu> getMenus() {
		return menus;
	}
	
	public void setMenus(Set<Menu> menus) {
		this.menus = menus;
	}
	
	public Set<Cliente> getClientes() {
		return clientes;
	}
	
	public void setClientes(Set<Cliente> clientes) {
		this.clientes = clientes;
	}
	
	public Set<Endereco> getEnderecos() {
		return enderecos;
	}
	
	public void setEnderecos(Set<Endereco> enderecos) {
		this.enderecos = enderecos;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cnpj == null) ? 0 : cnpj.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		Contratante other = (Contratante) obj;
		if (cnpj == null) {
			if (other.cnpj != null)
				return false;
		} else if (!cnpj.equals(other.cnpj))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
}
