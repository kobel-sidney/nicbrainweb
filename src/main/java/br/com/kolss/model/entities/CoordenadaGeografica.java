package br.com.kolss.model.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;


@Embeddable
public class CoordenadaGeografica implements Serializable {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 5739369434671196689L;
	

	
	@Column(name = "latitude", nullable = true)
	private String latitude;
	
	
	@Column(name = "longitude", nullable = true)
	private String longitude;
	
	
	/** Método Construtor padrão. */
	public CoordenadaGeografica() {
		this(null, null);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param latitude
	 * @param longitude
	 */
	public CoordenadaGeografica(String latitude, String longitude) {
		this.latitude = latitude;
		this.longitude = longitude;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((latitude == null) ? 0 : latitude.hashCode());
		result = prime * result
				+ ((longitude == null) ? 0 : longitude.hashCode());
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
		CoordenadaGeografica other = (CoordenadaGeografica) obj;
		if (latitude == null) {
			if (other.latitude != null)
				return false;
		} else if (!latitude.equals(other.latitude))
			return false;
		if (longitude == null) {
			if (other.longitude != null)
				return false;
		} else if (!longitude.equals(other.longitude))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "CoordenadaGeografica [latitude=" + latitude
				+ ", longitude=" + longitude
				+ "]";
	}
	
	
	public String getLatitude() {
		return latitude;
	}
	
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	
	public String getLongitude() {
		return longitude;
	}
	
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	
}
