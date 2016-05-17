package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Pessoa;

public interface PessoaService {

	/**
	 * Obtém a pessoa pela sua chave.
	 *
	 * @param idPessoa
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	Pessoa obter(Serializable idPessoa) throws ServiceException;

	/**
	 * Obtém as pessoas através do cliente.
	 *
	 * @param idCliente
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	Set<Pessoa> obterTodos(Cliente cliente) throws ServiceException;

	/**
	 * Exclusão lógica de pessoa
	 *
	 * @param pessoa
	 * @throws ServiceException
	 */
	void excluir(Pessoa pessoa) throws ServiceException;

	/**
	 * Salva pessoa
	 *
	 * @param pessoa
	 * @throws ServiceException
	 */
	void salvar(Pessoa pessoa) throws ServiceException;
	
	
	/**
	 * Buscar pessoa
	 *
	 * @param pessoa
	 * @throws ServiceException
	 */
	List<Pessoa> obterTodos(Contratante contratante) throws ServiceException;
}
