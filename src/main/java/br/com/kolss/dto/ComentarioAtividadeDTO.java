package br.com.kolss.dto;


public class ComentarioAtividadeDTO {
	
	private String idAtividadeChecklist;
	private String idUsuario;
	private String latitude;
	private String longitude;
	private String data;
	private String comentario;
	
	
	
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
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	
	


}
