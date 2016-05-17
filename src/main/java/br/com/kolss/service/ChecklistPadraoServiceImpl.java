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
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.repository.ChecklistPadraoRepository;


@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class ChecklistPadraoServiceImpl implements ChecklistPadraoService {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private ChecklistPadraoRepository repository;
	
	@Override
	public ChecklistPadrao obter(Serializable idChecklistPadrao,Contratante contratante) throws ServiceException {
		logger.debug("ChecklistPadraoServiceImpl.obter");
		
		if (idChecklistPadrao == null || contratante == null) {
			throw new ServiceException("Checklist inválido!");
		}
		return repository.obter(idChecklistPadrao,contratante);
	}

	@Override
	public List<ChecklistPadrao> obterTodos(Contratante contratante) throws ServiceException {
		logger.debug("ChecklistPadraoServiceImpl.obterTodos");
		return repository.obterTodos(contratante);
	}

	@Override
	public List<ChecklistPadrao> obterPorUsuario(Serializable idUsuario) throws ServiceException {
		logger.debug("ChecklistPadraoServiceImpl.obterPorUsuario(idUsuario)");
		
		if (idUsuario == null) {
			throw new ServiceException("Usuário inválido!");
		}
		return repository.obterPorUsuario(idUsuario);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvar(ChecklistPadrao checklistPadrao) throws ServiceException {
		logger.debug("ChecklistPadraoServiceImpl.salvar");
		
		repository.salvar(checklistPadrao);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void atualizar(ChecklistPadrao checklistPadrao) throws ServiceException {
		
		logger.debug("ChecklistPadraoServiceImpl.atualizar");
		
		if (checklistPadrao == null || checklistPadrao.getId() == null
									|| checklistPadrao.getId().intValue() <= 0) {
			throw new ServiceException("Checklist Padrão inválido!");
		}
		
		repository.atualizar(checklistPadrao);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void remover(ChecklistPadrao checklistPadrao) throws ServiceException {
		
		logger.debug("ChecklistPadraoServiceImpl.remover");
		repository.remover(checklistPadrao);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void remover(Collection<ChecklistPadrao> checklistsPadrao) throws ServiceException {
		logger.debug("ChecklistPadraoServiceImpl.remover(Collection<ChecklistPadrao>)");
		repository.remover(checklistsPadrao);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void removerAssociacao(ChecklistPadrao checklistPadrao) throws ServiceException {
		logger.debug("ChecklistPadraoServiceImpl.removerAssociacao");
		
		if (checklistPadrao == null || checklistPadrao.getId() == null 
									|| checklistPadrao.getId().intValue() <= 0) {
			throw new ServiceException("Checklist Padrão inválido!");
		}
		
		repository.removerAssociacao(checklistPadrao);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void associarProcedimentos(ChecklistPadrao checklistPadrao, List<Serializable> idProcedimentos) throws ServiceException {
		logger.debug("ChecklistPadraoServiceImpl.associarProcedimentos");
		
		if (checklistPadrao == null || checklistPadrao.getId() == null
									|| checklistPadrao.getId().intValue() <= 0) {
			throw new ServiceException("Checklist Padrão inválido!");
		}
		
		if (idProcedimentos != null && !idProcedimentos.isEmpty()) {
			repository.associarProcedimentos(checklistPadrao, idProcedimentos);
		}
	}
	
}
