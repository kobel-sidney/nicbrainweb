package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Pessoa;

public interface PessoaRepository {

	/**
	 * Retorna uma pessoa a partir do ID
	 *
	 * @param id
	 * @return
	 */
	Pessoa obter(Serializable id);

	/**
	 * Retorne todas pessoas
	 *
	 * @return
	 */
	List<Pessoa> obterTodos(Contratante contratante);

	List<Pessoa> findPessoasPorCliente(Cliente cliente);

	/**
	 * Salvar pessoa
	 *
	 * @param pessoa
	 */
	void salvar(Pessoa pessoa);

	/**
	 * Atualiza pessoa
	 *
	 * @param pessoa
	 */
	void atualizar(Pessoa pessoa);

	/**
	 * Exclui pessoa
	 *
	 * @param pessoa
	 */
	void excluir(Pessoa pessoa);


}
