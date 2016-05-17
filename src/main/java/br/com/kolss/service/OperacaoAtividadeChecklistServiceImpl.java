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
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.OperacaoAtividade;
import br.com.kolss.model.entities.Status;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.repository.AtividadeRepository;
import br.com.kolss.model.repository.OperacaoAtividadeChecklistRepository;


@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class OperacaoAtividadeChecklistServiceImpl
		implements OperacaoAtividadeChecklistService{

	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	OperacaoAtividadeChecklistRepository operacaoAtividadeChecklistRepository;
	
	@Autowired
	protected AtividadeRepository atividadeRepository;
	
	
	public OperacaoAtividadeChecklistServiceImpl() {
	}
	
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void executarOperacao(Serializable idAtividade, Usuario usuario,
			Status status, String latitude, String longitude, Date dtHrStatus)
					throws ServiceException {
		logger.debug("OperacaoAtividadeChecklistServiceImpl.executarOperacao");
		
		Atividade atividade = atividadeRepository.obter(idAtividade);
		OperacaoAtividade operacaoAtividade = new OperacaoAtividade(null,
				dtHrStatus,
				atividade.getObservacao(),
				latitude,
				longitude,
				status,
				usuario,
				atividade);
		atividade.getOperacoesAtividaes().add(operacaoAtividade);
		
		operacaoAtividadeChecklistRepository.salvar(operacaoAtividade); 
		atividadeRepository.atualizar(atividade);
	}

	@Override
	public List<OperacaoAtividade> getOperacoesDaAtividadeDoChecklist(Checklist checklist) {
		logger.info("OperacaoAtividadeChecklistServiceImpl.getAtividadesDoChecklist");
		return operacaoAtividadeChecklistRepository.getOperacoesDaAtividadePorChecklist(checklist);
	}
	
}
