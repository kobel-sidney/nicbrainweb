package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.TelefonePessoa;

public interface TelefonePessoaService {

	/**
	 *
	 * @param pessoa
	 * @return Lista telefones por pessoa
	 */
	List<TelefonePessoa> listarPorPessoa(Pessoa pessoa) throws ServiceException;

	/**
	 * Salva um telefone
	 *
	 * @param telefone
	 * @throws ServiceException
	 */
	void salvar(TelefonePessoa telefone) throws ServiceException;

	/**
	 * Eclui um telefone
	 *
	 * @param telefone
	 * @throws ServiceException
	 */
	void excluir(TelefonePessoa telefone) throws ServiceException;

	TelefonePessoa buscar(Long id);
}
