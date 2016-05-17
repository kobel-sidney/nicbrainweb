package br.com.kolss.dto;

import java.io.Serializable;


public class EnvioAtividadeChecklistDTO implements Serializable{

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
	
	public EnvioAtividadeChecklistDTO(){}

	public String getIdAtividadeChecklist() {
		return idAtividadeChecklist;
	}

	public void setIdAtividadeChecklist(String idAtividadeChecklist) {
		this.idAtividadeChecklist = idAtividadeChecklist;
	}

	public String getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(String idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getJustificativa() {
		return justificativa;
	}

	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
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

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}
}
