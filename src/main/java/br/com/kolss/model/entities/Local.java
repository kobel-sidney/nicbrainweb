package br.com.kolss.model.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import br.com.kolss.model.enuns.SituacaoEnum;
import br.com.kolss.model.enuns.SituacaoOcorrenciaEnum;

@Entity
@Table(name = "local")
public class Local extends AbstractEntity<Long>implements UsuarioResponsavel, ISituacao {

	/** serialVersionUID */
	private static final long serialVersionUID = 2154489120201738686L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_local", nullable = false, unique = true)
	private Long id;

	@Column(name = "nome_local", nullable = false)
	private String nome;

	@Column(name = "site_local", nullable = true)
	private String site;

	@Lob
	@Basic(optional = true, fetch = FetchType.LAZY)
	@Column(name = "logo_local", nullable = true)
	private byte[] logo;

	@Column(name = "telefone_local", nullable = true)
	private String telefoneLocal;

	@Column(name = "observacao", nullable = true)
	private String observacao;

	@Column(name = "responsavel_local", nullable = true)
	private String responsavel;

	@Column(name = "telefone_responsavel", nullable = true)
	private String telefoneResponsavel;

	@Column(name = "celular_responsavel", nullable = true)
	private String celularResponsavel;

	@Column(name = "email_responsavel", nullable = true)
	private String emailResponsavel;

	@Column(name = "distancia_limite", nullable = true)
	private Integer distanciaLimite;

	@Embedded
	private CoordenadaGeografica coordenadas = new CoordenadaGeografica();

	@Lob
	@Basic(optional = true, fetch = FetchType.LAZY)
	@Column(name = "icone_local", nullable = true)
	private byte[] icone;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_cadastro", nullable = false)
	private Date dataCadastro;

	@Column(name = "ativo", nullable = false)
	private boolean ativo = false;

	@ManyToOne(fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name = "id_tipo_local", nullable = false)
	private TipoLocal tipoLocal = new TipoLocal();

	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_usuario_responsavel", nullable = true)
	private Usuario usuarioResponsavel = new Usuario();

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_cliente", nullable = false)
	private Cliente cliente = new Cliente();

	@OneToMany(mappedBy = "local", fetch = FetchType.LAZY)
	private Set<DocumentoAnexo> documentosAnexos = new HashSet<DocumentoAnexo>();

	@OneToMany(mappedBy = "local", fetch = FetchType.LAZY)
	private Set<Evento> eventos = new HashSet<Evento>();

	@OneToMany(mappedBy = "local", fetch = FetchType.LAZY)
	private Set<Setor> setores = new HashSet<Setor>();

	@OneToMany(mappedBy = "local", fetch = FetchType.LAZY)
	@Cascade({ CascadeType.SAVE_UPDATE })
	private Set<Endereco> enderecos = new HashSet<Endereco>();

	@OneToMany(mappedBy = "local", fetch = FetchType.LAZY)
	private List<CercaVirtual> cercaVirtual = new ArrayList<>();

	@Transient
	private SituacaoEnum situacao = SituacaoEnum.SEM_INDICADOR;

	@Transient
	private SituacaoOcorrenciaEnum situacaoOcorrencia = SituacaoOcorrenciaEnum.SEM_INDICADOR;

