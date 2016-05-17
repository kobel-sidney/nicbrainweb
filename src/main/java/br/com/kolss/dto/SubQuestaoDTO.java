package br.com.kolss.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author hamseshenrique
 *
 */
public class SubQuestaoDTO {
	
	private Long id;
	private Long idQuestao;
	private String descricao;
	private Integer ordemPergunta;
	private Integer ordemResposta;
	private TipoQuestaoDTO tipoQuestaoDTO;
	private List<RespostaDTO> listResposta = new ArrayList<RespostaDTO>(0);
	
	public SubQuestaoDTO(){}

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
	 * @return the idQuestao
	 */
	public Long getIdQuestao() {
		return idQuestao;
	}

	/**
	 * @param idQuestao the idQuestao to set
	 */
	public void setIdQuestao(Long idQuestao) {
		this.idQuestao = idQuestao;
	}

	/**
	 * @return the ordemPergunta
	 */
	public Integer getOrdemPergunta() {
		return ordemPergunta;
	}

	/**
	 * @param ordemPergunta the ordemPergunta to set
	 */
	public void setOrdemPergunta(Integer ordemPergunta) {
		this.ordemPergunta = ordemPergunta;
	}

	/**
	 * @return the ordemResposta
	 */
	public Integer getOrdemResposta() {
		return ordemResposta;
	}

	/**
	 * @param ordemResposta the ordemResposta to set
	 */
	public void setOrdemResposta(Integer ordemResposta) {
		this.ordemResposta = ordemResposta;
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
		return listResposta;
	}

	/**
	 * @param listResposta the listResposta to set
	 */
	public void setListResposta(List<RespostaDTO> listResposta) {
		this.listResposta = listResposta;
	}
}