package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TipoServico;


@Repository("TipoServicoRepository")
public class TipoServicoRepositoryImpl implements TipoServicoRepository {
	
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void atualizar(TipoServico tipoServico) throws ServiceException {
		logger.debug("TipoServicoRepositoryImpl.atualizar");
		Session session = sessionFactory.getCurrentSession();
		session.update(tipoServico);
	}

	@Override
	public void salvar(TipoServico tipoServico) throws ServiceException {
		logger.debug("TipoServicoRepositoryImpl.salvar");
		Session session = sessionFactory.getCurrentSession();
		session.save(tipoServico);
	}

	@Override
	public void remover(TipoServico tipoServico) throws ServiceException {
		logger.debug("TipoServicoRepositoryImpl.remover");
		Session session = sessionFactory.getCurrentSession();
		session.delete(tipoServico);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TipoServico> obterTodos(Contratante contratante) throws ServiceException {
		logger.debug("TipoServicoRepositoryImpl.obterTodos");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TipoServico.class);
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		criteria.addOrder(Order.asc("nome"));
		return criteria.list();
	}

	@Override
	public TipoServico obter(Serializable id) throws ServiceException {
		logger.debug("TipoServicoRepositoryImpl.obter");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TipoServico.class);
		criteria.add(Restrictions.eq("id", id));
		return (TipoServico) criteria.uniqueResult();
	}

	@Override
	public List<TipoServico> obterTodos() throws ServiceException {
		logger.debug("TipoServicoRepositoryImpl.obterTodos");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TipoServico.class);
		criteria.addOrder(Order.asc("nome"));
		return criteria.list();
	}
}
