package br.com.kolss.model.entities;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author weverton
 */
@Entity
@Table(name = "coordenada_cerca_virtual")
public class Coordenada implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id")
	private Integer id;

	@Embedded
	private CoordenadaGeografica coordenada;

	@JoinColumn(name = "cerca_virtual_id", referencedColumnName = "id")
	@ManyToOne(optional = false)
	private CercaVirtual cercaVirtual;

	@Column(name = "indice_coordenada")
	private Integer indiceCoordenada;

	public Coordenada() {
	}

	public Coordenada(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public CoordenadaGeografica getCoordenada() {
		return coordenada;
	}

	public void setCoordenada(CoordenadaGeografica coordenada) {
		this.coordenada = coordenada;
	}

	public CercaVirtual getCercaVirtual() {
		return cercaVirtual;
	}

	public void setCercaVirtual(CercaVirtual cercaVirtual) {
		this.cercaVirtual = cercaVirtual;
	}

	public Integer getIndiceCoordenada() {
		return indiceCoordenada;
	}

	public void setIndiceCoordenada(Integer indiceCoordenada) {
		this.indiceCoordenada = indiceCoordenada;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (id != null ? id.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		// TODO: Warning - this method won't work in the case the id fields are
		// not set
		if (!(object instanceof Coordenada)) {
			return false;
		}
		Coordenada other = (Coordenada) object;
		if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return coordenada.getLatitude() + coordenada.getLongitude();
	}

}