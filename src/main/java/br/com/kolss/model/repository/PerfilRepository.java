package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Perfil;

public interface PerfilRepository {

	/**
	 * Retorna um perfil por id
	 *
	 * @param id
	 * @return
	 * @throws ServiceException
	 */
	Perfil find(Serializable id) throws ServiceException;

	/**
	 * Retorna lista de todos usuarios
	 *
	 * @return
	 * @throws ServiceException
	 */
	List<Perfil> listarPerfis() throws ServiceException;
}

