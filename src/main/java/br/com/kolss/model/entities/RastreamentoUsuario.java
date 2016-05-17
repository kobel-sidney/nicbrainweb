package br.com.kolss.model.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
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
@Table(name = "rastreamento_usuario")
public class RastreamentoUsuario extends AbstractEntity<Long> implements Serializable {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -7869135714882549018L;
		
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_rastreamento_usuario", nullable = false, unique = true)
	private Long id;
	
	@Temporal(TemporalType.TIMESTAMP)
	
	@Column(name = "data_hora_rastreamento", nullable = false)
	private Date dataHoraRastreamento;
	
	@Embedded
	@AttributeOverrides({
		@AttributeOverride(name = "latitude", column=@Column(nullable = false)),
		@AttributeOverride(name = "longitude", column=@Column(nullable = false))
	})
	private CoordenadaGeografica coordenadas = new CoordenadaGeografica();
	
	@ManyToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "id_agnd_rast_usuario", nullable = false)
	private AgendamentoRastreamentoUsuario agendamentoRastreamentoUsuario =
			new AgendamentoRastreamentoUsuario();
	
	
	/** Método Construtor padrão. */
	public RastreamentoUsuario() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param dataHoraRastreamento
	 * @param latitude
	 * @param longitude
	 * @param agendamentoRastreamentoUsuario
	 */
	public RastreamentoUsuario(Long id, Date dataHoraRastreamento,
			String latitude, String longitude,
			AgendamentoRastreamentoUsuario agendamentoRastreamentoUsuario) {
		this.id = id;
		this.dataHoraRastreamento = dataHoraRastreamento;
		this.coordenadas.setLatitude(latitude);
		this.coordenadas.setLongitude(longitude);
		this.agendamentoRastreamentoUsuario = agendamentoRastreamentoUsuario;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((agendamentoRastreamentoUsuario == null) ? 0
						: agendamentoRastreamentoUsuario.hashCode());
		result = prime * result
				+ ((coordenadas == null) ? 0 : coordenadas.hashCode());
		result = prime * result
				+ ((dataHoraRastreamento == null) ? 0
						: dataHoraRastreamento.hashCode());
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
		RastreamentoUsuario other = (RastreamentoUsuario) obj;
		if (agendamentoRastreamentoUsuario == null) {
			if (other.agendamentoRastreamentoUsuario != null)
				return false;
		} else if (!agendamentoRastreamentoUsuario
				.equals(other.agendamentoRastreamentoUsuario))
			return false;
		if (coordenadas == null) {
			if (other.coordenadas != null)
				return false;
		} else if (!coordenadas.equals(other.coordenadas))
			return false;
		if (dataHoraRastreamento == null) {
			if (other.dataHoraRastreamento != null)
				return false;
		} else if (!dataHoraRastreamento.equals(other.dataHoraRastreamento))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "RastreamentoUsuario [id=" + id
				+ ", dataHoraRastreamento=" + dataHoraRastreamento
				+ ", " + coordenadas
				+ ", agendamentoRastreamentoUsuario=" + agendamentoRastreamentoUsuario
				+ "]";
	}
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Date getDataHoraRastreamento() {
		return dataHoraRastreamento;
	}
	
	public void setDataHoraRastreamento(Date dataHoraRastreamento) {
		this.dataHoraRastreamento = dataHoraRastreamento;
	}
	
	public AgendamentoRastreamentoUsuario getAgendamentoRastreamentoUsuario() {
		return agendamentoRastreamentoUsuario;
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
	
	public void setAgendamentoRastreamentoPessoa(
			AgendamentoRastreamentoUsuario agendamentoRastreamentoUsuario) {
		this.agendamentoRastreamentoUsuario = agendamentoRastreamentoUsuario;
	}
	
}
