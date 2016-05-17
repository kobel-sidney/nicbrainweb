package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.Regra;

public interface RegraRepository {

	/**
	 * 
	 * @return
	 */
	List<Regra> obterRegras();
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	Regra obterRegras(Long id);
}
