package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.dto.QuantidadeChecklistsPorLocalDTO;
import br.com.kolss.dto.QuantidadeStatusChecklistPorLocalDTO;
import br.com.kolss.exception.DaoException;
import br.com.kolss.filtro.ChecklistFiltro;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.ChecklistComentario;
import br.com.kolss.model.entities.ChecklistMensagem;
import br.com.kolss.model.entities.StatusEnum;


@Repository
@Transactional(readOnly=false)
public class ChecklistRepositoryImpl extends AbstractRepository  implements ChecklistRepository {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	/**
	 * Retorna o Checklist pelo seu ID, contendo todos os seus atributos 
	 * populados.
	 * 
	 * @param idChecklist
	 * 
	 * @return
	 */
	@Override
	public Checklist obter(Serializable idChecklist) {
		
		logger.debug("ChecklistRepository.buscar");
		
		Session session = this.sessionFactory.getCurrentSession();
		Checklist chk = (Checklist) session.get(Checklist.class, idChecklist);
		
		if (chk != null) {
			chk.toString();
		}
		
		return chk;
	}
	
	/**
	 * Retorna todos os Checklists Em Aberto que podem ser visualizados pelo
	 * Usuário Solicitante.<br>
	 * Pode ser filtrado por:
	 * <ul>
	 * <li>Evento</li>
	 * <li>Local</li>
	 * <li>Usuário Responsável</li>
	 * <li>Status</li>
	 * <li>Data de Início</li>
	 * </ul>
	 *  
	 * @param filtroIdEvento
	 * @param filtroIdLocal
	 * @param filtroIdUsuarioResponsavel
	 * @param filtroIdStatus
	 * @param filtroDataHoraInicio
	 * @param idUsuarioContexto
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Checklist> obterEmAbertoPorFiltro(ChecklistFiltro checklistFiltro) {
		
		logger.debug("ChecklistDaoImpl.obterEmAbertoPorFiltro");
		
		Criteria criteria = criarCriteriaFiltro(checklistFiltro);
		criteria.add(Restrictions.ne("status.id", StatusEnum.FINALIZADA.getId()));
		criteria.add(Restrictions.ne("status.id", StatusEnum.CANCELADA.getId()));
		criteria.addOrder(Order.asc("dataInicioPrevisto"));
		criteria.setResultTransformer(Criteria.ROOT_ENTITY);
		return criteria.list();
	}
	
	/**
	 * Retorna todos os Checklists Em Aberto que podem ser visualizados pelo
	 * Usuário Solicitante.<br>
	 * Pode ser filtrado por:
	 * <ul>
	 * <li>Evento</li>
	 * <li>Local</li>
	 * <li>Usuário Responsável</li>
	 * <li>Status</li>
	 * <li>Data de Início</li>
	 * </ul>
	 *  
	 * @param filtroIdEvento
	 * @param filtroIdLocal
	 * @param filtroIdUsuarioResponsavel
	 * @param filtroIdStatus
	 * @param filtroDataHoraInicio
	 * @param idUsuarioContexto
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Checklist> obterNaoCanceladoPorFiltro(ChecklistFiltro checklistFiltro) {
		
		logger.debug("ChecklistRepository.obterNaoCanceladoPorFiltro");
		
		Criteria criteria = criarCriteriaFiltro(checklistFiltro);
		criteria.add(Restrictions.ne("status.id", StatusEnum.CANCELADA.getId()));
		criteria.setResultTransformer(Criteria.ROOT_ENTITY);
		return criteria.list();
	}
	
	/**
 	 * Obtém todos os Checklist, independente do seu Status.<br>
 	 * 
	 * @param filtroIdEvento
	 * @param filtroIdLocal
	 * @param filtroIdUsuarioResponsavel
	 * @param filtroIdStatus
	 * @param filtroDataHoraInicio
	 * @param idUsuarioContexto
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Checklist> obterPorFiltro(ChecklistFiltro checklistFiltro) {
		
		logger.debug("ChecklistRepository.getAllChecklists");
		return this.criarCriteriaFiltro(checklistFiltro).list();
	}
	
	/**
	 * Retorna o Criteria comum para pesquisas de Checklist.
	 * 
	 * @param filtroIdEvento
	 * @param filtroIdLocal
	 * @param filtroIdUsuarioResponsavel
	 * @param filtroIdStatus
	 * @param filtroDataHoraInicio
	 * @param idUsuarioContexto
	 * 
	 * @return
	 */
	private Criteria criarCriteriaFiltro(ChecklistFiltro checklistFiltro) {
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Checklist.class);
		criteria.add(Restrictions.eq("ativo", true));
		
