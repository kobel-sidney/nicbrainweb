package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.TelefonePessoa;

public interface TelefonePessoaRepository {

	/**
	 *
	 * @param pessoa
	 * @return Lista telefones por pessoa
	 */
	List<TelefonePessoa> listarPorPessoa(Pessoa pessoa);

	/**
	 * Salva um telefone
	 *
	 * @param telefone
	 */
	void salvar(TelefonePessoa telefone);

	/**
	 * Exclui um telefone
	 *
	 * @param telefone
	 */
	void excluir(TelefonePessoa telefone);

	TelefonePessoa buscar(Long id);
}
