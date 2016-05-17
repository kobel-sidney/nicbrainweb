package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.TipoRonda;

public interface TipoRondaService {

	/**
	 * 
	 * @param tipoRonda
	 * @throws ServiceException
	 */
	void salvar(TipoRonda tipoRonda) throws ServiceException;

	/**
	 * 
	 * @param tipoRonda
	 * @throws ServiceException
	 */
	void excluir(TipoRonda tipoRonda) throws ServiceException;

	/**
	 * 
	 * @return
	 */
	List<TipoRonda> obterRondas();
}
