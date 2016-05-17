package br.com.kolss.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.OperacaoAtividade;
import br.com.kolss.model.entities.Status;
import br.com.kolss.model.entities.Usuario;


public interface OperacaoAtividadeChecklistService {
	
	/**
	 * Grava o log da Operação Executada
	 * 
	 * @param idAtividade
	 * @param usuario
	 * @param status
	 * @param latitude
	 * @param longitude
	 * @param dtHrStatus
	 * 
	 * @throws ServiceException
	 */
	void executarOperacao(Serializable idAtividade, Usuario usuario,
			Status status, String latitude, String longitude, Date dtHrStatus)
					throws ServiceException;
	
	/**
	 * Método que Busca Operações de Acordo com um Determinado Checklist
	 * 
	 * @param checklist
	 * 
	 * @return
	 */
	public List<OperacaoAtividade> getOperacoesDaAtividadeDoChecklist(
			Checklist checklist);
}
