package br.com.kolss.service;

import br.com.kolss.dto.RelatorioDTO;
/**
 * 
 * @author hamseshenrique
 *
 */
public interface RelatorioService {
	
	/**
	 * 
	 * @param relatorioDTO
	 * @return
	 */
	Boolean criarRelatorio(final RelatorioDTO relatorioDTO); 

}
