package br.com.kolss.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.ChecklistPadrao;
import br.com.kolss.model.entities.Segmento;
import br.com.kolss.model.repository.SegmentoRepositoryImpl;


@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class SegmentoServiceImpl implements SegmentoService {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private SegmentoRepositoryImpl repository;

	@Override
	public List<Segmento> buscarTodos() throws ServiceException {
		logger.debug("BbSegmentoRepository.getSegmentos");
		return repository.obterTodos();
	}

	
	@Override
	public List<Segmento> getSegmentosAssociados(ChecklistPadrao checklistPadrao) throws ServiceException {
		
		logger.debug("SegmentoServiceImpl.getSegmentosAssociados");
		
		if (checklistPadrao == null || checklistPadrao.isNew()) {
			throw new ServiceException("Checklist Padrão inválido!");
		}
		
		return repository.getSegmentosAssociados(checklistPadrao);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void removerAssociacao(ChecklistPadrao checklistPadrao) throws ServiceException {
		
		logger.debug("SegmentoServiceImpl.removerAssociacao");
		
		if (checklistPadrao == null || checklistPadrao.isNew()) {
			throw new ServiceException("Checklist Padrão inválido!");
		}
		
		repository.removerAssociacao(checklistPadrao);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void associarSegmentos(ChecklistPadrao checklistPadrao,Collection<Serializable> idSegmentos) throws ServiceException {
		
		logger.debug("SegmentoServiceImpl.associarSegmentos");
		
		if (checklistPadrao == null || checklistPadrao.isNew()) {
			throw new ServiceException("Checklist Padrão inválido!");
		}
		
		if (idSegmentos != null && !idSegmentos.isEmpty()) {
			repository.associarSegmentos(checklistPadrao, idSegmentos);
		}
		
	}


	@Override
	public void salvar(Segmento segmento) {
		logger.debug("SegmentoServiceImpl.salvar");
		repository.salvar(segmento);
	}


	@Override
	public void atualizar(Segmento segmento) {
		logger.debug("SegmentoServiceImpl.atualizar");
		repository.atualizar(segmento);
	}


	@Override
	public void remover(Segmento segmento) {
		logger.debug("SegmentoServiceImpl.remover");
		repository.remover(segmento);
	}
}
