package br.com.kolss.service;

import java.io.Serializable;

import br.com.kolss.exception.ServiceException;


public interface AlertaService {

	/**
	 * Verifica se existe algum alerta ativo no Local desejado.
	 * 
	 * @param idLocal
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	boolean existeAlertaAtivoPorLocal(Integer idLocal) throws ServiceException;
	
	
	/**
	 * Verifica se existe alguma Ocorrência ativa no Local e autorizada para o
	 * Usuário selecionado (via contexto).
	 * 
	 * @param idLocal
	 * @param idUsuario
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	boolean existeAlertaOcorrenciaAtivoPorLocalPorContexto(Serializable idLocal,
			Serializable idUsuario) throws ServiceException;
}
