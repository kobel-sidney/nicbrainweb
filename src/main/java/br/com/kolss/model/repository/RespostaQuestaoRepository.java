package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.dto.RespostaQuestaoDTO;
import br.com.kolss.model.entities.RespostaQuestao;
/**
 * 
 * @author hamseshenrique
 *
 */
public interface RespostaQuestaoRepository {
	/**
	 * 
	 * @param respostaQuestao
	 */
	void saveOrUpdate(final RespostaQuestao respostaQuestao);
	
	/**
	 * 
	 * @param respostaQuestao
	 * @return
	 */
	RespostaQuestao obterRespostaQuestao(final RespostaQuestaoDTO respostaQuestao);
	
	/**
	 * 
	 * @param idAtividade
	 * @return
	 */
	List<RespostaQuestao> obterRespostaQuestaoPorAtividade(final Long idAtividade);

}
