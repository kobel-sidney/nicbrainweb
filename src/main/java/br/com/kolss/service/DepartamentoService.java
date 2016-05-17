package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Departamento;


public interface DepartamentoService {
	
	void atualizar(Departamento departamento)throws ServiceException; 
	void salvar(Departamento departamento) throws ServiceException;
	void remover(Departamento departamento)throws ServiceException;
	List<Departamento> obterTodos(Contratante contratante)throws ServiceException;
	Departamento obter(Serializable id,Contratante contratante )throws ServiceException;
}
