package br.com.kolss.service;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.dto.QuantidadeChecklistsPorLocalDTO;
import br.com.kolss.dto.QuantidadeStatusChecklistPorLocalDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.repository.ChecklistRepository;
import br.com.kolss.model.repository.OcorrenciaRepository;


@Service(value="dashboardService")
public class DashboardServiceImpl implements DashboardService {
	
	private final Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	protected ChecklistRepository checklistRepository;
	
	@Autowired
	protected OcorrenciaRepository ocorrenciaRepository;
	
	
	@Override
	public List<QuantidadeChecklistsPorLocalDTO> getQuantidadeChecklistsPorLocais(
			Date dateFrom, Date dateTo, Serializable idUsuarioContexto)
					throws ServiceException {
		logger.debug("DashboardServiceImpl.getQuantidadeChecklistsPorLocais");
		
		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário Inválido");
		}
		
		return checklistRepository.obterQuantidadeChecklistsPorLocais(dateFrom,
				dateTo, idUsuarioContexto);
	}
	
	@Override
	public List<QuantidadeStatusChecklistPorLocalDTO>
			getQuantidadeStatusChecklistsPorLocal(
					Serializable idLocal, Date dateFrom, Date dateTo,
					Serializable idUsuarioContexto) throws ServiceException {
		logger.debug("DashboardServiceImpl.getQuantidadeStatusChecklistsPorLocal");
		
		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário Inválido");
		}
		
		return checklistRepository.getQuantidadeStatusChecklistsPorLocal(
				idLocal, dateFrom, dateTo, idUsuarioContexto);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public HashMap<String, String> mapaChecklistPorLocal(Serializable idLocal,
			Date dateFrom, Date dateTo, Serializable idUsuarioContexto)
			throws ServiceException {
		logger.debug("DashboardServiceImpl.mapaTotalChecklistPorLocal");

		List obj = checklistRepository.getQuantidadeStatusChecklistsPorLocal(
				idLocal, dateFrom, dateTo, idUsuarioContexto);
		HashMap<String, String> mapaChecklist = new HashMap<String, String>();
		List<Object> lst = obj;
		
		for (Object objeto : lst) {
			Object[] array = (Object[]) objeto;
			Number numero = (Number) array[0];
			Checklist chk = (Checklist) array[1];
			mapaChecklist.put(chk.getStatus().getNome(),
					String.valueOf(numero));
		}
		
		return mapaChecklist;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public HashMap<String, String> mapaTotalOcorrenciaPorLocal(Date dateFrom,
			Date dateTo, Serializable idUsuarioContexto)
					throws ServiceException {
		logger.debug("DashboardServiceImpl.mapaTotalOcorrenciaPorLocal");

		List obj = ocorrenciaRepository.listarTotalOcorrenciaPorLocal(dateFrom,
				dateTo, idUsuarioContexto);
		HashMap<String, String> mapaOcorrencia = new HashMap<String, String>();
		List<Object> lst = obj;
		for (Object objeto : lst) {
			Object[] array = (Object[]) objeto;
			Number numero = (Number) array[0];
			String nomeLocal = (String) array[1];
			mapaOcorrencia.put(nomeLocal, String.valueOf(numero));
		}
		
		return mapaOcorrencia;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public HashMap<String, String> mapaOcorrenciaPorLocal(Serializable idLocal,
			Date dateFrom, Date dateTo, Serializable idUsuarioContexto)
					throws ServiceException {
		logger.debug("DashboardServiceImpl.mapaOcorrenciaPorLocal");
		
		List obj = ocorrenciaRepository.listarOcorrenciaPorLocal(idLocal,
				dateFrom, dateTo, idUsuarioContexto);
		HashMap<String, String> mapaOcorrencia = new HashMap<String, String>();
		List<Object> lst = obj;

		for (Object objeto : lst) {
			Object[] array = (Object[]) objeto;
			Number numero = (Number) array[0];
			String classificacao = (String) array[1];
			mapaOcorrencia.put(classificacao, String.valueOf(numero));
		}
		
		return mapaOcorrencia;
	}
	
}
