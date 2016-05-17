package br.com.kolss.dto;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 * @author hamseshenrique
 *
 */
public class RetornoRondaDTO extends RetornoDTO {

	private List<RondaDTO> listRonda;
	private List<RondaDTO> rondasFinalizadas;
	private Set<GuarnicaoDTO> guarnicoes;

	public RetornoRondaDTO() {
		listRonda = new ArrayList<>(0);
		rondasFinalizadas = new ArrayList<>(0);
		guarnicoes = new HashSet<>(0);
	}

	/**
	 * @return the listRonda
	 */
	public List<RondaDTO> getListRonda() {
		return listRonda;
	}

	/**
	 * @param listRonda
	 *            the listRonda to set
	 */
	public void setListRonda(List<RondaDTO> listRonda) {
		this.listRonda = listRonda;
	}

	/**
	 * 
	 * @return
	 */
	public List<RondaDTO> getRondasFinalizadas() {
		return rondasFinalizadas;
	}

	/**
	 * 
	 * @param rondasFinalizadas
	 */
	public void setRondasFinalizadas(List<RondaDTO> rondasFinalizadas) {
		this.rondasFinalizadas = rondasFinalizadas;
	}

	/**
	 * 
	 * @return
	 */
	public Set<GuarnicaoDTO> getGuarnicoes() {
		return guarnicoes;
	}

	/**
	 * 
	 * @param guarnicoes
	 */
	public void setGuarnicoes(Set<GuarnicaoDTO> guarnicoes) {
		this.guarnicoes = guarnicoes;
	}

}
