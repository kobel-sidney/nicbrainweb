package br.com.kolss.model.dao;

import java.util.List;

import br.com.kolss.model.entities.SubQuestao;
/**
 * 
 * @author hamseshenrique
 *
 */
public interface SubQuestaoDao {
	
	/**
	 * 
	 * @param idRelacionamento
	 * @return
	 */
	List<SubQuestao> obterSubQuestao(final Long idRelacionamento);

}
