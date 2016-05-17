package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;

public interface ClienteService {

	/**
	 * Retorna o Cliente através da PK
	 * 
	 * @param id
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	Cliente find(Long id) throws ServiceException;

	/**
	 * Salva o cliente
	 * 
	 * @param cliente
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	void salvar(Cliente cliente) throws ServiceException;

	/**
	 * Atualiza o cliente
	 * 
	 * @param cliente
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	void atualizar(Cliente cliente) throws ServiceException;

	/**
	 * Remove o cliente
	 * 
	 * @param cliente
	 * @throws ServiceException
	 */
	void remover(Cliente cliente) throws ServiceException;

	/**
	 * Retorna todos os Clientes que o Usuário solicitante tem permissão de
	 * visualização.
	 * 
	 * @param idUsuarioContexto
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Cliente> getClientes(Serializable idUsuarioContexto)
			throws ServiceException;

	/**
	 * Obtém todos os Clientes por Contratante.
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Cliente> getClientesPorContratante(Contratante contratante);

}
