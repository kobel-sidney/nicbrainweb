package br.com.kolss.service;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import br.com.kolss.dto.QuantidadeChecklistsPorLocalDTO;
import br.com.kolss.dto.QuantidadeStatusChecklistPorLocalDTO;
import br.com.kolss.exception.ServiceException;


public interface DashboardService {
	
	/**
	 * Retorna a quantidade de Checklists por Locais para a exibição do Dashboard.
	 * 
	 * @param dateFrom
	 * @param dateTo
	 * @param idUsuarioContexto
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<QuantidadeChecklistsPorLocalDTO> getQuantidadeChecklistsPorLocais(
			Date dateFrom, Date dateTo, Serializable idUsuarioContexto)
					throws ServiceException;
	
	/**
	 * Retorna a quantidade dos Status dos Checklists de um Local.
	 * 
	 * @param idLocal
	 * @param dateFrom
	 * @param dateTo
	 * @param idUsuarioContexto
	 * 
	 * @return
	 */
	List<QuantidadeStatusChecklistPorLocalDTO>
			getQuantidadeStatusChecklistsPorLocal(Serializable idLocal,
					Date dateFrom, Date dateTo, Serializable idUsuarioContexto)
						throws ServiceException;
	
	HashMap<String, String> mapaTotalOcorrenciaPorLocal(Date dateFrom,
			Date dateTo, Serializable idUsuarioContexto)
			throws ServiceException;
	
	@Deprecated
	HashMap<String, String> mapaChecklistPorLocal(Serializable idLocal,
			Date dateFrom, Date dateTo, Serializable idUsuarioContexto)
			throws ServiceException;

	HashMap<String, String> mapaOcorrenciaPorLocal(Serializable idLocal,
			Date dateFrom, Date dateTo, Serializable idUsuarioContexto)
			throws ServiceException;
	
}
