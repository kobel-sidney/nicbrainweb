package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.Documento;
import br.com.kolss.model.entities.PessoaNovoModelo;

public interface DocumentoRepository {

	List<Documento> listarTodos();

	List<Documento> listarPorPessoa(PessoaNovoModelo pessoa);

	Documento buscar(Long id);

	void adicionar(Documento documento);

	void remover(Documento documento);
}