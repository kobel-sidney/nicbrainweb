package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Status;
import br.com.kolss.model.entities.StatusEnum;

@Repository
public class EventoRepository extends AbstractRepository {

	@Autowired
	protected SessionFactory sessionFactory;

	/**
	 * Retorna o Evento com seus respectivos locais e usuários responsáveis.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Evento> listarEvento() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Evento.class, "evento");
		criteria.createAlias("evento.local", "local");
		criteria.createAlias("evento.usuarioResponsavel", "usuarioResponsavel");
		return criteria.list();
	}
	
	public List<Evento> getEventosPorCliente(Long idCliente) {

		Session session = sessionFactory.getCurrentSession();

		Criteria criteria = session.createCriteria(Evento.class, "evento");
		criteria.addOrder(Order.asc("evento.nome"));
		criteria.add(Restrictions.eq("evento.ativo", true));
		criteria.createAlias("evento.local", "local");
		criteria.createAlias("evento.usuarioResponsavel", "usuarioResponsavel");
		criteria.createAlias("local.cliente", "cliente");
		criteria.add(Restrictions.eq("cliente.id", idCliente));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

		return criteria.list();
	}
	
	public List<Evento> getEventosPorContratante(Contratante contratante) {

		Session session = sessionFactory.getCurrentSession();

		Criteria criteria = session.createCriteria(Evento.class);
		criteria.createAlias("local", "local");
		criteria.createAlias("usuarioResponsavel", "usuarioResponsavel");
		criteria.createAlias("local.cliente", "cliente");
		criteria.add(Restrictions.eq("cliente.contratante.id", contratante.getId()));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.addOrder(Order.asc("nome"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

		return criteria.list();
	}

	/**
	 * Salva um novo evento.
	 * 
	 * @param evento
	 */
	public void salvar(Evento evento) {
		Session session = sessionFactory.getCurrentSession();
		session.save(evento);
	}

	/**
	 * Atualiza um evento.
	 * 
	 * @param evento
	 */
	public void atualizar(Evento evento) {
		Session session = sessionFactory.getCurrentSession();
		session.merge(evento);
	}

