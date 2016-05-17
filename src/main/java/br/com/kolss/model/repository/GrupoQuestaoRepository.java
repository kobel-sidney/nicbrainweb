package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.GrupoQuestao;

/**
 * 
 * @author hamseshenrique
 *
 */
public interface GrupoQuestaoRepository {
	
	/**
	 * 
	 * @return
	 */
	List<GrupoQuestao> obterTodos(Contratante contratante);
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	GrupoQuestao obter(Long id);
	
	/**
	 * 
	 * @param grupoQuestao
	 */
	void salvar(GrupoQuestao grupoQuestao);
	
	/**
	 * 
	 * @param grupoQuestao
	 */
	void atualizar(GrupoQuestao grupoQuestao);
	
	/**
	 * 
	 * @param grupoQuestao
	 */
	void remover(GrupoQuestao grupoQuestao);

}
