package br.com.kolss.dto;

import java.util.ArrayList;
import java.util.List;

public class GrupoQuestaoDTO extends RetornoDTO{
	
	private Long id;
	private String descricao;
	private Integer order;
	private List<QuestaoDTO> listQuestao = new ArrayList<QuestaoDTO>(0);
	
	public GrupoQuestaoDTO(){}

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the descricao
	 */
	public String getDescricao() {
		return descricao;
	}

	/**
	 * @param descricao the descricao to set
	 */
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	/**
	 * @return the order
	 */
	public Integer getOrder() {
		return order;
	}

	/**
	 * @param order the order to set
	 */
	public void setOrder(Integer order) {
		this.order = order;
	}

	/**
	 * @return the listQuestao
	 */
	public List<QuestaoDTO> getListQuestao() {
		if(listQuestao == null){
			listQuestao = new ArrayList<QuestaoDTO>();
		}
		return listQuestao;
	}

	/**
	 * @param listQuestao the listQuestao to set
	 */
	public void setListQuestao(List<QuestaoDTO> listQuestao) {
		this.listQuestao = listQuestao;
	}
	
}
