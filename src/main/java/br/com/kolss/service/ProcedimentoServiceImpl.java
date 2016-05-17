package br.com.kolss.service;

import java.io.Serializable;
import java.util.ArrayList;
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
import br.com.kolss.model.entities.Procedimento;
import br.com.kolss.model.entities.ProcedimentoMensagem;
import br.com.kolss.model.repository.ProcedimentoRepository;


@Service
public class ProcedimentoServiceImpl implements ProcedimentoService {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	protected ProcedimentoRepository repository;
	
	@Autowired
	protected MensagemService mensagemService;
	
	
	@Override
	public Procedimento obter(Serializable idProcedimento) throws ServiceException {
		
		logger.debug("ProcedimentoServiceImpl.obter");
		
		if (idProcedimento == null) {
			throw new ServiceException("Procedimento inválido");
		}
		
		return repository.find(idProcedimento);
	}
	
	@Override
	public List<Procedimento> obterTodos(Contratante contratante) throws ServiceException {
		
		logger.debug("ProcedimentoServiceImpl.obterTodos");
		
		if (contratante == null|| contratante.getId()==null) {
			throw new ServiceException("Contratante inválido");
		}
		
		return repository.obterTodos(contratante);
	}
	
	@Override
	public List<Procedimento> obterPorUsuario(Serializable idUsuario)
			throws ServiceException {
		logger.debug("ProcedimentoServiceImpl.getProcedimentos(idUsuario)");
		
		if (idUsuario == null) {
			throw new ServiceException("Usuário inválido");
		}

		return repository.getProcedimentos(idUsuario);
	}
	
	public List<Procedimento> obterAssociadosChecklist(
			ChecklistPadrao checklistPadrao) throws ServiceException {
		logger.debug("ProcedimentoServiceImpl.getProcedimentosSelecionados");
		
		if (checklistPadrao == null || checklistPadrao.getId() == null) {
			throw new ServiceException("Checklist Padrão inválido");
		}
		
		return repository.getProcedimentosSelecionados(checklistPadrao);
	}
	
	public List<Procedimento> obterDisponiveisPorUsuario(
			ChecklistPadrao checklistPadrao, Serializable idUsuario)
					throws ServiceException {
		logger.debug("ProcedimentoServiceImpl.getProcedimentosNaoSelecionados");
		
		if (checklistPadrao == null || checklistPadrao.getId() == null) {
			throw new ServiceException("Checklist Padrão inválido");
		}
		if (idUsuario == null) {
			throw new ServiceException("Usuário inválido!");
		}
		
		return repository.getProcedimentosNaoSelecionados(checklistPadrao,
				idUsuario);
	}
	
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public Serializable salvar(Procedimento procedimento) throws ServiceException {
		logger.debug("ProcedimentoServiceImpl.salvar");
		
		return repository.salvar(procedimento);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void atualizar(Procedimento procedimento) throws ServiceException {
		logger.debug("ProcedimentoServiceImpl.atualizar");
		
		repository.atualizar(procedimento);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public Serializable salvar(Procedimento procedimento,
			Collection<ProcedimentoMensagem> procedimentosMensagens)
					throws ServiceException {
		logger.debug("ProcedimentoServiceImpl.salvar(Procedimento, Collection<ProcedimentoMensagem>)");
		
		repository.salvar(procedimento);
		for (ProcedimentoMensagem pMsg : procedimentosMensagens) {
			pMsg.setProcedimento(procedimento);
			mensagemService.salvar(pMsg);
		}
		
		procedimento.getProcedimentosMensagens().addAll(procedimentosMensagens);
		repository.atualizar(procedimento);
		
		return procedimento.getId();
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void atualizar(Procedimento procedimento,
			Collection<ProcedimentoMensagem> procedimentosMensagens)
					throws ServiceException {
		logger.debug("ProcedimentoServiceImpl.atualizar(Procedimento, Collection<ProcedimentoMensagem>)");
		
		repository.atualizar(procedimento);
		List<ProcedimentoMensagem> pMensagemExcluir =
				new ArrayList<ProcedimentoMensagem>(
						procedimento.getProcedimentosMensagens());
		
		for (ProcedimentoMensagem pMsgTela : procedimentosMensagens) {
			if (pMsgTela.isNew()) {
				mensagemService.salvar(pMsgTela);
			} else {
				mensagemService.atualizar(pMsgTela);
			}
			
			procedimento.getProcedimentosMensagens().add(pMsgTela);
			
			// Não sera excluido:
			pMensagemExcluir.remove(pMsgTela);
		}
		
		mensagemService.remover(pMensagemExcluir);
		procedimento.getProcedimentosMensagens().removeAll(pMensagemExcluir);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void remover(Procedimento procedimento) throws ServiceException {
		logger.debug("ProcedimentoServiceImpl.remover");
		
		repository.remover(procedimento);
	}
	
}
