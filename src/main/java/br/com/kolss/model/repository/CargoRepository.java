package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.model.entities.Cargo;
import br.com.kolss.model.entities.Contratante;

public interface CargoRepository {
	
	void atualizar(Cargo cargo); 
	void salvar(Cargo cargo) ;
	void remover(Cargo cargo);
	List<Cargo> obterTodos(Contratante contratante);
	Cargo obter(Serializable id);

}
