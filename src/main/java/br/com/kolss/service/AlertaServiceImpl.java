package br.com.kolss.service;

import java.io.Serializable;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.exception.DaoException;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.dao.ChecklistMensagemDao;
import br.com.kolss.model.dao.ChecklistMensagemDaoImpl;
import br.com.kolss.model.repository.OcorrenciaRepository;


@Service
public class AlertaServiceImpl implements AlertaService {
	
	private final Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	protected UsuarioService usuarioService;
	
	@Autowired
	protected OcorrenciaRepository ocorrenciaRepository;
	
	
	@Override
	public boolean existeAlertaAtivoPorLocal(Integer idLocal)
			throws ServiceException {
		logger.debug("AlertaServiceImpl.existeAlertaAtivoPorLocal");
		
		// FIXME: Trocar depois para o DAO correto.
		// Usar a injeção!
		ChecklistMensagemDao checklistMensagemDAO = new ChecklistMensagemDaoImpl();

		boolean exist = false;
		if (idLocal != null && idLocal.intValue() > 0) {
			try {
				exist = checklistMensagemDAO.existeAlertaPorLocal(idLocal, true);
			} catch (DaoException e) {
				logger.error(e.getMessage(), e);
				throw new ServiceException("Erro ao verificar alertas por Local");
			}
		}

		return exist;
	}

	@Override
	public boolean existeAlertaOcorrenciaAtivoPorLocalPorContexto(
			Serializable idLocal, Serializable idUsuario) throws ServiceException {
		logger.debug("AlertaServiceImpl.existeAlertaOcorrenciaAtivoPorLocalPorContexto");

		boolean exist = false;
		if (idLocal != null) {
			try {				
				exist = ocorrenciaRepository.existeOcorrenciaAtivaPorLocalPorContexto(
						idLocal,
						usuarioService.obter(idUsuario));
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
				throw new ServiceException("Erro ao verificar ocorrencias por Local");
			}
		}

		return exist;
	}

}
