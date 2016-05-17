package br.com.kolss.dto;

import java.util.List;

public class RetornoOcorrenciaDTO {
	
	private List<TipoClassificacaoOcorrenciaDTO> tipoClassificacaoOcorrenciaDTOs;
	private List<PendenciaOcorrenciaDTO> pendenciaOcorrenciaDTOs;
	private List<AtividadeOcorrenciaDTO> atividadeOcorrenciaDTOs;
	private List<ClassificacaoOcorrenciaDTO> classificacaoOcorrenciaDTOs;
	
	public RetornoOcorrenciaDTO() {
	}

	public List<TipoClassificacaoOcorrenciaDTO> getTipoClassificacaoOcorrenciaDTOs() {
		return tipoClassificacaoOcorrenciaDTOs;
	}

	public void setTipoClassificacaoOcorrenciaDTOs(
			List<TipoClassificacaoOcorrenciaDTO> tipoClassificacaoOcorrenciaDTOs) {
		this.tipoClassificacaoOcorrenciaDTOs = tipoClassificacaoOcorrenciaDTOs;
	}

	public List<PendenciaOcorrenciaDTO> getPendenciaOcorrenciaDTOs() {
		return pendenciaOcorrenciaDTOs;
	}

	public void setPendenciaOcorrenciaDTOs(
			List<PendenciaOcorrenciaDTO> pendenciaOcorrenciaDTOs) {
		this.pendenciaOcorrenciaDTOs = pendenciaOcorrenciaDTOs;
	}

	public List<AtividadeOcorrenciaDTO> getAtividadeOcorrenciaDTOs() {
		return atividadeOcorrenciaDTOs;
	}

	public void setAtividadeOcorrenciaDTOs(
			List<AtividadeOcorrenciaDTO> atividadeOcorrenciaDTOs) {
		this.atividadeOcorrenciaDTOs = atividadeOcorrenciaDTOs;
	}

	public List<ClassificacaoOcorrenciaDTO> getClassificacaoOcorrenciaDTOs() {
		return classificacaoOcorrenciaDTOs;
	}

	public void setClassificacaoOcorrenciaDTOs(
			List<ClassificacaoOcorrenciaDTO> classificacaoOcorrenciaDTOs) {
		this.classificacaoOcorrenciaDTOs = classificacaoOcorrenciaDTOs;
	}
	

}
