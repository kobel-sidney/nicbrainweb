package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TipoClassificacao;


public interface TipoClassificacaoService {
	
	/**
	 * Obtém o Tipo Classificação, pelo seu ID.
	 * 
	 * @param idTipoClassificacao
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	TipoClassificacao obter(Serializable idTipoClassificacao) throws ServiceException;
	
	/**
	 * Retorna o <i>entity</i> do Tipo Classificação, caso ele exista no banco.<br>
	 * Em caso positivo, irá retornar os dados do Tipo Classificação.<br>
	 * Em caso negativo, irá lançar uma exceção!
	 * 
	 * @return List<TipoClassificacao>
	 * 
	 * @throws ServiceException
	 */
	List<TipoClassificacao> obterTodos(Contratante contratante) throws ServiceException;
}
