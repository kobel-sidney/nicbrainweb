package br.com.kolss.model.entities;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "veiculo_aleatorio")
public class VeiculoAleatorio extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -9173837212472028608L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_veiculo_aleatorio", nullable = false, unique = true)
	private Long id;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_registro", nullable = true)
	private Date dataRegistro;
	
	@Column(name = "placa_veiculo", nullable = true)
	private String placaVeiculo;
	
	@Lob
	@Basic(optional = true, fetch = FetchType.LAZY)
	@Column(name = "foto_veiculo", nullable = true)
	private byte[] foto;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_equipamento", nullable = true)
	private Equipamento equipamento;
	
	
	/** Método Construtor padrão. */
	public VeiculoAleatorio() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param dataRegistro
	 * @param placaVeiculo
	 * @param foto
	 * @param equipamento
	 */
	public VeiculoAleatorio(Long id, Date dataRegistro, String placaVeiculo,
			byte[] foto, Equipamento equipamento) {
		this();
		this.id = id;
		this.dataRegistro = dataRegistro;
		this.placaVeiculo = placaVeiculo;
		this.foto = foto;
		this.equipamento = equipamento;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((dataRegistro == null) ? 0 : dataRegistro.hashCode());
		result = prime * result
				+ ((equipamento == null) ? 0 : equipamento.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((placaVeiculo == null) ? 0 : placaVeiculo.hashCode());
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
		VeiculoAleatorio other = (VeiculoAleatorio) obj;
		if (dataRegistro == null) {
			if (other.dataRegistro != null)
				return false;
		} else if (!dataRegistro.equals(other.dataRegistro))
			return false;
		if (equipamento == null) {
			if (other.equipamento != null)
				return false;
		} else if (!equipamento.equals(other.equipamento))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (placaVeiculo == null) {
			if (other.placaVeiculo != null)
				return false;
		} else if (!placaVeiculo.equals(other.placaVeiculo))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "VeiculoAleatorio [id=" + id
				+ ", dataRegistro=" + dataRegistro
				+ ", placaVeiculo=" + placaVeiculo
				+ ", equipamento=" + equipamento
				+ "]";
	}
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Date getDataRegistro() {
		return dataRegistro;
	}
	
	public void setDataRegistro(Date dataRegistro) {
		this.dataRegistro = dataRegistro;
	}
	
	public String getPlacaVeiculo() {
		return placaVeiculo;
	}
	
	public void setPlacaVeiculo(String placaVeiculo) {
		this.placaVeiculo = placaVeiculo;
	}
	
	public byte[] getFoto() {
		return foto;
	}
	
	public void setFoto(byte[] foto) {
		this.foto = foto;
	}
	
	public Equipamento getEquipamento() {
		return equipamento;
	}
	
	public void setEquipamento(Equipamento equipamento) {
		this.equipamento = equipamento;
	}
	
}
