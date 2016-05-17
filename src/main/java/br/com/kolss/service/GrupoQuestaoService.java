package br.com.kolss.service;

import java.util.List;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.GrupoQuestao;

/**
 * 
 * @author leonardo
 *
 */
public interface GrupoQuestaoService {

	List<GrupoQuestao> obterTodos(Contratante contratante);

	void obter(GrupoQuestao grupoQuestao);

	void salvar(GrupoQuestao grupoQuestao);

	void atualizar(GrupoQuestao grupoQuestao);

	void remover(GrupoQuestao grupoQuestao);

}
