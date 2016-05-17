package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Local;

public interface LocalService {

	/**
	 * Retorna o Local pelo seu ID.
	 * 
	 * @param idLocal
	 * 
	 * @return
	 */
	Local getLocal(Serializable idLocal) throws ServiceException;

	/**
	 * Obtém todos os locais cadastrados no sistema
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Local> getLocais() throws ServiceException;

	/**
	 * Obtém todos os locais autorizados pelo Usuário (via contexto).
	 * 
	 * @param idUsuarioContexto
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Local> getLocais(Serializable idUsuarioContexto) throws ServiceException;

	/**
	 * Obtém todos os locais autorizados pelo Usuário (via contexto).
	 * 
	 * @param idCliente
	 * @param idUsuarioContexto
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Local> getLocais(Serializable idCliente, Serializable idUsuarioContexto) throws ServiceException;

	/**
	 * Obtém todos os Locais com Eventos permitidos para o Usuário (via
	 * contexto).
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Local> getLocaisPorEventosAtivosPorContexto() throws ServiceException;

	/**
	 * Obtém todos os Locais por Cliente
	 * 
	 * @return
	 * 
	 */
	List<Local> getLocaisPorCliente(Cliente cliente);

	/**
	 * Retorna todos os locais aos Clientes que o Usuário selecionado possui
	 * autorização, ordenados pelo nome do local.
	 * 
	 * @param idUsuarioContexto
	 * @return
	 * @throws ServiceException
	 */
	List<Local> getLocaisPorClientes(Serializable idUsuarioContexto) throws ServiceException;

	List<Local> getLocaisAtivosPorCliente(Cliente cliente) throws ServiceException;

	void salvarOuAtualizar(Local local) throws ServiceException;

	List<Local> getLocaisRonda(Long idUsuario) throws ServiceException;

	List<Local> getLocaisPorContratante(Contratante contratante) throws ServiceException;

	/**
	 * 
	 * @param cliente
	 * @return
	 * @throws ServiceException
	 */
	List<Local> obterLocaisDeRondaPorCliente(Cliente cliente) throws ServiceException;
}
