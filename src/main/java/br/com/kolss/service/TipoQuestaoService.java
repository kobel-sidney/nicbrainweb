package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TipoQuestao;

/**
 * 
 * @author leonardo
 *
 */
public interface TipoQuestaoService {

	void salvar(TipoQuestao tipoQuestao) throws ServiceException;

	void atualizar(TipoQuestao tipoQuestao) throws ServiceException;

	void remover(TipoQuestao tipoQuestao) throws ServiceException;

	List<TipoQuestao> obterTodos(Contratante contratante) throws ServiceException;

	TipoQuestao obter(Serializable idTipoQuestao) throws ServiceException;;

}
