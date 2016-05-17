package br.com.kolss.dto;

public class FalhaOcorrenciaDTO {

	private String idAtividadeOcorrencia;
	private String idPessoaResponsavel;
	private String comentario;
	
	public String getIdAtividadeOcorrencia() {
		return idAtividadeOcorrencia;
	}
	public void setIdAtividadeOcorrencia(String idAtividadeOcorrencia) {
		this.idAtividadeOcorrencia = idAtividadeOcorrencia;
	}
	public String getIdPessoaResponsavel() {
		return idPessoaResponsavel;
	}
	public void setIdPessoaResponsavel(String idPessoaResponsavel) {
		this.idPessoaResponsavel = idPessoaResponsavel;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	
	
}
