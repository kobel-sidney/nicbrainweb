package br.com.kolss.dto;

import java.util.List;

import com.fasterxml.jackson.core.JsonParser;

public class RetornoCheckList {
	
	private List<ChecklistDTO> listCheckList;
	private List<AtividadeChecklistDTO> listAtividades;
	
	public RetornoCheckList(){}
	
	public RetornoCheckList(final List<ChecklistDTO> listCheckList,
			final List<AtividadeChecklistDTO> listAtividades){
		this.listCheckList = listCheckList;
		this.listAtividades = listAtividades;
		 JsonParser a;
	}

	/**
	 * @return the listCheckList
	 */
	public List<ChecklistDTO> getListCheckList() {
		return listCheckList;
	}

	/**
	 * @param listCheckList the listCheckList to set
	 */
	public void setListCheckList(List<ChecklistDTO> listCheckList) {
		this.listCheckList = listCheckList;
	}

	/**
	 * @return the listAtividades
	 */
	public List<AtividadeChecklistDTO> getListAtividades() {
		return listAtividades;
	}

	/**
	 * @param listAtividades the listAtividades to set
	 */
	public void setListAtividades(List<AtividadeChecklistDTO> listAtividades) {
		this.listAtividades = listAtividades;
	}
	
}