package br.com.kolss.model.entities;

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
@Table(name = "rastreamento_veiculo")
public class RastreamentoVeiculo extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 9067037569162908057L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_rastreamento_veiculo", nullable = false, unique = true)
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
	@JoinColumn(name = "id_agnd_rast_veiculo", nullable = false)
	private AgendamentoRastreamentoVeiculo agendamentoRastreamentoVeiculo =
			new AgendamentoRastreamentoVeiculo();
	
	
	/** Método Construtor padrão. */
	public RastreamentoVeiculo() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param dataHoraRastreamento
	 * @param latitude
	 * @param longitude
	 * @param agendamentoRastreamentoVeiculo
	 */
	public RastreamentoVeiculo(Long id, Date dataHoraRastreamento,
			String latitude, String longitude,
			AgendamentoRastreamentoVeiculo agendamentoRastreamentoVeiculo) {
		this.id = id;
		this.dataHoraRastreamento = dataHoraRastreamento;
		this.coordenadas.setLatitude(latitude);
		this.coordenadas.setLongitude(longitude);
		this.agendamentoRastreamentoVeiculo = agendamentoRastreamentoVeiculo;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((agendamentoRastreamentoVeiculo == null) ? 0
						: agendamentoRastreamentoVeiculo.hashCode());
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
		RastreamentoVeiculo other = (RastreamentoVeiculo) obj;
		if (agendamentoRastreamentoVeiculo == null) {
			if (other.agendamentoRastreamentoVeiculo != null)
				return false;
		} else if (!agendamentoRastreamentoVeiculo
				.equals(other.agendamentoRastreamentoVeiculo))
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
		return "RastreamentoVeiculo [id=" + id
				+ ", dataHoraRastreamento=" + dataHoraRastreamento
				+ ", " + coordenadas
				+ ", agendamentoRastreamentoVeiculo=" + agendamentoRastreamentoVeiculo
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
	
	public AgendamentoRastreamentoVeiculo getAgendamentoRastreamentoVeiculo() {
		return agendamentoRastreamentoVeiculo;
	}
	
	public void setAgendamentoRastreamentoVeiculo(
			AgendamentoRastreamentoVeiculo agendamentoRastreamentoVeiculo) {
		this.agendamentoRastreamentoVeiculo = agendamentoRastreamentoVeiculo;
	}
	
}
