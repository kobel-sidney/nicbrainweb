package br.com.kolss.dto;

import java.util.List;

public class ClassificacaoOcorrenciaDTO {

	private String id;
	private String bitmapImageIcone;
	private String nome;
	private List<TipoClassificacaoOcorrenciaDTO> listaDeTipoDeClassificacaoOcorrencia;
	private Long idContratante;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBitmapImageIcone() {
		return bitmapImageIcone;
	}
	public void setBitmapImageIcone(String bitmapImageIcone) {
		this.bitmapImageIcone = bitmapImageIcone;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public List<TipoClassificacaoOcorrenciaDTO> getListaDeTipoDeClassificacaoOcorrencia() {
		return listaDeTipoDeClassificacaoOcorrencia;
	}
	public void setListaDeTipoDeClassificacaoOcorrencia(
			List<TipoClassificacaoOcorrenciaDTO> listaDeTipoDeClassificacaoOcorrencia) {
		this.listaDeTipoDeClassificacaoOcorrencia = listaDeTipoDeClassificacaoOcorrencia;
	}
	@Override
	public String toString() {
		return "ClassificacaoOcorrenciaDTO [id=" + id + ", bitmapImageIcone="
				+ bitmapImageIcone + ", nome=" + nome
				+ ", listaDeTipoDeClassificacaoOcorrencia="
				+ listaDeTipoDeClassificacaoOcorrencia + "]";
	}
	public Long getIdContratante() {
		return idContratante;
	}
	public void setIdContratante(Long idContratante) {
		this.idContratante = idContratante;
	}
}
