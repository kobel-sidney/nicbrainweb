package br.com.kolss.dto;

import java.io.Serializable;

public class CancelamentoCheckListDTO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String idAtividadeChecklist;
	private String idUsuario;
	private String justificativa;
	private String latitude;
	private String longitude;
	private String data;
		
	public CancelamentoCheckListDTO(){}

	/**
	 * @return the idAtividadeChecklist
	 */
	public String getIdAtividadeChecklist() {
		return idAtividadeChecklist;
	}

	/**
	 * @param idAtividadeChecklist the idAtividadeChecklist to set
	 */
	public void setIdAtividadeChecklist(String idAtividadeChecklist) {
		this.idAtividadeChecklist = idAtividadeChecklist;
	}

	/**
	 * @return the idUsuario
	 */
	public String getIdUsuario() {
		return idUsuario;
	}

	/**
	 * @param idUsuario the idUsuario to set
	 */
	public void setIdUsuario(String idUsuario) {
		this.idUsuario = idUsuario;
	}

	/**
	 * @return the justificativa
	 */
	public String getJustificativa() {
		return justificativa;
	}

	/**
	 * @param justificativa the justificativa to set
	 */
	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
	}

	/**
	 * @return the latitude
	 */
	public String getLatitude() {
		return latitude;
	}

	/**
	 * @param latitude the latitude to set
	 */
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	/**
	 * @return the longitude
	 */
	public String getLongitude() {
		return longitude;
	}

	/**
	 * @param longitude the longitude to set
	 */
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	/**
	 * @return the data
	 */
	public String getData() {
		return data;
	}

	/**
	 * @param data the data to set
	 */
	public void setData(String data) {
		this.data = data;
	}
}
