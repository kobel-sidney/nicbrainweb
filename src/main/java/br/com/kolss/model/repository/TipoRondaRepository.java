package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.TipoRonda;

public interface TipoRondaRepository {

	/**
	 * 
	 * @param tipoRonda
	 */
	void salvar(TipoRonda tipoRonda);
	
	/**
	 * 
	 * @param tipoRonda
	 */
	void excluir(TipoRonda tipoRonda);
	
	/**
	 * 
	 * @return
	 */
	List<TipoRonda> obterRondas();
}
