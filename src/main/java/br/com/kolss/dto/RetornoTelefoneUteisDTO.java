package br.com.kolss.dto;

import java.io.Serializable;
import java.util.List;

public class RetornoTelefoneUteisDTO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<TelefoneUtilDTO> listTelefoneUtilDTO;
	
	public RetornoTelefoneUteisDTO(){}
	
	public RetornoTelefoneUteisDTO(final List<TelefoneUtilDTO> listTelefoneUtilDTO){
		this.listTelefoneUtilDTO = listTelefoneUtilDTO;
	}

	/**
	 * @return the listTelefoneUtilDTO
	 */
	public List<TelefoneUtilDTO> getListTelefoneUtilDTO() {
		return listTelefoneUtilDTO;
	}

	/**
	 * @param listTelefoneUtilDTO the listTelefoneUtilDTO to set
	 */
	public void setListTelefoneUtilDTO(List<TelefoneUtilDTO> listTelefoneUtilDTO) {
		this.listTelefoneUtilDTO = listTelefoneUtilDTO;
	}
}
