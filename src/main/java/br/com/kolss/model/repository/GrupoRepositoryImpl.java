package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Grupo;

@Repository
public class GrupoRepositoryImpl implements GrupoRepository {

	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private SessionFactory sessionFactory;
	

	@Override
	public void atualizar(Grupo grupo) throws ServiceException {

		logger.debug("GrupoRepositoryImpl.atualizar(grupo)");
		final Session session = sessionFactory.getCurrentSession();
		session.update(grupo);

	}

	@Override
	public void salvar(Grupo grupo) throws ServiceException {

		logger.debug("GrupoRepositoryImpl.salvar(grupo)");
		final Session session = sessionFactory.getCurrentSession();
		session.save(grupo);
	}

	@Override
	public void remover(Grupo grupo) throws ServiceException {

		logger.debug("GrupoRepositoryImpl.remover(grupo)");
		final Session session = sessionFactory.getCurrentSession();
		session.delete(grupo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Grupo> obterTodos(Contratante contratante)	throws ServiceException {
	
		logger.debug("GrupoRepositoryImpl.obterTodos(contratante)");
		
		final Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Grupo.class);
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));

		return (List<Grupo> ) criteria.list();
	}

	@Override
	public Grupo obter(Serializable id) throws ServiceException {
		
		logger.debug("GrupoRepositoryImpl.obter()");
		
		final Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Grupo.class);
		criteria.add(Restrictions.eq("id", id));

		return (Grupo) criteria.uniqueResult();
	}

}
