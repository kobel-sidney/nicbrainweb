package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.EmailPessoa;
import br.com.kolss.model.entities.Pessoa;

public interface EmailPessoaService {

	/**
	 *
	 * @param pessoa
	 * @return Lista telefones por pessoa
	 */
	List<EmailPessoa> listarPorPessoa(Pessoa pessoa) throws ServiceException;

	/**
	 * Salva um email
	 *
	 * @param email
	 * @throws ServiceException
	 */
	void salvar(EmailPessoa email) throws ServiceException;

	/**
	 * Eclui um email
	 *
	 * @param email
	 * @throws ServiceException
	 */
	void excluir(EmailPessoa email) throws ServiceException;

	EmailPessoa buscar(Long id);
}
