package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.TipoLocal;

public interface TipoLocalService {
	
	/**
	 * Retorna todos os tipos de locais
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	public List<TipoLocal> getTiposLocal() throws ServiceException;
}
