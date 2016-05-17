package br.com.kolss.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.OperacaoChecklist;
import br.com.kolss.model.entities.Status;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.repository.ChecklistRepository;


@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class OperacaoChecklistServiceImpl implements OperacaoChecklistService {

	private Logger logger = Logger.getLogger(this.getClass());
		
	@Autowired
	protected OperacaoChecklistRepository repositorioDeOperacoesDoChecklist;
	
	@Autowired
	protected ChecklistRepository checklistRepository;
	
	
	public OperacaoChecklistServiceImpl() {
	}
	
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void executarOperacao(Serializable idChecklist, Usuario usuario,
			Status status, String latitude, String longitude, Date dtHrStatus)
					throws ServiceException {
		logger.debug("OperacaoChecklistServiceImpl.executarOperacao");
		
		Checklist checklist = checklistRepository.obter(idChecklist);
		OperacaoChecklist operacaoChecklist = new OperacaoChecklist(null,
				dtHrStatus,
				checklist.getObservacao(),
				latitude,
				longitude,
				status,
				usuario,
				checklist);
		checklist.getOperacoesChecklists().add(operacaoChecklist);
		
		repositorioDeOperacoesDoChecklist.salvarOperacao(operacaoChecklist);
		checklistRepository.atualizar(checklist);
	}

	@Override
	public List<OperacaoChecklist> getOperacoesDoChecklist(Checklist checklist) {
		logger.info("OperacaoChecklistServiceImpl.getOperacoesDoChecklist");
		return repositorioDeOperacoesDoChecklist.getOperacoesPorChecklist(checklist);
	}


	public void setRepositorioDeOperacoesDoChecklist(
			OperacaoChecklistRepository repositorioDeOperacoesDoChecklist) {
		this.repositorioDeOperacoesDoChecklist = repositorioDeOperacoesDoChecklist;
	}

}
