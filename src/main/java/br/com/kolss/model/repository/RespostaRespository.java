package br.com.kolss.model.repository;

import br.com.kolss.model.entities.Resposta;

/**
 * 
 * @author hamseshenrique
 *
 */
public interface RespostaRespository {
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	Resposta obter(final Long id);
	
	/**
	 * 
	 * @param idResposta
	 * @return
	 */
	String obterDescricao(final Long idResposta);

}
