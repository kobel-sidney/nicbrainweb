package br.com.kolss.service.regras;

import java.io.Serializable;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.StatusEnum;
import br.com.kolss.model.repository.AtividadeRepository;
import br.com.kolss.service.ChecklistService;


@Service
@Transactional(readOnly = true)
public class ConcluirChecklistRegra {
	
	protected static Logger LOG = Logger.getLogger(ConcluirChecklistRegra.class);
	
	@Autowired
	protected ChecklistService checklistService;
	
	@Autowired
	protected AtividadeRepository atividadeRepository;
	
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void statusAtividadeAlterado(Serializable idAtividade,
			Serializable idUsuario) throws ServiceException{
		LOG.debug("ConcluirChecklistRegra.statusAtividadeAlterado");
		
		Atividade atividade = atividadeRepository.obter(idAtividade);
		Checklist checklist = atividade.getChecklist();
		
		Integer qtdAtvs =
				atividadeRepository.getQuantidadeAtividadesEmAndamento(
						checklist.getId(), false);
		if (qtdAtvs.intValue() == 0 && checklist.isAtivo()
				&& StatusEnum.EM_ANDAMENTO.getId().equals(checklist.getStatus().getId())) {
			
			checklistService.concluirChecklist(checklist.getId(), idUsuario);
		}

	}

	@Deprecated
	public static void statusAtividadeAlteradoMobile(Integer idAtividade) {
		
		LOG.debug("ConcluirChecklistRegra.statusAtividadeAlterado");

		throw new ServiceException("usar método statusAtividadeAlterado(Serializable, Serializable)");
	}
	
}
