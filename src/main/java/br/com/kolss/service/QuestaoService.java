package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Questao;
import br.com.kolss.model.entities.TipoQuestao;

/**
 * 
 * @author leonardo
 *
 */
public interface QuestaoService {

	List<Questao> obterTodos(Contratante contratante) throws ServiceException;

	List<TipoQuestao> obterTipoQuestao(Contratante contratante) throws ServiceException;

	void salvar(Questao questao) throws ServiceException;

	void atualizar(Questao questao) throws ServiceException;

	void remover(Questao questao) throws ServiceException;
}