		// Filtra por Contexto:
		criteria.createAlias("evento", "evt");
		criteria.createAlias("evt.usuariosNoEvento", "usuarioContexto");
		criteria.add(Restrictions.eq("usuarioContexto.id", checklistFiltro.getIdUsuarioContexto()));

		// Filtros da tela:
		if (isValidId(checklistFiltro.getIdEvento())) {
			criteria.add(Restrictions.eq("evento.id", checklistFiltro.getIdEvento()));
		}
		if (isValidId(checklistFiltro.getIdLocal())) {
			criteria.createAlias("evt.local", "loc");
			criteria.add(Restrictions.eq("loc.id", checklistFiltro.getIdLocal()));
		}
		if (isValidId(checklistFiltro.getIdUsuarioResponsavel())) {
			criteria.add(Restrictions.eq("usuarioResponsavel.id",checklistFiltro.getIdUsuarioResponsavel()));
		}
		if (isValidId(checklistFiltro.getIdStatus())) {
			criteria.add(Restrictions.eq("status.id", checklistFiltro.getIdStatus()));
		}
		if (checklistFiltro.getDataHoraInicio() != null) {
			criteria.add(Restrictions.or(
					Restrictions.ge("dataInicioPrevisto", checklistFiltro.getDataHoraInicio()),
					Restrictions.ge("dataInicioRealizado",checklistFiltro.getDataHoraInicio())));
		}
		
		if (checklistFiltro.getDataPrevistaInicio() != null && checklistFiltro.getDataPrevistaFim() != null) {
			criteria.add(Restrictions.or(Restrictions.ge("dataInicioPrevisto", checklistFiltro.getDataPrevistaInicio())));
			criteria.add(Restrictions.or(Restrictions.le("dataInicioPrevisto", checklistFiltro.getDataPrevistaFim())));
		}
		return criteria;
	}
	
	/**
	 * Retorna todos os Checklists Mensagens de um Checklist, ordenados pela
	 * data de Envio de forma decrescente.
	 * 
	 * @param idChecklist
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<ChecklistMensagem> getChecklistsMensagens(Serializable idChecklist) {
		logger.debug("ChecklistRepository.getChecklistsMensagens");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ChecklistMensagem.class);
		
		criteria.add(Restrictions.isNotNull("dataEnvio"));
		criteria.add(Restrictions.eq("checklist.id", idChecklist));
		
		criteria.addOrder(Order.desc("dataEnvio"));
		return criteria.list();
	}
	
	

	
	
	/**
	 * Retorna o(s) Checklist(s) com término não realizado.
	 * 
	 * @param dtAtual
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Checklist> obterComTerminoNaoRealizadoSemAlerta(Date dtAtual) {
		
		logger.debug("ChecklistRepository.getChecklistComTerminoNaoRealizadoSemAlerta");
		
//		StringBuilder hql = new StringBuilder();
//		hql.append("SELECT chk FROM Checklist chk");
//		
//		/* Regra 'D' -  Elimina todos os checklist com mensagem já salvas */
//		hql.append(" WHERE NOT EXISTS");
//		hql.append(" (SELECT msg.checklist FROM ChecklistMensagem msg");
//		hql.append(" WHERE msg.ativo = :ativo");
//		hql.append(" AND msg.mensagem.idMensagem = :idMensagem");
//		hql.append(" AND msg.checklist = chk)");
//		
//		hql.append(" AND chk.dtHrFimPrevisto < :dtAtual");	/* pre-filtro para as regras 'E' e 'F'*/
//		hql.append(" AND chk.dtHrFimRealizado is null");	/* Regra 'C'*/
//		hql.append(" AND chk.status.idStatus <> :idStatusFinalizada");	/* Regra 'B'*/
//		hql.append(" AND chk.status.idStatus <> :idStatusCancelada");	/* Regra 'B'*/
//		hql.append(" AND chk.ativo = :ativo");	/* Regra 'A'*/
//		
//		Session currentSession = this.sessionFactory.getCurrentSession();
//		Query query = currentSession.createQuery(hql.toString());
//		query.setBoolean("ativo", true);
//		query.setInteger("idMensagem", Integer.valueOf(15));
//		query.setInteger("idStatusFinalizada", Status.ID_STATUS_FINALIZADA);
//		query.setInteger("idStatusCancelada", Status.ID_STATUS_CANCELADA);
//		query.setTimestamp("dtAtual", dtAtual);
//		
//		List<Checklist> checklists = query.list();
//		for (Checklist chk : checklists) {
//			chk.toString();
//		}
//		
//		return checklists;
		
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ChecklistMensagem.class);
		
		/* Regra 'D' -  Seleciona todos os checklist que não enviarem mensagem (dataEnvio == null) */
		criteria.add(Restrictions.isNull("dataEnvio"));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.eq("mensagem.id", Long.valueOf(15)));
		
		criteria.createAlias("checklist", "chk");
		criteria.add(Restrictions.eq("chk.ativo", true));	/* Regra 'A'*/
		criteria.add(Restrictions.ne("chk.status.id", StatusEnum.FINALIZADA.getId()));	/* Regra 'B'*/
		criteria.add(Restrictions.ne("chk.status.id", StatusEnum.CANCELADA.getId()));	/* Regra 'B'*/
		criteria.add(Restrictions.isNull("chk.dataFimRealizado"));	/* Regra 'C'*/
		criteria.add(Restrictions.lt("dataFimPrevisto", dtAtual));	/* pre-filtro para as regras 'E' e 'F'*/
		
		// Retorna somente os Checklist:
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("checklist"));
		criteria.setProjection(Projections.distinct(projection));

		return criteria.list();
	}
	
	
