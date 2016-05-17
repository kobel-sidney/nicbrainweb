package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.AbstractEntity;

/**
 * Serviço responsável pelos Dados Mestres
 */
public interface DadosMestresService<T extends AbstractEntity<?>> {
	
	void atualizar(T entity)throws ServiceException; 
	void salvar(T entity) throws ServiceException;
	void remover(T entity)throws ServiceException;
	List<T> obterTodos()throws ServiceException;
	T obter(Serializable id)throws ServiceException;
	
	
}