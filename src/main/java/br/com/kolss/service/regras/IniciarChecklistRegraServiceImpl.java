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
public class IniciarChecklistRegraServiceImpl implements IniciarChecklistRegraService {
	
	protected static Logger LOG = Logger.getLogger(IniciarChecklistRegraServiceImpl.class);
	
	@Autowired
	protected ChecklistService checklistService;
	
	@Autowired
	protected AtividadeRepository atividadeRepository;
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void statusAtividadeAlterado(Serializable idAtividade,Serializable idUsuario) throws ServiceException {
		LOG.debug("IniciarChecklistRegra.statusAtividadeAlterado");
		
		Atividade atividade = atividadeRepository.obter(idAtividade);
		Checklist checklist = atividade.getChecklist();
		
		Integer qtdAtvs =
				atividadeRepository.getQuantidadeAtividadesEmAndamento(
						checklist.getId(), true);
		if (qtdAtvs.intValue() == 1 && checklist.isAtivo()
				&& StatusEnum.AGENDADO.getId().equals(checklist.getStatus().getId())) {
			
			checklistService.iniciarChecklist(checklist, idUsuario);
		}

	}

	@Deprecated
	@Override
	public void statusAtividadeAlteradoMobile(Integer idAtividade, Integer idUsuario)
			throws ServiceException {
		LOG.debug("IniciarChecklistRegra.statusAtividadeAlteradoMobile");
		
		throw new ServiceException("usar método statusAtividadeAlterado(Serializable, Serializable)");
	}
	
}
