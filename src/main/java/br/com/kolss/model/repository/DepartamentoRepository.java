package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Departamento;

public interface DepartamentoRepository {
	
	void atualizar(Departamento departamento); 
	void salvar(Departamento departamento);
	void remover(Departamento departamento);
	List<Departamento> obterTodos(Contratante contratante);
	Departamento obter(Serializable id,Contratante contratante);

}
