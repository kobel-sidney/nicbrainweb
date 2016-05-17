package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.PostoServico;


/**
 * Classe estrutural para o Repository.
 */
public abstract class AbstractRepository {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	/**
	 * Verifica se o ID tem um valor válido.
	 * 
	 * @param id
	 * 
	 * @return
	 */
	protected boolean isValidId(Serializable id) {
		logger.debug("AbstractRepository.isValidId");
		
		boolean validId = false;
		try {
			validId = ((Number) id).intValue() > 0;
		} catch (Exception e) {
			validId = false;
		}
		
		return validId;
	}
}
