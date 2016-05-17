package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Turno;

public interface TurnoService  {

	void atualizar(Turno turno)throws ServiceException; 
	void salvar(Turno turno) throws ServiceException;
	void remover(Turno turno)throws ServiceException;
	List<Turno> obterTodos(Contratante contratante)throws ServiceException;
	Turno obter(Serializable id)throws ServiceException;
}
