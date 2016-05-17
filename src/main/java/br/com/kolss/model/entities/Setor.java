package br.com.kolss.model.entities;

import java.util.HashSet;
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


@Entity
@Table(name = "setor")
public class Setor extends AbstractEntity<Long> implements UsuarioResponsavel {
	
	private static final long serialVersionUID = 8337420589330895251L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_setor", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_setor", nullable = false)
	private String nome;
	
	@Embedded
	private CoordenadaGeografica coordenadas = new CoordenadaGeografica();
	
	
	@Column(name = "distancia_limite", nullable = true)
	private Integer distanciaLimite;
	
	
	@Column(name = "telefone_setor", nullable = true)
	private String telefoneSetor;
	
	
	@Column(name = "observacao", nullable = true)
	private String observacao;
	
	
	@Column(name = "responsavel_setor", nullable = true)
	private String responsavel;
	
	
	@Column(name = "telefone_responsavel", nullable = true)
	private String telefoneResponsavel;
	
	
	@Column(name = "celular_responsavel", nullable = true)
	private String celularResponsavel;
	
	
	@Column(name = "email_responsavel", nullable = true)
	private String emailResponsavel;
	
	@Lob
	@Basic(optional = true, fetch = FetchType.LAZY)
	@Column(name = "mapa_setor", nullable = true)
	private byte[] mapa;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_usuario_responsavel", nullable = true)
	private Usuario usuarioResponsavel = new Usuario();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_local", nullable = false)
	private Local local = new Local();
	
	@OneToMany(mappedBy = "setor", fetch = FetchType.LAZY)
	private Set<PostoServico> postosServicos = new HashSet<PostoServico>();
	
	@OneToMany(mappedBy = "setor", fetch = FetchType.LAZY)
	private Set<Equipamento> equipamentos = new HashSet<Equipamento>();
	
	@OneToMany(mappedBy = "setor", fetch = FetchType.LAZY)
	private Set<Ocorrencia> ocorrencias = new HashSet<Ocorrencia>();
	
	
	/** Método Construtor padrão. */
	public Setor() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param nome
	 */
	public Setor(Long id, String nome) {
		this(id, nome, null, null, null, null, null, null, null, null, null,
				null, null, null);
	}

	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param nome
	 * @param latitude
	 * @param longitude
	 * @param distanciaLimite
	 * @param telefoneSetor
	 * @param observacao
	 * @param responsavel
	 * @param telefoneResponsavel
	 * @param celularResponsavel
	 * @param emailResponsavel
	 * @param mapa
	 * @param usuarioResponsavel
	 * @param local
	 */
	public Setor(Long id, String nome, String latitude, String longitude,
			Integer distanciaLimite, String telefoneSetor, String observacao,
			String responsavel, String telefoneResponsavel,
			String celularResponsavel, String emailResponsavel, byte[] mapa,
			Usuario usuarioResponsavel, Local local) {
		this();
		this.id = id;
		this.nome = nome;
		setLatitude(latitude);
		setLongitude(longitude);
		this.distanciaLimite = distanciaLimite;
		this.telefoneSetor = telefoneSetor;
		this.observacao = observacao;
		this.responsavel = responsavel;
		this.telefoneResponsavel = telefoneResponsavel;
		this.celularResponsavel = celularResponsavel;
		this.emailResponsavel = emailResponsavel;
		this.mapa = mapa;
		this.usuarioResponsavel = usuarioResponsavel;
		this.local = local;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((celularResponsavel == null) ? 0 : celularResponsavel
						.hashCode());
		result = prime * result
				+ ((distanciaLimite == null) ? 0 : distanciaLimite.hashCode());
		result = prime * result
				+ ((emailResponsavel == null) ? 0 : emailResponsavel.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((coordenadas == null) ? 0 : coordenadas.hashCode());
		result = prime * result + ((local == null) ? 0 : local.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result
				+ ((observacao == null) ? 0 : observacao.hashCode());
		result = prime * result
				+ ((responsavel == null) ? 0 : responsavel.hashCode());
		result = prime * result
				+ ((telefoneResponsavel == null) ? 0 : telefoneResponsavel
						.hashCode());
		result = prime * result
				+ ((telefoneSetor == null) ? 0 : telefoneSetor.hashCode());
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
		Setor other = (Setor) obj;
		if (celularResponsavel == null) {
			if (other.celularResponsavel != null)
				return false;
		} else if (!celularResponsavel.equals(other.celularResponsavel))
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
		if (coordenadas == null) {
			if (other.coordenadas != null)
				return false;
		} else if (!coordenadas.equals(other.coordenadas))
			return false;
		if (local == null) {
			if (other.local != null)
				return false;
		} else if (!local.equals(other.local))
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
		if (telefoneResponsavel == null) {
			if (other.telefoneResponsavel != null)
				return false;
		} else if (!telefoneResponsavel.equals(other.telefoneResponsavel))
			return false;
		if (telefoneSetor == null) {
			if (other.telefoneSetor != null)
				return false;
		} else if (!telefoneSetor.equals(other.telefoneSetor))
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
		return "Setor [id=" + id
				+ ", nome=" + nome
				+ ", " + coordenadas
				+ ", distanciaLimite=" + distanciaLimite
				+ ", telefoneSetor=" + telefoneSetor
				+ ", observacao=" + observacao
				+ ", responsavel=" + responsavel
				+ ", telefoneResponsavel=" + telefoneResponsavel
				+ ", celularResponsavel=" + celularResponsavel
				+ ", emailResponsavel=" + emailResponsavel
				+ ", usuarioResponsavel=" + usuarioResponsavel
				+ ", local=" + local
				+ "]";
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
	
	public String getLatitude() {
		return this.coordenadas.getLatitude();
	}
	
	public void setLatitude(String latitude) {
		this.coordenadas.setLatitude(latitude);
	}
	
	public String getLongitude() {
		return this.coordenadas.getLongitude();
	}
	
	public void setLongitude(String longitude) {
		this.coordenadas.setLongitude(longitude);
	}
	
	public Integer getDistanciaLimite() {
		return distanciaLimite;
	}
	
	public void setDistanciaLimite(Integer distanciaLimite) {
		this.distanciaLimite = distanciaLimite;
	}
	
	public String getTelefoneSetor() {
		return telefoneSetor;
	}
	
	public void setTelefoneSetor(String telefoneSetor) {
		this.telefoneSetor = telefoneSetor;
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
	
	public byte[] getMapa() {
		return mapa;
	}
	
	public void setMapa(byte[] mapa) {
		this.mapa = mapa;
	}
	
	public Usuario getUsuarioResponsavel() {
		return usuarioResponsavel;
	}
	
	public void setUsuarioResponsavel(Usuario usuarioResponsavel) {
		this.usuarioResponsavel = usuarioResponsavel;
	}
	
	public Local getLocal() {
		return local;
	}
	
	public void setLocal(Local local) {
		this.local = local;
	}
	
	public Set<PostoServico> getPostosServicos() {
		return postosServicos;
	}
	
	public void setPostosServicos(Set<PostoServico> postosServicos) {
		this.postosServicos = postosServicos;
	}
	
	public Set<Equipamento> getEquipamentos() {
		return equipamentos;
	}
	
	public void setEquipamentos(Set<Equipamento> equipamentos) {
		this.equipamentos = equipamentos;
	}
	
	public Set<Ocorrencia> getOcorrencias() {
		return ocorrencias;
	}
	
	public void setOcorrencias(Set<Ocorrencia> ocorrencias) {
		this.ocorrencias = ocorrencias;
	}
	
}
