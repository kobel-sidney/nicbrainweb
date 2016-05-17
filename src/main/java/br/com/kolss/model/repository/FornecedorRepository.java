package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Fornecedor;

public interface FornecedorRepository {

	List<Fornecedor> obterTodos(Contratante contratante);

	void salvar(Fornecedor fornecedor);

	void atualizar(Fornecedor fornecedor);

	void remover(Fornecedor fornecedor);

}
