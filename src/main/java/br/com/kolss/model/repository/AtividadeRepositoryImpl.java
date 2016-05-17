package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.AtividadeComentario;
import br.com.kolss.model.entities.AtividadeMensagem;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.RespostaQuestao;
import br.com.kolss.model.entities.StatusEnum;


@Repository
@Transactional(readOnly=false)
public class AtividadeRepositoryImpl extends AbstractRepository implements AtividadeRepository{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	/**
	 * Retorna a Atividade pelo seu ID, contendo todos os seus atributos 
	 * populados.
	 * 
	 * @param idAtividade
	 * 
	 * @return
	 */
	@Override
	public Atividade obter(Serializable idAtividade) {
		logger.debug("AtividadeRepository.find");
		
		Session currentSession = this.sessionFactory.getCurrentSession();
		Atividade atv = (Atividade) currentSession.load(Atividade.class,idAtividade);
		
		if (atv != null) {
			atv.toString();
		}
		
		return atv;
	}
	
	/**
	 * Lista todas as Atividades.
	 * 
	 * @param idChecklist
	 * @param filtroIdUsuarioResponsavel
	 * @param filtroIdStatus
	 * @param filtroIdFormulario
	 * @param filtroDataHoraInicio
	 * @param idUsuarioContexto
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Atividade> getAtividades(Serializable idChecklist,
			Serializable filtroIdUsuarioResponsavel,
			Serializable filtroIdStatus, Serializable filtroIdFormulario,
			Date filtroDataHoraInicio, Serializable idUsuarioContexto) {
		logger.debug("AtividadeRepository.getAtividades");
		
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Atividade.class);
		
		criteria.addOrder(Order.asc("status.id"));   //traz organizado por status e dentro de status por numero de item;
		criteria.addOrder(Order.asc("numeroItem"));
		criteria.add(Restrictions.eq("ativo", true));
		
		// Filtra por Contexto:
		DetachedCriteria dCriteria = DetachedCriteria.forClass(Evento.class);
		dCriteria.createAlias("usuariosNoEvento", "usuarioContexto");
		dCriteria.add(Restrictions.eq("usuarioContexto.id", idUsuarioContexto));
		dCriteria.createAlias("checklists", "chk");
		dCriteria.setProjection(Projections.property("chk.id"));
		criteria.add(Property.forName("checklist.id").in(dCriteria));
		
		// Filtros
		if (isValidId(idChecklist)) {
			criteria.add(Restrictions.eq("checklist.id", idChecklist));
		}
		if (isValidId(filtroIdUsuarioResponsavel)) {
			criteria.add(Restrictions.eq("usuarioResponsavel.id",
					filtroIdUsuarioResponsavel));
		}
		if (isValidId(filtroIdStatus)) {
			criteria.add(Restrictions.eq("status.id", filtroIdStatus));
		}
		if (filtroDataHoraInicio != null) {
			criteria.add(Restrictions.or(
					Restrictions.ge("dataInicioPrevisto", filtroDataHoraInicio),
					Restrictions.ge("dataInicioRealizado",filtroDataHoraInicio)));
		}
		if (isValidId(filtroIdFormulario)) {
			criteria.add(Restrictions.eq("formulario.id", filtroIdFormulario));
		}
		
		return criteria.list();
	}
	
	/**
	 * Retorna todas as Atividades em aberto.
	 * 
	 * @param idChecklist
	 * @param filtroIdUsuarioResponsavel
	 * @param filtroIdStatus
	 * @param filtroIdFormulario
	 * @param filtroDataHoraInicio
	 * @param idUsuarioContexto
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Atividade> getAtividadesEmAberto(Serializable idChecklist,
			Serializable filtroIdUsuarioResponsavel,
			Serializable filtroIdStatus, Serializable filtroIdFormulario,
			Date filtroDataHoraInicio, Serializable idUsuarioContexto) {
		logger.debug("AtividadeRepository.getAtividadesEmAberto");
		
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Atividade.class);
		
		criteria.addOrder(Order.asc("numeroItem"));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.ne("status.id", StatusEnum.FINALIZADA.getId()));
		criteria.add(Restrictions.ne("status.id", StatusEnum.CANCELADA.getId()));
		criteria.createAlias("checklist", "_chk");
		
		// Filtra por Contexto:
		DetachedCriteria dCriteria = DetachedCriteria.forClass(Evento.class);
		dCriteria.createAlias("usuariosNoEvento", "usuarioContexto");
		dCriteria.add(Restrictions.eq("usuarioContexto.id", idUsuarioContexto));
		dCriteria.createAlias("checklists", "chk");
		dCriteria.setProjection(Projections.property("chk.id"));
		criteria.add(Property.forName("_chk.id").in(dCriteria));
		
		// Filtros
		if (isValidId(idChecklist)) {
			criteria.add(Restrictions.eq("_chk.id", idChecklist));
		}
		
		if (isValidId(filtroIdUsuarioResponsavel)) {
			criteria.add(Restrictions.eq("usuarioResponsavel.id",
					filtroIdUsuarioResponsavel));
		}
		if (isValidId(filtroIdStatus)) {
			criteria.add(Restrictions.eq("status.id", filtroIdStatus));
		}
		if (filtroDataHoraInicio != null) {
			criteria.add(Restrictions.or(
					Restrictions.ge("dataInicioPrevisto", filtroDataHoraInicio),
					Restrictions.ge("dataInicioRealizado",filtroDataHoraInicio)));
		}
		if (isValidId(filtroIdFormulario)) {
			criteria.add(Restrictions.eq("formulario.id", filtroIdFormulario));
		}
		
		return criteria.list();
	}
	
	/**
	 * Retorna todas as Atividades Comentários de uma Atividade, ordenados pela
	 * data do Comentário de forma decrescente.
	 * 
	 * @param idAtividade
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<AtividadeComentario> getAtividadesComentarios(
			Serializable idAtividade) {
		logger.debug("AtividadeRepository.getAtividadesComentarios");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(AtividadeComentario.class);
		criteria.addOrder(Order.desc("dataComentario"));
		
		criteria.add(Restrictions.isNotNull("dataComentario"));
		criteria.add(Restrictions.eq("atividade.id", idAtividade));
		return criteria.list();
	}

	/**
	 * Retorna todas as Atividades Mensagens de uma Atividade, ordenados pela
	 * data de Envio de forma decrescente.
	 * 
	 * @param idAtividade
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<AtividadeMensagem> getAtividadesMensagens(
			Serializable idAtividade) {
		logger.debug("AtividadeRepository.getAtividadesMensagens");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(AtividadeMensagem.class);
		criteria.addOrder(Order.desc("dataEnvio"));
		
		criteria.add(Restrictions.isNotNull("dataEnvio"));
		criteria.add(Restrictions.eq("atividade.id", idAtividade));
		return criteria.list();
	}
	/**
	 * Grava novo comentário da Atividade.
	 * 
	 * @param idAtividade
	 * @param comentario
	 * @param pessoa
	 * 
	 * @return
	 */
	@Override
	public void salvar(AtividadeComentario atividadeComentario) {
		logger.debug("AtividadeRepository.salvar");
		
		Session session = sessionFactory.getCurrentSession();
		session.save(atividadeComentario);
		
		//TODO: Verificar 'no mobile, precisa dar flush na mão' (transaction?!)
//		session.flush();
	}
	
