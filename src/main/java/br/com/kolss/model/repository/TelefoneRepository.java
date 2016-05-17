package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.Contato;
import br.com.kolss.model.entities.Telefone;

public interface TelefoneRepository {

	void adicionar(Telefone telefone);

	void remover(Telefone telefone);

	List<Telefone> listarPorContato(Contato contato);
}
