package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.ObjectNotFoundException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.AbstractEntity;


@Repository
public class DadosMestresRepositoryImpl<T extends AbstractEntity<?>> implements DadosMestresRepository<T> {

	protected Logger logger = Logger.getLogger(getClass());

	@Autowired
	private SessionFactory sessionFactory;
	

	@SuppressWarnings("unchecked")
	@Override
	public T obter(Serializable id,Class<T> clazz) {
		
		logger.debug("DadosMestresRepositoryImpl.obter("+id+", "+clazz.getName()+")");
		Session session = sessionFactory.getCurrentSession();
		T entity = null;

		try {
			//Verifica se o objeto existe na base
			entity =  ((T) session.load(clazz, id));
  
		} catch (ObjectNotFoundException objectNotFoundException) {
			StringBuilder str = new StringBuilder();
			str.append("Objeto do tipo ");
			str.append(clazz.toString());
			str.append(" de id ");
			str.append(id.toString());
			str.append(" não existe.");
			logger.info(str.toString());
		}
		return entity;
	}

	/**
	 *
	 * @param entity
	 */
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void atualizar(T entity) {
		
		logger.debug("DadosMestresRepositoryImpl.atualizar");
		Session session = sessionFactory.getCurrentSession();
		session.update(entity);
		
	}

	/**
	 *
	 * @param entity
	 */
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void salvar(T entity) {
		
		logger.debug("DadosMestresRepositoryImpl.salvar");
		Session session = sessionFactory.getCurrentSession();
		session.save(entity);
	}

	/**
	 *
	 * @param entity
	 */
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void remover(T entity) {

		logger.debug("DadosMestresRepositoryImpl.remover");
		Session session = sessionFactory.getCurrentSession();
		session.delete(entity);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> obterTodos(Class<T> clazz) {
		
		logger.debug("DadosMestresRepositoryImpl.listar");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(clazz);
		criteria.addOrder(Order.asc("nome"));
		
		return criteria.list();
	}

}