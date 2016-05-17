package br.com.kolss.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.AtividadeOcorrencia;
import br.com.kolss.model.entities.OperacaoAtividadeOcorrencia;
import br.com.kolss.model.entities.Status;
import br.com.kolss.model.entities.Usuario;


public interface OperacaoAtividadeOcorrenciaService {
	
	/**
	 * Grava o log da Operação Executada
	 * 
	 * @param idAtividadeOcorrencia
	 * @param usuario
	 * @param status
	 * @param latitude
	 * @param longitude
	 * @param dtHrStatus
	 * 
	 * @throws ServiceException
	 */
	void executarOperacao(Serializable idAtividadeOcorrencia, Usuario usuario,
			Status status, String latitude, String longitude, Date dtHrStatus)
					throws ServiceException;
	
	/**
	 * Método que Busca Operações de Acordo com uma determinada
	 * AtividadeOcorrencia
	 * 
	 * @param atividadeOcorrencia
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	public List<OperacaoAtividadeOcorrencia> getOperacoesAtividadesOcorrencias(
			AtividadeOcorrencia atividadeOcorrencia) throws ServiceException;
}
