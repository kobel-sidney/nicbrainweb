package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Fornecedor;

public interface FornecedorService {

	List<Fornecedor> obterTodos(Contratante  contratante) throws ServiceException;

	void salvar(Fornecedor model) throws ServiceException;

	void atualizar(Fornecedor model) throws ServiceException;

	void remover(Fornecedor model) throws ServiceException;

}