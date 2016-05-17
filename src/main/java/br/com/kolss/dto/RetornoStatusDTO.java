package br.com.kolss.dto;

import java.util.List;

import br.com.kolss.enums.RetornoEnum;

public class RetornoStatusDTO {
	
	private List<StatusDTO> statusDtos;
	private RetornoEnum retornoEnum;
	
	public RetornoStatusDTO() {
	}
	
	public List<StatusDTO> getStatusDtos() {
		return statusDtos;
	}
	public void setStatusDtos(List<StatusDTO> statusDtos) {
		this.statusDtos = statusDtos;
	}
	public RetornoEnum getRetornoEnum() {
		return retornoEnum;
	}
	public void setRetornoEnum(RetornoEnum retornoEnum) {
		this.retornoEnum = retornoEnum;
	}
	
	
	
	

}
