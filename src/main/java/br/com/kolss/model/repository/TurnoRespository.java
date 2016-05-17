package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Turno;

public interface TurnoRespository {
	
	void atualizar(Turno turno); 
	void salvar(Turno turno) ;
	void remover(Turno turno);
	List<Turno> obterTodos(Contratante contratante);
	Turno obter(Serializable id);

}
