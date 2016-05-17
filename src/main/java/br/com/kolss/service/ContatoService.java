package br.com.kolss.service;

import br.com.kolss.model.entities.Contato;
import br.com.kolss.model.entities.PessoaNovoModelo;

public interface ContatoService {

	void adicionar(Contato contato);

	void remover(Contato contato);

	Contato buscarPorPessoa(PessoaNovoModelo pessoa);
}
