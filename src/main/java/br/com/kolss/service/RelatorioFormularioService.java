package br.com.kolss.service;

import br.com.kolss.dto.RelatorioFormularioDTO;

/**
 * 
 * @author hamseshenrique
 *
 */
public interface RelatorioFormularioService {
	
	/**
	 * 
	 * @param idAtividade
	 * @return
	 */
	RelatorioFormularioDTO gerarRelatorio(final Long idAtividade);

}
