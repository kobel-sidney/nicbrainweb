package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.EmailPessoa;
import br.com.kolss.model.entities.Pessoa;

public interface EmailPessoaRepository {

	/**
	 *
	 * @param pessoa
	 * @return Lista telefones por pessoa
	 */
	List<EmailPessoa> listarPorPessoa(Pessoa pessoa);

	/**
	 * Salva um email
	 *
	 * @param email
	 */
	void salvar(EmailPessoa email);

	/**
	 * Exclui um email
	 *
	 * @param email
	 */
	void excluir(EmailPessoa email);

	EmailPessoa buscar(Long id);
}
