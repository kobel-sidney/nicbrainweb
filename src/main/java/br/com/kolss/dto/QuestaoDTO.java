package br.com.kolss.dto;

import java.util.ArrayList;
import java.util.List;

import br.com.kolss.model.enuns.TipoQuestaoEnum;

public class QuestaoDTO {
	
	private Long id;
	private String descricao;
	private Integer ordem;
	private TipoQuestaoDTO tipoQuestaoDTO;
	private List<RespostaDTO> listResposta = new ArrayList<RespostaDTO>(0);
	
	public QuestaoDTO(){}

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
	 * @return the ordem
	 */
	public Integer getOrdem() {
		return ordem;
	}

	/**
	 * @param ordem the ordem to set
	 */
	public void setOrdem(Integer ordem) {
		this.ordem = ordem;
	}

	/**
	 * @return the tipoQuestaoDTO
	 */
	public TipoQuestaoDTO getTipoQuestaoDTO() {
		return tipoQuestaoDTO;
	}

	/**
	 * @param tipoQuestaoDTO the tipoQuestaoDTO to set
	 */
	public void setTipoQuestaoDTO(TipoQuestaoDTO tipoQuestaoDTO) {
		this.tipoQuestaoDTO = tipoQuestaoDTO;
	}

	/**
	 * @return the listResposta
	 */
	public List<RespostaDTO> getListResposta() {
		if(listResposta == null){
			listResposta = new ArrayList<RespostaDTO>();
		}
		return listResposta;
	}

	/**
	 * @param listResposta the listResposta to set
	 */
	public void setListResposta(List<RespostaDTO> listResposta) {
		this.listResposta = listResposta;
	}
}