//	/**
//	 * Agrupa a quantidade de checklist por Status de um determinado local.
//	 * 
//	 * @param idLocal
//	 * 
//	 * @return
//	 */
//	public StatusPorLocalDTO getQuantidadeDeChecklistPorStatus(Integer idLocal) {
//		logger.debug("ChecklistRepository.getQuantidadeDeChecklistPorStatus");
//		
//		StringBuilder hql = new StringBuilder();
//		hql.append("SELECT count(*), chk.status.idStatus FROM Checklist chk");
//		hql.append(" WHERE chk.id.idLocal = :idLocal");
//		hql.append(" GROUP BY chk.status.idStatus");
//		
//		Session currentSession = this.sessionFactory.getCurrentSession();
//		Query query = currentSession.createQuery(hql.toString());
//		query.setInteger("idLocal", idLocal);
//		
//		StatusPorLocalDTO dto = new StatusPorLocalDTO();
//		
//		@SuppressWarnings("unchecked")
//		List<Object> lst = query.list();
//		for (Object objeto : lst) {
//			Object[] array = (Object[]) objeto;
//			Number qtd = (Number) array[0];
//			Number idStatus = (Number) array[1];
//			dto.setQuantidadePorStatus(
//					Integer.valueOf(idStatus.intValue()),
//					Integer.valueOf(qtd.intValue()));
//		}
//		
//		return dto;
//	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ChecklistComentario> obterComentariosChecklists(Serializable idChecklist) {
		
		logger.debug("ChecklistRepository.getComentariosChecklists");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ChecklistComentario.class);
		
		criteria.addOrder(Order.desc("dataComentario"));
		criteria.add(Restrictions.eq("checklist.id", idChecklist));
		
		// FIXME: Será que precisa filtrar por Mensagens enviadas???
