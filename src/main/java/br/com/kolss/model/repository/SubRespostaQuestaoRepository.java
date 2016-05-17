package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.dto.SubRespostaQuestaoDTO;
import br.com.kolss.model.entities.SubRespostaQuestao;

public interface SubRespostaQuestaoRepository {
	
	/**
	 * 
	 * @param subRespostaQuestao
	 */
	void saveOrUpdate(final SubRespostaQuestao subRespostaQuestao);
	
	/**
	 * 
	 * @param subRespostaQuestaoDTO
	 * @return
	 */
	SubRespostaQuestao obterRespostaQuestao(final SubRespostaQuestaoDTO subRespostaQuestaoDTO);
	
	/**
	 * 
	 * @param subRespostaQuestaoDTO
	 * @return
	 */
	List<SubRespostaQuestao> obter(final SubRespostaQuestaoDTO subRespostaQuestaoDTO);


}
