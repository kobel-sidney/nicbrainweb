package br.com.kolss.model.entities;

import java.util.Date;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "operacao_atividade_ocorrencia")
public class OperacaoAtividadeOcorrencia extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -1873428475927062026L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", nullable = false, unique = true)
	private Long id;
	
	@Temporal(TemporalType.TIMESTAMP)
	
	@Column(name = "data_hora_status", nullable = false)
	private Date dataStatus;
	
	
	@Column(name = "justificativa", nullable = true)
	private String justificativa;
	
	@Embedded
	private CoordenadaGeografica coordenadas = new CoordenadaGeografica();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_status", nullable = true)
	private Status status = new Status();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_usuario", nullable = true)
	private Usuario usuario = new Usuario();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_atividade", nullable = true)
	private AtividadeOcorrencia atividadeOcorrencia = new AtividadeOcorrencia();
	
	
	/** Método Construtor padrão. */
	public OperacaoAtividadeOcorrencia() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param dataStatus
	 */
	public OperacaoAtividadeOcorrencia(Long id, Date dataStatus) {
		this(id, dataStatus, null, null, null, null, null, null);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param dataStatus
	 * @param justificativa
	 * @param latitude
	 * @param longitude
	 * @param status
	 * @param usuario
	 * @param atividadeOcorrencia
	 */
	public OperacaoAtividadeOcorrencia(Long id, Date dataStatus, String justificativa,
			String latitude, String longitude, Status status, Usuario usuario,
			AtividadeOcorrencia atividadeOcorrencia) {
		this();
		this.id = id;
		this.dataStatus = dataStatus;
		this.justificativa = justificativa;
		this.coordenadas.setLatitude(latitude);
		this.coordenadas.setLongitude(longitude);
		this.status = status;
		this.usuario = usuario;
		this.atividadeOcorrencia = atividadeOcorrencia;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((dataStatus == null) ? 0 : dataStatus.hashCode());
		result = prime * result
				+ ((justificativa == null) ? 0 : justificativa.hashCode());
		result = prime * result
				+ ((coordenadas == null) ? 0 : coordenadas.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((usuario == null) ? 0 : usuario.hashCode());
		result = prime * result
				+ ((atividadeOcorrencia == null) ? 0 : atividadeOcorrencia.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		OperacaoAtividadeOcorrencia other = (OperacaoAtividadeOcorrencia) obj;
		if (dataStatus == null) {
			if (other.dataStatus != null)
				return false;
		} else if (!dataStatus.equals(other.dataStatus))
			return false;
		if (justificativa == null) {
			if (other.justificativa != null)
				return false;
		} else if (!justificativa.equals(other.justificativa))
			return false;
		if (coordenadas == null) {
			if (other.coordenadas != null)
				return false;
		} else if (!coordenadas.equals(other.coordenadas))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (usuario == null) {
			if (other.usuario != null)
				return false;
		} else if (!usuario.equals(other.usuario))
			return false;
		if (atividadeOcorrencia == null) {
			if (other.atividadeOcorrencia != null)
				return false;
		} else if (!atividadeOcorrencia.equals(other.atividadeOcorrencia))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "OperacaoAtividadeOcorrencia [id=" + id
				+ ", dataStatus=" + dataStatus
				+ ", justificativa=" + justificativa
				+ ", " + coordenadas
				+ ", status=" + status
				+ ", usuario=" + usuario
				+ ", atividade=" + atividadeOcorrencia
				+ "]";
	}
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDataStatus() {
		return dataStatus;
	}

	public void setDataStatus(Date dataStatus) {
		this.dataStatus = dataStatus;
	}

	public String getJustificativa() {
		return justificativa;
	}

	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public AtividadeOcorrencia getAtividadeOcorrencia() {
		return atividadeOcorrencia;
	}
	
	public void setAtividadeOcorrencia(AtividadeOcorrencia atividadeOcorrencia) {
		this.atividadeOcorrencia = atividadeOcorrencia;
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
	
}
