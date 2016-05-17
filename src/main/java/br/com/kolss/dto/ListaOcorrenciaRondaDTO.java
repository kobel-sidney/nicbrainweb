package br.com.kolss.dto;

import java.util.List;

public class ListaOcorrenciaRondaDTO {

	private List<OcorrenciaRondaDTO> ocorrencias;
	private List<OcorrenciaRondaDTO> ocorrenciasFinalizadas;

	public List<OcorrenciaRondaDTO> getOcorrencias() {
		return ocorrencias;
	}

	public void setOcorrencias(List<OcorrenciaRondaDTO> ocorrencias) {
		this.ocorrencias = ocorrencias;
	}

	public List<OcorrenciaRondaDTO> getOcorrenciasFinalizadas() {
		return ocorrenciasFinalizadas;
	}

	public void setOcorrenciasFinalizadas(List<OcorrenciaRondaDTO> ocorrenciasFinalizadas) {
		this.ocorrenciasFinalizadas = ocorrenciasFinalizadas;
	}

}
