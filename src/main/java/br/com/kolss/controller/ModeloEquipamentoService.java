package br.com.kolss.controller;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.ModeloEquipamento;

public interface ModeloEquipamentoService {
	
	List<ModeloEquipamento> obterTodos(Contratante contratante)throws ServiceException;
	ModeloEquipamento obter(Serializable id)throws ServiceException;
	void atualizar(ModeloEquipamento entity)throws ServiceException; 
	void salvar(ModeloEquipamento entity) throws ServiceException;
	void remover(ModeloEquipamento entity)throws ServiceException;
	

}
