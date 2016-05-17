package br.com.kolss.model.dao;

import java.util.List;

import br.com.kolss.model.entities.RelacionamentoPerfilFormulario;

/**
 * 
 * @author hamseshenrique
 *
 */
public interface RelacionamentoPerfilFormularioDao {
	
	/**
	 * 
	 * @param idPerfil
	 * @return
	 */
	List<RelacionamentoPerfilFormulario> obterRelacionamentoPorPerfil(final Long idPerfil);

}
