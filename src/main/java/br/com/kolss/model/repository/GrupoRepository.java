package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Grupo;

public interface GrupoRepository {
	
	void atualizar(Grupo grupo)throws ServiceException; 
	void salvar(Grupo grupo) throws ServiceException;
	void remover(Grupo grupo)throws ServiceException;
	List<Grupo> obterTodos(Contratante contratante)throws ServiceException;
	Grupo obter(Serializable id)throws ServiceException;

}
