package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Questao;
import br.com.kolss.model.entities.TipoQuestao;

/**
 * 
 * @author hamseshenrique
 *
 */
public interface QuestaoRepository {

	/**
	 * 
	 * @param id
	 * @return
	 */
	Questao find(final Long id);
	
    /**
     * 
     * @return
     */
	List<Questao> obterTodos(Contratante contratante);
    /**
     * 
     * @param contratante 
     * @return
     */
	List<TipoQuestao> obterTipoQuestao(Contratante contratante);
    /**
     * 
     * @param questao
     */
	void salvar(Questao questao);
    /**
     * 
     * @param questao
     */
	void atualizar(Questao questao);
    /**
     * 
     * @param questao
     */
	void remover(Questao questao);
	
	/**
	 * 
	 * @param idQuestao
	 * @return
	 */
	String obterDescricao(final Long idQuestao);
}
