package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.Estado;
import br.com.kolss.model.entities.Municipio;

public interface MunicipioRepository {

	Municipio obter(Long id);
	List<Municipio> obterTodos();
	List<Municipio> obterPorEstado(Estado uf);
	void salvar(Municipio municipio);
	void atualizar(Municipio municipio);
	void remover(Municipio municipio);

}
