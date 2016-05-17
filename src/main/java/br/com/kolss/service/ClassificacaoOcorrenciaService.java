package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.dto.ClassificacaoOcorrenciaDTO;
import br.com.kolss.dto.TipoClassificacaoOcorrenciaDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.ClassificacaoOcorrencia;
import br.com.kolss.model.entities.Contratante;


public interface ClassificacaoOcorrenciaService {
	
	/**
	 * Retorna a Classificação Ocorrência pelo seu ID, contendo todos os seus
	 * atributos populados.
	 * 
	 * @param idClassificacaoOcorrencia
	 * 
	 * @return
	 */
	ClassificacaoOcorrencia obter(Serializable idClassificacaoOcorrencia) throws ServiceException;
	
	/**
	 * Retorna a Classificação Ocorrência pela sua descrição, contendo todos os
	 * seus atributos populados.
	 * 
	 * @param nomeClassificacaoOcorrencia
	 * 
	 * @return
	 */
	ClassificacaoOcorrencia obterPorNome(String nomeClassificacaoOcorrencia ,Contratante contratante)throws ServiceException;
	
	/**
	 * Retorna todas as Classificações Ocorrência cadastrados no sistema.
	 * 
	 * @return
	 */
	List<ClassificacaoOcorrencia> obterTodos(Contratante contratante);
	
	/**
	 * Retorna todas as Classificações Ocorrência cadastrados no sistema para o mobile
	 * 
	 * @return
	 */
	List<ClassificacaoOcorrenciaDTO> getClassificacoesOcorrenciasDTO(Contratante contratante);
	
	
	/**
	 * Retorna todas as Classificações Ocorrência cadastrados no sistema para o mobile
	 * 
	 * @return
	 */
	List<TipoClassificacaoOcorrenciaDTO> obterTipoClassificacoesOcorrenciasDTO(Long valueOf, Contratante contratante);


	

	
	
}
