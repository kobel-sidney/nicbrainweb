package br.com.kolss.dto;

import java.io.Serializable;
import java.util.List;

public class RetornoClassificacaoDTO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<ClassificacaoOcorrenciaDTO> listClassificacaoOcorrenciaDTO;
	
	public RetornoClassificacaoDTO(){}
	
	public RetornoClassificacaoDTO(final List<ClassificacaoOcorrenciaDTO> listClassificacaoOcorrenciaDTO){
		this.listClassificacaoOcorrenciaDTO = listClassificacaoOcorrenciaDTO;
	}

	/**
	 * @return the listClassificacaoOcorrenciaDTO
	 */
	public List<ClassificacaoOcorrenciaDTO> getListClassificacaoOcorrenciaDTO() {
		return listClassificacaoOcorrenciaDTO;
	}

	/**
	 * @param listClassificacaoOcorrenciaDTO the listClassificacaoOcorrenciaDTO to set
	 */
	public void setListClassificacaoOcorrenciaDTO(
			List<ClassificacaoOcorrenciaDTO> listClassificacaoOcorrenciaDTO) {
		this.listClassificacaoOcorrenciaDTO = listClassificacaoOcorrenciaDTO;
	}
}