	/**
	 * Atualiza os dados da Atividade.
	 * 
	 * @param atividade
	 */
	@Override
	public void atualizar(Atividade atividade) {
		logger.debug("AtividadeRepository.atualizar");
		
		Session session = sessionFactory.getCurrentSession();
		session.update(atividade);
                session.flush();
	}
	
	/**
	 * Retorna a quantidade de atividades em andamento de um Checklist, a partir
	 * de uma Atividade deste Checklist.
	 * 
	 * @param idChecklist
	 * @param inicioChecklist
	 * 
	 * @return
	 */
	@Override
	public Integer getQuantidadeAtividadesEmAndamento(Serializable idChecklist,	boolean inicioChecklist) {
		logger.debug("AtividadeRepository.getQuantidadeAtividadesEmAndamento");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Atividade.class);
		
		criteria.add(Restrictions.eq("checklist.id", idChecklist));
		criteria.add(Restrictions.eq("ativo", true));
		
		if (inicioChecklist) {
			criteria.add(Restrictions.ne("status.id", StatusEnum.AGENDADO.getId()));
			criteria.add(Restrictions.ne("status.id", StatusEnum.AGUARDANDO.getId()));
		} else {
			criteria.add(Restrictions.ne("status.id", StatusEnum.FINALIZADA.getId()));
			criteria.add(Restrictions.ne("status.id", StatusEnum.CANCELADA.getId()));
		}
		
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		criteria.setProjection(Projections.rowCount());
		
