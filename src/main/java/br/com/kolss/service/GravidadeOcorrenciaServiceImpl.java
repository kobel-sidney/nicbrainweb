package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.GravidadeOcorrencia;
import br.com.kolss.model.repository.GravidadeOcorrenciaRepository;


@Service
public class GravidadeOcorrenciaServiceImpl
		implements GravidadeOcorrenciaService {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	protected GravidadeOcorrenciaRepository repository;
	
	
	/**
	 * Retorna a Gravidade Ocorrência pelo seu ID, contendo todos os seus
	 * atributos populados.
	 * 
	 * @param idGravidadeOcorrencia
	 * 
	 * @return
	 */
	public GravidadeOcorrencia obter(
			Serializable idGravidadeOcorrencia)
			throws ServiceException {
		logger.debug("GravidadeOcorrenciaServiceImpl.find(Integer)");
		
		return repository.find(idGravidadeOcorrencia);
	}
	
	/**
	 * Retorna a Gravidade Ocorrência pela sua descrição, contendo todos os
	 * seus atributos populados.
	 * 
	 * @param nomeGravidadeOcorrencia
	 * 
	 * @return
	 */
	public GravidadeOcorrencia obter(String nomeGravidadeOcorrencia)
			throws ServiceException {
		logger.debug("GravidadeOcorrenciaServiceImpl.find(String)");
		
		return repository.obter(nomeGravidadeOcorrencia);
	}
	
	/**
	 * Retorna todas as Gravidades Ocorrências cadastrados no sistema.
	 * 
	 * @return
	 */
	public List<GravidadeOcorrencia> obterTodos()
			throws ServiceException {
		logger.debug("GravidadeOcorrenciaServiceImpl.getGravidadesOcorrencias");
		
		return repository.obterTodos();
	}

}