	/** Método Construtor padrão. */
	public Local() {
		super();
	}

	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param nome
	 * @param dataCadastro
	 * @param cliente
	 * @param tipoLocal
	 * @param ativo
	 */
	public Local(Long id, String nome, Date dataCadastro, Cliente cliente, TipoLocal tipoLocal, boolean ativo) {
		this(id, nome, null, null, null, null, null, null, null, null, null, null, null, null, dataCadastro, null,
				cliente, tipoLocal, ativo);
	}

	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param nome
	 * @param site
	 * @param logo
	 * @param telefoneLocal
	 * @param observacao
	 * @param responsavel
	 * @param telefoneResponsavel
	 * @param celularResponsavel
	 * @param emailResponsavel
	 * @param distanciaLimite
	 * @param latitude
	 * @param longitude
	 * @param icone
	 * @param dataCadastro
	 * @param usuarioResponsavel
	 * @param cliente
	 * @param tipoLocal
	 * @param ativo
	 */
	public Local(Long id, String nome, String site, byte[] logo, String telefoneLocal, String observacao,
			String responsavel, String telefoneResponsavel, String celularResponsavel, String emailResponsavel,
			Integer distanciaLimite, String latitude, String longitude, byte[] icone, Date dataCadastro,
			Usuario usuarioResponsavel, Cliente cliente, TipoLocal tipoLocal, boolean ativo) {
		this();
		this.id = id;
		this.nome = nome;
		this.site = site;
		this.logo = logo;
		this.telefoneLocal = telefoneLocal;
		this.observacao = observacao;
		this.responsavel = responsavel;
		this.telefoneResponsavel = telefoneResponsavel;
		this.celularResponsavel = celularResponsavel;
		this.emailResponsavel = emailResponsavel;
		this.distanciaLimite = distanciaLimite;
		this.coordenadas.setLatitude(latitude);
		this.coordenadas.setLongitude(longitude);
		this.icone = icone;
		this.dataCadastro = dataCadastro;
		this.ativo = ativo;
		this.usuarioResponsavel = usuarioResponsavel;
		this.cliente = cliente;
		this.tipoLocal = tipoLocal;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (ativo ? 1231 : 1237);
		result = prime * result + ((celularResponsavel == null) ? 0 : celularResponsavel.hashCode());
		result = prime * result + ((cliente == null) ? 0 : cliente.hashCode());
		result = prime * result + ((coordenadas == null) ? 0 : coordenadas.hashCode());
		result = prime * result + ((dataCadastro == null) ? 0 : dataCadastro.hashCode());
		result = prime * result + ((distanciaLimite == null) ? 0 : distanciaLimite.hashCode());
		result = prime * result + ((emailResponsavel == null) ? 0 : emailResponsavel.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result + ((observacao == null) ? 0 : observacao.hashCode());
		result = prime * result + ((responsavel == null) ? 0 : responsavel.hashCode());
		result = prime * result + ((site == null) ? 0 : site.hashCode());
		result = prime * result + ((telefoneLocal == null) ? 0 : telefoneLocal.hashCode());
		result = prime * result + ((telefoneResponsavel == null) ? 0 : telefoneResponsavel.hashCode());
		result = prime * result + ((usuarioResponsavel == null) ? 0 : usuarioResponsavel.hashCode());
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
		Local other = (Local) obj;
		if (ativo != other.ativo)
			return false;
		if (celularResponsavel == null) {
			if (other.celularResponsavel != null)
				return false;
		} else if (!celularResponsavel.equals(other.celularResponsavel))
			return false;
		if (cliente == null) {
			if (other.cliente != null)
				return false;
		} else if (!cliente.equals(other.cliente))
			return false;
		if (coordenadas == null) {
			if (other.coordenadas != null)
				return false;
		} else if (!coordenadas.equals(other.coordenadas))
			return false;
		if (dataCadastro == null) {
			if (other.dataCadastro != null)
				return false;
		} else if (!dataCadastro.equals(other.dataCadastro))
			return false;
		if (distanciaLimite == null) {
			if (other.distanciaLimite != null)
				return false;
		} else if (!distanciaLimite.equals(other.distanciaLimite))
			return false;
		if (emailResponsavel == null) {
			if (other.emailResponsavel != null)
				return false;
		} else if (!emailResponsavel.equals(other.emailResponsavel))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (observacao == null) {
			if (other.observacao != null)
				return false;
		} else if (!observacao.equals(other.observacao))
			return false;
		if (responsavel == null) {
			if (other.responsavel != null)
				return false;
		} else if (!responsavel.equals(other.responsavel))
			return false;
		if (site == null) {
			if (other.site != null)
				return false;
		} else if (!site.equals(other.site))
			return false;
		if (telefoneLocal == null) {
			if (other.telefoneLocal != null)
				return false;
		} else if (!telefoneLocal.equals(other.telefoneLocal))
			return false;
		if (telefoneResponsavel == null) {
			if (other.telefoneResponsavel != null)
				return false;
		} else if (!telefoneResponsavel.equals(other.telefoneResponsavel))
			return false;
		if (usuarioResponsavel == null) {
			if (other.usuarioResponsavel != null)
				return false;
		} else if (!usuarioResponsavel.equals(other.usuarioResponsavel))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Local [id=" + id + ", nome=" + nome + ", site=" + site + ", telefoneLocal=" + telefoneLocal
				+ ", observacao=" + observacao + ", responsavel=" + responsavel + ", telefoneResponsavel="
				+ telefoneResponsavel + ", celularResponsavel=" + celularResponsavel + ", emailResponsavel="
				+ emailResponsavel + ", distanciaLimite=" + distanciaLimite + ", " + coordenadas + ", dataCadastro="
				+ dataCadastro + ", ativo=" + ativo + ", tipoLocal=" + tipoLocal + ", usuarioResponsavel="
				+ usuarioResponsavel + ", cliente=" + cliente + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
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

	public String getTelefoneLocal() {
		return telefoneLocal;
	}

	public void setTelefoneLocal(String telefoneLocal) {
		this.telefoneLocal = telefoneLocal;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public String getResponsavel() {
		return responsavel;
	}

	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}

	public String getTelefoneResponsavel() {
		return telefoneResponsavel;
	}

	public void setTelefoneResponsavel(String telefoneResponsavel) {
		this.telefoneResponsavel = telefoneResponsavel;
	}

	public String getCelularResponsavel() {
		return celularResponsavel;
	}

	public void setCelularResponsavel(String celularResponsavel) {
		this.celularResponsavel = celularResponsavel;
	}

	public String getEmailResponsavel() {
		return emailResponsavel;
	}

	public void setEmailResponsavel(String emailResponsavel) {
		this.emailResponsavel = emailResponsavel;
	}

	public Integer getDistanciaLimite() {
		return distanciaLimite;
	}

	public void setDistanciaLimite(Integer distanciaLimite) {
		this.distanciaLimite = distanciaLimite;
	}

	public String getLatitude() {
		return this.coordenadas == null ? null : this.coordenadas.getLatitude();
	}

	public void setLatitude(String latitude) {
		this.coordenadas.setLatitude(latitude);
	}

	public String getLongitude() {
		return this.coordenadas == null ? null : this.coordenadas.getLongitude();
	}

	public void setLongitude(String longitude) {
		this.coordenadas.setLongitude(longitude);
	}

	public byte[] getIcone() {
		return icone;
	}

	public void setIcone(byte[] icone) {
		this.icone = icone;
	}

	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public TipoLocal getTipoLocal() {
		return tipoLocal;
	}

	public void setTipoLocal(TipoLocal tipoLocal) {
		this.tipoLocal = tipoLocal;
	}

	public Usuario getUsuarioResponsavel() {
		return usuarioResponsavel;
	}

	public void setUsuarioResponsavel(Usuario usuarioResponsavel) {
		this.usuarioResponsavel = usuarioResponsavel;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Set<DocumentoAnexo> getDocumentosAnexos() {
		return documentosAnexos;
	}

	public void setDocumentosAnexos(Set<DocumentoAnexo> documentosAnexos) {
		this.documentosAnexos = documentosAnexos;
	}

	public Set<Evento> getEventos() {
		return eventos;
	}

	public void setEventos(Set<Evento> eventos) {
		this.eventos = eventos;
	}

	public Set<Setor> getSetores() {
		return setores;
	}

	public void setSetores(Set<Setor> setores) {
		this.setores = setores;
	}

	public Set<Endereco> getEnderecos() {
		return enderecos;
	}

	public void setEnderecos(Set<Endereco> enderecos) {
		this.enderecos = enderecos;
	}

	public SituacaoEnum getSituacao() {
		return situacao;
	}

	public void setSituacao(SituacaoEnum situacao) {
		this.situacao = situacao;
	}

	public SituacaoOcorrenciaEnum getSituacaoOcorrencia() {
		return situacaoOcorrencia;
	}

	public void setSituacaoOcorrencia(SituacaoOcorrenciaEnum situacaoOcorrencia) {
		this.situacaoOcorrencia = situacaoOcorrencia;
	}

	public List<CercaVirtual> getCercaVirtual() {
		return cercaVirtual;
	}

	public void setCercaVirtual(List<CercaVirtual> cercaVirtual) {
		this.cercaVirtual = cercaVirtual;
	}

}
