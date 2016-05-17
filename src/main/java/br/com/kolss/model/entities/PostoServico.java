package br.com.kolss.model.entities;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "posto_servico")
public class PostoServico extends AbstractEntity<Long> {

	/** serialVersionUID */
	private static final long serialVersionUID = -7684748476215298915L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_posto_servico", nullable = false, unique = true)
	private Long id;

	@Basic(optional = false, fetch = FetchType.LAZY)
	@Column(name = "nome_posto_servico", nullable = false)
	private String nome;

	@Embedded
	private CoordenadaGeografica coordenadas = new CoordenadaGeografica();

	@Basic(optional = true, fetch = FetchType.LAZY)
	@Column(name = "telefone_posto_servico", nullable = true)
	private String telefonePosto;

	@Basic(optional = true, fetch = FetchType.LAZY)
	@Column(name = "observacao", nullable = true)
	private String observacao;

	@Basic(optional = true, fetch = FetchType.LAZY)
	@Column(name = "responsavel_setor", nullable = true)
	private String responsavel;

	@Basic(optional = true, fetch = FetchType.LAZY)
	@Column(name = "telefone_responsavel", nullable = true)
	private String telefoneResponsavel;

	@Basic(optional = true, fetch = FetchType.LAZY)
	@Column(name = "celular_responsavel", nullable = true)
	private String celularResponsavel;

	@Basic(optional = true, fetch = FetchType.LAZY)
	@Column(name = "email_responsavel", nullable = true)
	private String emailResponsavel;

	@Basic(optional = false, fetch = FetchType.LAZY)
	@Column(name = "ativo", nullable = false)
	private boolean ativo = true;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_setor", nullable = false)
	private Setor setor = new Setor();

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_tipo_servico", nullable = false)
	private TipoServico tipoServico = new TipoServico();

	/** Método Construtor padrão. */
	public PostoServico() {
		super();
	}

	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param nome
	 * @param ativo
	 * @param setor
	 * @param tipoServico
	 */
	public PostoServico(Long id, String nome, String ativo, Setor setor,
			TipoServico tipoServico) {
		this(id, nome, null, null, null, null, null, null, null, null, false,
				setor, tipoServico);
	}

	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param nome
	 * @param latitude
	 * @param longitude
	 * @param telefonePosto
	 * @param observacao
	 * @param responsavel
	 * @param telefoneResponsavel
	 * @param celularResponsavel
	 * @param emailResponsavel
	 * @param ativo
	 * @param setor
	 * @param tipoServico
	 */
	public PostoServico(Long id, String nome, String latitude,
			String longitude, String telefonePosto, String observacao,
			String responsavel, String telefoneResponsavel,
			String celularResponsavel, String emailResponsavel, boolean ativo,
			Setor setor, TipoServico tipoServico) {
		this();
		this.id = id;
		this.nome = nome;
		this.coordenadas.setLatitude(latitude);
		this.coordenadas.setLongitude(longitude);
		this.telefonePosto = telefonePosto;
		this.observacao = observacao;
		this.responsavel = responsavel;
		this.telefoneResponsavel = telefoneResponsavel;
		this.celularResponsavel = celularResponsavel;
		this.emailResponsavel = emailResponsavel;
		this.ativo = ativo;
		this.setor = setor;
		this.tipoServico = tipoServico;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (ativo ? 1231 : 1237);
		result = prime
				* result
				+ ((celularResponsavel == null) ? 0 : celularResponsavel
						.hashCode());
		result = prime
				* result
				+ ((emailResponsavel == null) ? 0 : emailResponsavel.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((coordenadas == null) ? 0 : coordenadas.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result
				+ ((observacao == null) ? 0 : observacao.hashCode());
		result = prime * result
				+ ((responsavel == null) ? 0 : responsavel.hashCode());
		result = prime * result + ((setor == null) ? 0 : setor.hashCode());
		result = prime * result
				+ ((telefonePosto == null) ? 0 : telefonePosto.hashCode());
		result = prime
				* result
				+ ((telefoneResponsavel == null) ? 0 : telefoneResponsavel
						.hashCode());
		result = prime * result
				+ ((tipoServico == null) ? 0 : tipoServico.hashCode());
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
		PostoServico other = (PostoServico) obj;
		if (ativo != other.ativo)
			return false;
		if (celularResponsavel == null) {
			if (other.celularResponsavel != null)
				return false;
		} else if (!celularResponsavel.equals(other.celularResponsavel))
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
		if (setor == null) {
			if (other.setor != null)
				return false;
		} else if (!setor.equals(other.setor))
			return false;
		if (telefonePosto == null) {
			if (other.telefonePosto != null)
				return false;
		} else if (!telefonePosto.equals(other.telefonePosto))
			return false;
		if (telefoneResponsavel == null) {
			if (other.telefoneResponsavel != null)
				return false;
		} else if (!telefoneResponsavel.equals(other.telefoneResponsavel))
			return false;
		if (tipoServico == null) {
			if (other.tipoServico != null)
				return false;
		} else if (!tipoServico.equals(other.tipoServico))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "PostoServico [id=" + id + ", nome=" + nome + ", " + coordenadas
				+ ", telefonePosto=" + telefonePosto + ", observacao="
				+ observacao + ", responsavel=" + responsavel
				+ ", telefoneResponsavel=" + telefoneResponsavel
				+ ", celularResponsavel=" + celularResponsavel
				+ ", emailResponsavel=" + emailResponsavel + ", ativo=" + ativo
				+ ", setor=" + setor + ", tipoServico=" + tipoServico + "]";
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

	public String getTelefonePosto() {
		return telefonePosto;
	}

	public void setTelefonePosto(String telefonePosto) {
		this.telefonePosto = telefonePosto;
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

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public Setor getSetor() {
		return setor;
	}

	public void setSetor(Setor setor) {
		this.setor = setor;
	}

	public TipoServico getTipoServico() {
		return tipoServico;
	}

	public void setTipoServico(TipoServico tipoServico) {
		this.tipoServico = tipoServico;
	}

}
