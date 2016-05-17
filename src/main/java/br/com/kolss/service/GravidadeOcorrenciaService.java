package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.GravidadeOcorrencia;


public interface GravidadeOcorrenciaService {

	/**
	 * Retorna a Gravidade Ocorrência pelo seu ID, contendo todos os seus
	 * atributos populados.
	 * 
	 * @param idGravidadeOcorrencia
	 * 
	 * @return
	 */
	GravidadeOcorrencia obter(
			Serializable idGravidadeOcorrencia) throws ServiceException;
	
	/**
	 * Retorna a Gravidade Ocorrência pela sua descrição, contendo todos os
	 * seus atributos populados.
	 * 
	 * @param nomeGravidadeOcorrencia
	 * 
	 * @return
	 */
	GravidadeOcorrencia obter(String nomeGravidadeOcorrencia)
			throws ServiceException;
	
	/**
	 * Retorna todas as Gravidades Ocorrências cadastrados no sistema.
	 * 
	 * @return
	 */
	List<GravidadeOcorrencia> obterTodos()throws ServiceException;
	
}
