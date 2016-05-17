package br.com.kolss.dto;

import java.util.List;

/**
 * 
 * @author hamseshenrique
 *
 */
public class EnvioFormularioDTO {
	
	private List<RespostaQuestaoDTO> listRespostaQuestao;
	private List<SubRespostaQuestaoDTO> listSubRespostaQuestao;
	
	
	public EnvioFormularioDTO(){}


	/**
	 * @return the listRespostaQuestao
	 */
	public List<RespostaQuestaoDTO> getListRespostaQuestao() {
		return listRespostaQuestao;
	}


	/**
	 * @param listRespostaQuestao the listRespostaQuestao to set
	 */
	public void setListRespostaQuestao(List<RespostaQuestaoDTO> listRespostaQuestao) {
		this.listRespostaQuestao = listRespostaQuestao;
	}


	/**
	 * @return the listSubRespostaQuestao
	 */
	public List<SubRespostaQuestaoDTO> getListSubRespostaQuestao() {
		return listSubRespostaQuestao;
	}


	/**
	 * @param listSubRespostaQuestao the listSubRespostaQuestao to set
	 */
	public void setListSubRespostaQuestao(
			List<SubRespostaQuestaoDTO> listSubRespostaQuestao) {
		this.listSubRespostaQuestao = listSubRespostaQuestao;
	}
}