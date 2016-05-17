package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Local;

@Repository
@Transactional(readOnly = true)
public class ClienteRepository {

	protected Logger logger = Logger.getLogger(getClass());

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Retorna todos os Clientes que o Usuário solicitante tem permissão de
	 * visualização.
	 *
	 * @param idUsuarioContexto
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Cliente> getClientes(Serializable idUsuarioContexto) {
		logger.debug("ClienteRepository.getClientes");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Local.class);

		// Filtra por Contexto:
		criteria.createAlias("eventos", "evt");
		criteria.createAlias("evt.usuariosNoEvento", "usr");
		criteria.add(Restrictions.eq("usr.id", idUsuarioContexto));

		// Ordena por nome fantasia:
		criteria.createAlias("cliente", "cli");
		criteria.addOrder(Order.asc("cli.nomeFantasia"));

		// Retorna somente os Clientes:
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("cliente"));
		criteria.setProjection(Projections.distinct(projection));

		return criteria.list();
	}

	/**
	 * Busca todos os clientes por Contratante.
	 *
	 * @param contratante
	 *
	 * @return Lista de Clientes
	 *
	 * @throws ServiceException
	 */
	public List<Cliente> getClientePorContratante(Contratante contratante)
			throws ServiceException {

		logger.debug("ClienteRepository.getClientePorContratante");

		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				Cliente.class);
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));

		List<Cliente> lst = criteria.list();
		for (Cliente entity : lst) {
			entity.toString();
		}

		return lst;
	}

	/**
	 * Retorna um cliente pelo ID
	 *
	 * @param id
	 * @return
	 */
	public Cliente find(Serializable id) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Cliente.class);
		criteria.add(Restrictions.eq("id", id));
		criteria.setFetchMode("clientesMensagens", FetchMode.JOIN);
		
		return (Cliente) criteria.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<Cliente> listarClientes() {

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Cliente.class);
		criteria.add(Restrictions.eq("ativo", true));
		return criteria.list();
	}

	public void atualizar(Cliente cliente) {
		logger.debug("ClienteRepository.atualizar");

		Session session = sessionFactory.getCurrentSession();
		session.update(cliente);
	}

	public void salvar(Cliente cliente) {
		logger.debug("ClienteRepository.salvar");
		Session session = sessionFactory.getCurrentSession();
		session.save(cliente);
	}

	public void remover(Cliente cliente) {
		logger.debug("ClienteRepository.remover");
		Session session = sessionFactory.getCurrentSession();
		session.delete(cliente);
	}
}
