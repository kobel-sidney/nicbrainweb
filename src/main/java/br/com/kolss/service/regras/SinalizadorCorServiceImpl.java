package br.com.kolss.service.regras;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.AtividadeMensagem;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.ChecklistMensagem;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Mensagem;
import br.com.kolss.service.AtividadeChecklistService;
import br.com.kolss.service.ChecklistService;
import br.com.kolss.util.SinalizadorCorEnum;


/**
 * Classe de negócio com as regras para determinar a cor de sinalização de
 * "Status X Alerta".
 */
@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class SinalizadorCorServiceImpl implements SinalizadorCorService {

	private static Integer ID_NAO_INICIADO = Integer.valueOf(12);
	private static Integer ID_INICIO_ATRASADO = Integer.valueOf(13);
	private static Integer ID_NAO_FINALIZADO = Integer.valueOf(15);
	private static Integer ID_FIM_ATRASADO = Integer.valueOf(17);
	
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	protected ChecklistService checklistService;
	
	@Autowired
	protected AtividadeChecklistService atividadeChecklistService;
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	
	@Override
	public SinalizadorCorEnum getSinalizadorCor(Atividade atividade) {
		logger.debug("SinalizadorCorServiceImpl.getSinalizadorCor(Atividade)");
		
		Atividade atv = atividadeChecklistService.obter(
				atividade.getId());
		
		// Formata os dados:
		List<Mensagem> mensagens = new ArrayList<Mensagem>();
		for (AtividadeMensagem atvMensagem : atv.getAtividadesMensagens()) {
			atvMensagem.getMensagem().toString();
			mensagens.add(atvMensagem.getMensagem());
		}

		return this.obterSinalizadorCor(atividade.getStatus().getId(),
				atividade.getQuantidadeMensagemAlerta(), mensagens);
	}
	
	@Override
	public SinalizadorCorEnum getSinalizadorCor(Checklist checklist) {
		logger.debug("SinalizadorCorServiceImpl.getSinalizadorCor(Checklist)");
		
		Checklist chk = checklistService.obter(checklist.getId());
		
		// Formata os dados:
		List<Mensagem> mensagens = new ArrayList<Mensagem>();
		for (ChecklistMensagem chkMensagem : chk.getChecklistsMensagens()) {
			chkMensagem.getMensagem().toString();
			mensagens.add(chkMensagem.getMensagem());
		}
		
		return this.obterSinalizadorCor(
				chk.getStatus().getId(),
				chk.getQuantidadeMensagemAlerta(),
				mensagens);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public SinalizadorCorEnum getSinalizadorCor(Local local) {
		logger.debug("SinalizadorCorServiceImpl.getSinalizadorCor(LocalId)");
		Session session = getCurrentSession();
		
		// TODO: a Consulta esta aqui para evitar problemas de loading do Hibernate:
		// Obtém a atividade:
		Criteria criteria = session.createCriteria(Checklist.class);
		criteria.add(Restrictions.eq("ativo", true));
//		criteria.add(Restrictions.eq("id.idLocal", idLocal.getIdLocal()));
//		criteria.add(Restrictions.eq("id.idCliente", idLocal.getIdCliente()));
//		criteria.add(Restrictions.eq("id.idContratante", idLocal.getIdContratante()));
//		
//		// Filtros por contexto:
//		Usuario user = BbUsuarioLogado.getUserSession();
//		criteria.add(Restrictions.in("id.idEvento",
//				user.getIdEventosPorContexto()));
		
		int prioridade = 0;
		List<Checklist> lst = criteria.list();
		for (Checklist chk : lst) {
			SinalizadorCorEnum currentSinalCor = getSinalizadorCor(chk);
			
			// Vermelho tem maior prioridade:
			if (SinalizadorCorEnum.VERMELHO.equals(currentSinalCor)) {
				prioridade = currentSinalCor.getPrioridade();
				break;
			}
			
			prioridade = Math.max(prioridade, currentSinalCor.getPrioridade());
		}
		
		return SinalizadorCorEnum.getSinalizadorCor(prioridade);
	}
	
	/**
	 * Verifica o Status e seleciona a cor pela existencia de alertas.
	 * 
	 * @param idStatus
	 * @param qtdAlerta
	 * @param mensagens
	 * 
	 * @return
	 */
	private SinalizadorCorEnum obterSinalizadorCor(Serializable idStatus,
			int qtdAlerta, List<Mensagem> mensagens) {
		logger.debug("SinalizadorCorServiceImpl.obterSinalizadorCor");
		
		SinalizadorCorEnum corEnum = SinalizadorCorEnum.SEM_COR;
		int id = Integer.valueOf(idStatus.toString());
		switch (id) {
		case 1: // Agendada
		case 3: // Em Aguardo
			corEnum = SinalizadorCorEnum.AZUL;
			for (Mensagem msg : mensagens) {
				if (ID_NAO_INICIADO.equals(msg.getId())
						|| ID_NAO_FINALIZADO.equals(msg.getId())) {
					corEnum = SinalizadorCorEnum.VERMELHO;
					break;
				}
			}

			break;

		case 2: // Em Andamento
			corEnum = SinalizadorCorEnum.VERDE;
			for (Mensagem msg : mensagens) {
				if (ID_INICIO_ATRASADO.equals(msg.getId())) {
					corEnum = SinalizadorCorEnum.AMARELO;
				}
				if (ID_NAO_FINALIZADO.equals(msg.getId())) {
					corEnum = SinalizadorCorEnum.VERMELHO;
					break;
				}
			}

			break;

		case 4: // Pausada
			break;

		case 5: // Cancelada
			corEnum = SinalizadorCorEnum.ROXO;
			break;

		case 6: // Finalizada
			corEnum = SinalizadorCorEnum.VERDE;
			for (Mensagem msg : mensagens) {
				if (ID_INICIO_ATRASADO.equals(msg.getId())
						|| ID_FIM_ATRASADO.equals(msg.getId())) {
					corEnum = SinalizadorCorEnum.AMARELO;
					break;
				}
			}

			break;
		}

		return corEnum;
	}
	
	
	public Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		logger.debug("SinalizadorCorServiceImpl.setSessionFactory");
		this.sessionFactory = sessionFactory;
	}
	
}