	/**
	 * Remove um evento.
	 * 
	 * @param evento
	 */
	public void remover(Evento evento) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(evento);
	}

	/**
	 * Retorna o Evento pelo seu ID, contendo todos os seus atributos populados.
	 * 
	 * @param idEvento
	 * 
	 * @return
	 */
	public Evento find(Serializable idEvento) {
		logger.debug("EventoRepository.find");

		Session session = sessionFactory.getCurrentSession();
		return (Evento) session.load(Evento.class, idEvento);
	}

	/**
	 * Retorna os Eventos Ativos e visiveis ao Contexto do Usuário selecionado e
	 * com pelo menos um Checklist ativo e Não Finalizado.<br>
	 * Os Eventos são ordenados de forma decrescente pela sua Data de Início.<br>
	 * 
	 * @param idLocal
	 * @param idUsuarioResponsavel
	 * @param idUsuarioContexto
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Evento> getEventosComChecklistNaoEncerrados(
			Serializable idLocal, Serializable idUsuarioResponsavel,
			Serializable idUsuarioContexto) {
		logger.debug("EventoRepository.getEventosComChecklistNaoEncerrados");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Evento.class);
		criteria.addOrder(Order.desc("dataInicio"));
		criteria.add(Restrictions.eq("ativo", true));

		// Contém pelo menos um Checklist ativo e válido:
		criteria.createAlias("checklists", "chk", JoinType.LEFT_OUTER_JOIN);
		criteria.add(Restrictions.ne("chk.status.id",
				StatusEnum.CANCELADA.getId()));
		criteria.add(Restrictions.ne("chk.status.id",
				StatusEnum.FINALIZADA.getId()));

		criteria.add(Restrictions.eq("chk.ativo", true));

		// Filtra por Contexto:
		criteria.createAlias("usuariosNoEvento", "usuarioContexto");
		criteria.add(Restrictions.eq("usuarioContexto.id", idUsuarioContexto));

		// Filtros:
		if (isValidId(idLocal)) {
			criteria.add(Restrictions.eq("local.id", idLocal));
		}
		if (isValidId(idUsuarioResponsavel)) {
			criteria.add(Restrictions.eq("usuarioResponsavel.id",
					idUsuarioResponsavel));
		}

		return criteria.list();
	}

	/**
	 * Retorna todos os eventos que o usuário selecionado pode visualizar.
	 * 
	 * @param filtroIdLocal
	 * @param filtroIdResponsavel
	 * @param filtroIdCliente
	 * @param filtroDataInicio
	 * @param idUsuarioContexto
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Evento> getEventosPorChecklist(Serializable filtroIdLocal,
			Serializable filtroIdResponsavel, Serializable filtroIdCliente,
			Date filtroDataInicio, Serializable idUsuarioContexto) {
		logger.debug("EventoRepository.getEventosPorChecklist");

		Criteria criteria = getEventosPorChecklistCriteria(filtroIdLocal,
				filtroIdResponsavel, filtroIdCliente, filtroDataInicio,
				idUsuarioContexto);

		// Contém pelo menos um Checklist ativo e válido:
		criteria.add(Restrictions.ne("status.id", StatusEnum.CANCELADA.getId()));
		criteria.add(Restrictions.ne("status.id", StatusEnum.FINALIZADA.getId()));
		criteria.add(Restrictions.eq("ativo", true));

		return criteria.list();
	}

	/**
	 * Retorna todos os eventos que o usuário selecionado pode visualizar na
	 * lista de eventos para Rastreamentro.
	 * 
	 * @param filtroIdLocal
	 * @param filtroIdResponsavel
	 * @param filtroIdCliente
	 * @param filtroDataInicio
	 * @param idUsuarioContexto
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Evento> getEventosPorChecklistRastreamento(
			Serializable filtroIdLocal, Serializable filtroIdResponsavel,
			Serializable filtroIdCliente, Date filtroDataInicio,
			Serializable idUsuarioContexto) {
		logger.debug("EventoRepository.getEventosPorChecklist");

		Criteria criteria = getEventosPorChecklistCriteria(filtroIdLocal,
				filtroIdResponsavel, filtroIdCliente, filtroDataInicio,
				idUsuarioContexto);

		return criteria.list();
	}

	/**
	 * Retorna todos os eventos que o usuário selecionado pode visualizar no
	 * Relatório.
	 * 
	 * @param filtroIdLocal
	 * @param filtroIdResponsavel
	 * @param filtroIdCliente
	 * @param filtroDataInicio
	 * @param idUsuarioContexto
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Evento> getEventosPorChecklistRelatorio(
			Serializable filtroIdLocal, Serializable filtroIdResponsavel,
			Serializable filtroIdCliente, Date filtroDataInicio,
			Serializable idUsuarioContexto) {
		logger.debug("EventoRepository.getEventosPorChecklist");

		return getEventosPorChecklistCriteria(filtroIdLocal,
				filtroIdResponsavel, filtroIdCliente, filtroDataInicio,
				idUsuarioContexto).list();
	}

	/**
	 * Retorna o Criteria para pesquisar Eventos por Checklist.
	 * 
	 * @param filtroIdLocal
	 * @param filtroIdResponsavel
	 * @param filtroIdCliente
	 * @param filtroDataInicio
	 * @param idUsuarioContexto
	 * 
	 * @return
	 */
	private Criteria getEventosPorChecklistCriteria(Serializable filtroIdLocal,
			Serializable filtroIdResponsavel, Serializable filtroIdCliente,
			Date filtroDataInicio, Serializable idUsuarioContexto) {
		logger.debug("EventoRepository.getEventosPorChecklistCriteria");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Checklist.class);

		// Ordena pela data de Início:
		criteria.createAlias("evento", "evt");
		criteria.addOrder(Order.asc("evt.dataInicio"));
		criteria.add(Restrictions.eq("evt.ativo", true));

		// Filtros:
		if (isValidId(filtroIdLocal)) {
			criteria.add(Restrictions.eq("evt.local.id", filtroIdLocal));
		}
		if (isValidId(filtroIdResponsavel)) {
			criteria.add(Restrictions.eq("evt.usuarioResponsavel.id",
					filtroIdResponsavel));
		}
		if (isValidId(filtroIdCliente)) {
			criteria.createAlias("evt.local", "l");
			criteria.createAlias("l.cliente", "cli");
			criteria.add(Restrictions.eq("cli.id", filtroIdCliente));
		}
		if (filtroDataInicio != null) {
			criteria.add(Restrictions.ge("evt.dataInicio", filtroDataInicio));
		}

		// Filtra por Contexto:
		criteria.createAlias("evt.usuariosNoEvento", "usuarioContexto");
		criteria.add(Restrictions.eq("usuarioContexto.id", idUsuarioContexto));

		// Obter apenas os Locais:
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("evento"));
		criteria.setProjection(Projections.distinct(projection));

		return criteria;
	}

}