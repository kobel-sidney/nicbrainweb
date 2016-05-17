package br.com.kolss.service;

import java.io.Serializable;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.enuns.SituacaoEnum;
import br.com.kolss.model.enuns.SituacaoOcorrenciaEnum;


public interface SituacaoService {
	
	/**
	 * Retorna a situação atual da Atividade.
	 * 
	 * @param atividade
	 * 
	 * @return
	 */
	SituacaoEnum obterSituacaoPorAtividade(Atividade atividade) throws ServiceException;
	
	/**
	 * Retorna a situação atual do Checklist.
	 * 
	 * @param checklist
	 * 
	 * @return
	 */
	SituacaoEnum obterPorChecklist(Checklist checklist) throws ServiceException;
	
	/**
	 * Retorna a situação atual do Evento.
	 * 
	 * @param evento
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	SituacaoEnum obterSituacaoPorEvento(Evento evento) throws ServiceException;
	
	/**
	 * Retorna a situação atual do Local.
	 * 
	 * @param local
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	SituacaoEnum obterSituacaoPorLocal(Local local) throws ServiceException;
	
	/**
	 * Retorna a situação ocorrência atual do Local.
	 * 
	 * @param local
	 * @param idUsuarioContexto
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	SituacaoOcorrenciaEnum obterSituacaoOcorrencia(Local local,Serializable idUsuarioContexto) throws ServiceException;
	
}
