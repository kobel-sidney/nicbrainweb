package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Endereco;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Pessoa;

/**
 * Serviço responsável pelas opereções com os Endereços
 */
public interface EnderecoService {

	/**
	 * Salva um novo endereço.
	 *
	 * @param endereco
	 *
	 * @throws ServiceException
	 */
	void salvar(Endereco endereco) throws ServiceException;

	/**
	 * Atualiza um Endereço existente.
	 *
	 * @param endereco
	 *
	 * @throws ServiceException
	 */
	void atualizar(Endereco endereco) throws ServiceException;

	/**
	 * Remove um Endereço existente.
	 *
	 * @param endereco
	 *
	 * @throws ServiceException
	 */
	void remover(Endereco endereco) throws ServiceException;

	/**
	 * Retorna um endereço a partir do seu identificador.
	 *
	 * @param id
	 *
	 * @throws ServiceException
	 */
	Endereco buscar(Long id) throws ServiceException;

	/**
	 * Retorna os endereços do contratante.
	 *
	 * @param contratante
	 *
	 * @throws ServiceException
	 */
	List<Endereco> listarPorContratante(Contratante contratante)
			throws ServiceException;

	/**
	 * Retorna os endereços do cliente.
	 *
	 * @param cliente
	 *
	 * @throws ServiceException
	 */
	List<Endereco> listarPorCliente(Cliente cliente) throws ServiceException;

	/**
	 * Retorna o endereco completo: Municipio, Estado e País.
	 *
	 * @param id
	 *
	 * @throws ServiceException
	 */
	Endereco listarEnderecoCompleto(Long id) throws ServiceException;

	List<Endereco> buscarPorLocal(Local local);

	/**
	 * Retorna os endereços da pessoa.
	 *
	 * @param pessoa
	 *
	 * @throws ServiceException
	 */
	List<Endereco> listarPorPessoa(Pessoa pessoa) throws ServiceException;

	List<Endereco> obterTodos();

	void salvarEnderecoCliente(Endereco endereco) throws ServiceException;
}