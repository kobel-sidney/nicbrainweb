package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.Contato;
import br.com.kolss.model.entities.Email;

public interface EmailRepository {

	void adicionar(Email email);

	void remover(Email email);

	List<Email> listarPorContato(Contato contato);
}
