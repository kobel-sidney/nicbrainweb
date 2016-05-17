package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.TipoUsuario;

public interface TipoUsuarioRepository {

	/**
	 * Retorna um tipo de usuario a partir do ID
	 *
	 * @param id
	 * @return
	 * @throws ServiceException
	 */
	TipoUsuario find(Serializable id) throws ServiceException;

	/**
	 * Retorna todos os tipos de usuarios
	 *
	 * @return
	 * @throws ServiceException
	 */
	List<TipoUsuario> listarTipoUsuario() throws ServiceException;
}