//		criteria.add(Restrictions.isNotNull("dataComentario"));
		
		return criteria.list();
	}
	
	/**
	 * Salva um novo Checklist.
	 * 
	 * @param checklist
	 */
	@Override
	public void salvar(Checklist checklist) {
		
		logger.debug("ChecklistRepository.salvar(Checklist)");
		
		Session session = this.sessionFactory.getCurrentSession();
		session.save(checklist);
	}
	
	/**
	 * Salva um novo Checklist Comentário.
	 * 
	 * @param checklistComentario
	 */
	@Override
	public void salvar(ChecklistComentario checklistComentario) {
		logger.debug("ChecklistRepository.salvar(ChecklistComentario)");
		
		Session session = this.sessionFactory.getCurrentSession();
		session.save(checklistComentario);
	}
	
	/**
	 * Atualiza os dados do Checklist.
	 * 
	 * @param checklist
	 */
	@Override
	public void atualizar(Checklist checklist) {
		logger.debug("ChecklistRepository.atualizar");
		
		Session session = this.sessionFactory.getCurrentSession();
		session.update(checklist);
		session.flush();
	}
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	/**
	 * Lista a quantidade de Checklists por Locais.
	 * 
	 * @param dateFrom
	 * @param dateTo
	 * @param idUsuarioContexto
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Transactional(readOnly=true)
	@Override
	public List<QuantidadeChecklistsPorLocalDTO> obterQuantidadeChecklistsPorLocais(
			Date dateFrom, Date dateTo, Serializable idUsuarioContexto) {
		logger.debug("ChecklistRepository.obterQuantidadeChecklistsPorLocais");
		
		try {
			
			Session session = this.sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(Checklist.class, "chk");
			criteria.createAlias("chk.evento", "evt");
			criteria.createAlias("evt.usuariosNoEvento", "usr");
			
			ProjectionList pList = Projections.projectionList();
			pList.add(Projections.count("id"), "quantidade");
			pList.add(Projections.groupProperty("evt.local"), "local");
			criteria.setProjection(pList);
			
			criteria.add(Restrictions.eq("usr.id", idUsuarioContexto));
			if (dateFrom != null) {
				Calendar calInicio = Calendar.getInstance();
				calInicio.setTime(dateFrom);
				calInicio.set(Calendar.HOUR_OF_DAY, 00);
				calInicio.set(Calendar.MINUTE, 00);
				calInicio.set(Calendar.SECOND, 00);
				calInicio.set(Calendar.MILLISECOND, 000);
				
				criteria.add(Restrictions.ge("dataInicioPrevisto",
						calInicio.getTime()));
			}
			if (dateTo != null) {
				Calendar calFim = Calendar.getInstance();
				calFim.setTime(dateTo);
				calFim.set(Calendar.HOUR_OF_DAY, 23);
				calFim.set(Calendar.MINUTE, 59);
				calFim.set(Calendar.SECOND, 59);
				calFim.set(Calendar.MILLISECOND, 999);
				
				criteria.add(Restrictions.le("dataInicioPrevisto",
						calFim.getTime()));
			}
			
			criteria.setResultTransformer(Transformers.aliasToBean(
					QuantidadeChecklistsPorLocalDTO.class));
			return criteria.list();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new DaoException("Erro ao listar Checklist por local");
		}
	}
	
	/**
	 * Lista a quantidade de Status dos Checklists por Local.
	 * 
	 * @param idLocal
	 * @param dateFrom
	 * @param dateTo
	 * @param idUsuarioContexto
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Transactional(readOnly=true)
	@Override
	public List<QuantidadeStatusChecklistPorLocalDTO>
			getQuantidadeStatusChecklistsPorLocal(Serializable idLocal,
					Date dateFrom, Date dateTo, Serializable idUsuarioContexto) {
		logger.debug("ChecklistRepository.getQuantidadeStatusChecklistsPorLocal");

		try {
			
			Session session = this.sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(Checklist.class, "chk");
			criteria.createAlias("chk.evento", "evt");
			criteria.createAlias("evt.usuariosNoEvento", "usr");
			
			ProjectionList pList = Projections.projectionList();
			pList.add(Projections.count("chk.status.id"), "quantidade");
			pList.add(Projections.groupProperty("chk.status"), "status");
			pList.add(Projections.property("evt.local"), "local");
			criteria.setProjection(pList);
			
			criteria.add(Restrictions.eq("evt.local.id", idLocal));
			criteria.add(Restrictions.eq("usr.id", idUsuarioContexto));
			
			if (dateFrom != null) {
				Calendar calInicio = Calendar.getInstance();
				calInicio.setTime(dateFrom);
				calInicio.set(Calendar.HOUR_OF_DAY, 00);
				calInicio.set(Calendar.MINUTE, 00);
				calInicio.set(Calendar.SECOND, 00);
				calInicio.set(Calendar.MILLISECOND, 000);
				
				criteria.add(Restrictions.ge("dataInicioPrevisto",
						calInicio.getTime()));
			}
			if (dateTo != null) {
				Calendar calFim = Calendar.getInstance();
				calFim.setTime(dateTo);
				calFim.set(Calendar.HOUR_OF_DAY, 23);
				calFim.set(Calendar.MINUTE, 59);
				calFim.set(Calendar.SECOND, 59);
				calFim.set(Calendar.MILLISECOND, 999);
				
				criteria.add(Restrictions.le("dataInicioPrevisto",
						calFim.getTime()));
			}
						
			criteria.setResultTransformer(Transformers.aliasToBean(
					QuantidadeStatusChecklistPorLocalDTO.class));
			return criteria.list();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new DaoException("Erro ao listar Checklist por local");
		}
	}

	@Override
	public void remover(Checklist checklist) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(checklist);
	}
	
}
