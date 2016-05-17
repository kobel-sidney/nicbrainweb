package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.model.entities.Status;

public interface StatusRepository {

	Status obter(Serializable idStatus);

	List<Status> obterStatusAlteraveis();

	List<Status> obterChecklistStatus();

	List<Status> obterTodos();

	void remover(Status status);

	void atualizar(Status status);

	void salvar(Status status);

}
