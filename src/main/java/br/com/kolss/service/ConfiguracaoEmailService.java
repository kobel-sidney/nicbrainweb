package br.com.kolss.service;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.ConfiguracaoEmail;

/**
 * Serviço responsável pelas opereções com as configuracoes de email
 */
public interface ConfiguracaoEmailService {

	/**
	 * Salva a configuracao de email.
	 * 
	 * @param configEmail
	 * 
	 * @throws ServiceException
	 */
	void salvar(ConfiguracaoEmail configEmail) throws ServiceException;
	
	/**
	 * Atualizar a configuracao de email.
	 * 
	 * @param configEmail
	 * 
	 * @throws ServiceException
	 */
	void atualizar(ConfiguracaoEmail configEmail) throws ServiceException;

}