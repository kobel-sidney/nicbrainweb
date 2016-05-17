package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.AbstractEntity;

public interface DadosMestresRepository<T extends AbstractEntity<?>> {

	void atualizar(T entity);
	void salvar(T entity) throws ServiceException;
	void remover(T entity);
	List<T> obterTodos(Class<T> clazz);
	T obter(Serializable id, Class<T> clazz);
	

}
