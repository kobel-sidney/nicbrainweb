package br.com.kolss.model.repository;

import br.com.kolss.model.entities.Contato;
import br.com.kolss.model.entities.PessoaNovoModelo;

public interface ContatoRepository {

	void adicionar(Contato contato);

	void remover(Contato contato);

	Contato buscarPorPessoa(PessoaNovoModelo pessoa);
}
