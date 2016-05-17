package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.Contato;
import br.com.kolss.model.entities.EnderecoNovoModelo;

public interface EnderecoNovoModeloRepository {

	void adicionar(EnderecoNovoModelo endereco);

	void remover(EnderecoNovoModelo endereco);

	List<EnderecoNovoModelo> listarPorContato(Contato contato);
}
