package br.com.kolss.model.dao;

import br.com.kolss.model.entities.PerfilFormulario;

/**
 * 
 * @author hamseshenrique
 *
 */
public interface PerfilFormularioDao {

	/**
	 * 
	 * @param id
	 * @return
	 */
	PerfilFormulario findById(final Long id);

}