		Number qtdAtvs = (Number) criteria.uniqueResult();
		return Integer.valueOf(qtdAtvs.intValue());
	}
	
	/**
	 * Lista todas as Atividades Previstas Relacionadas a um CheckList.
	 * 
	 * @param checklist
	 * 
	 * @return Lista de Atividades
	 * 
	 * @throws ServiceException
	 */	
	@Override
	public List<Atividade> getAtividadesPrevistasPorCheckList(
			Checklist checklist) {
		logger.debug("AtividadeRepository.getAtividadesPrevistasPorCheckList");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Atividade.class);
		
		criteria.add(Restrictions.eq("checklist.id", checklist.getId()));
		
		@SuppressWarnings("unchecked")
		List<Atividade> lst = criteria.list();
		for (Atividade entity : lst) {
			entity.toString();
		}
		
		return lst;
	}

	@Override
	public List<Atividade> obterAtividadeComFormulario(Long idAtividade) {
		
		logger.debug("AtividadeRepositoryImpl.obterAtividadeComFormulario()");
		 Session session = sessionFactory.getCurrentSession();
		 Criteria criteria = session.createCriteria(Atividade.class);
		 criteria.add(Restrictions.eq("id", idAtividade));
		 criteria.add(Restrictions.isNotNull("formulario"));
		 @SuppressWarnings("unchecked")
		List<Atividade> atividades = (List<Atividade>)criteria.list();
		 
		 
		return atividades;
	}

	@Override
	public boolean hasAtividadeFormularioComQuestao(Long idAtividade) {
		logger.debug("AtividadeRepositoryImpl.hasAtividadeFormularioComQuestao()");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria =  session.createCriteria(RespostaQuestao.class);
		criteria.add(Restrictions.eq("idAtividade",idAtividade));
		return criteria.list()!=null&&criteria.list().size()!=0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Atividade> buscarPorCheckListEmAberto(Long idCheckList,	Long idUser) {
		
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Atividade.class);
		
		criteria.addOrder(Order.asc("numeroItem"));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.ne("status.id", StatusEnum.FINALIZADA.getId()));
		criteria.add(Restrictions.ne("status.id", StatusEnum.CANCELADA.getId()));
		criteria.createAlias("checklist", "_chk");
		
		// Filtra por Contexto:
		DetachedCriteria dCriteria = DetachedCriteria.forClass(Evento.class);
		dCriteria.createAlias("usuariosNoEvento", "usuarioContexto");
		dCriteria.add(Restrictions.eq("usuarioContexto.id", idUser));
		dCriteria.createAlias("checklists", "chk");
		dCriteria.setProjection(Projections.property("chk.id"));
		criteria.add(Property.forName("_chk.id").in(dCriteria));
		
		// Filtros
		if (isValidId(idCheckList)) {
			criteria.add(Restrictions.eq("_chk.id", idCheckList));
		}
		
		
		return criteria.list();
	}
	
}
