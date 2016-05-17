package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Cargo;
import br.com.kolss.model.entities.Contratante;


public interface CargoService {
	
	void atualizar(Cargo cargo)throws ServiceException; 
	void salvar(Cargo cargo) throws ServiceException;
	void remover(Cargo cargo)throws ServiceException;
	List<Cargo> obterTodos(Contratante contratante)throws ServiceException;
	Cargo obter(Serializable id)throws ServiceException;

}
