package br.com.kolss.model.dao;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;

public class HibernateDAO<T> implements InterfaceDAO<T>, Serializable {

	/** serialVersionUID */
	private static final long serialVersionUID = 5356595004420683379L;
	
	
	private Logger logger = Logger.getLogger(this.getClass());
	private Class<T> classe;
	private Session session;
	

	public HibernateDAO(Class<T> classe, Session session) {
		super();
		this.classe = classe;
		this.session = session;
	}

	@Override
	public void save(T entity) {
		session.save(entity);
		logger.debug("Entity salvo: " + entity);
	}

	@Override
	public void update(T entity) {
		session.update(entity);
		logger.debug("Entity atualizado: " + entity);
	}

	@Override
	public void remove(T entity) {
		session.delete(entity);
		logger.debug("Entity excluido: " + entity);
	}

	@Override
	public void merge(T entity) {
		session.merge(entity);
		logger.debug("Entity 'merged': " + entity);
	}

	@Override
	@SuppressWarnings("unchecked")
	public T getEntity(Serializable id) {		
		T entity = (T) session.get(classe, id);
		
		logger.debug("Entity: " + entity);
		return entity;
	}

	@Override
	@SuppressWarnings("unchecked")
	public T getEntityByDetachedCriteria(DetachedCriteria criteria) {
		T entity = (T) criteria.getExecutableCriteria(session).uniqueResult();
		
		logger.debug("Entity: " + entity);
		return entity;
	}

	@Override
	@SuppressWarnings("unchecked")
	public T getEntityByHQLQuery(String stringQuery) {
		logger.debug("HQL: " + stringQuery);
		
		Query query = session.createQuery(stringQuery);
		T entity = (T) query.uniqueResult();
		logger.debug("Entity: " + entity);
		
		return entity;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<T> getListByDetachedCriteria(DetachedCriteria criteria) {		
		logger.debug("Entity.tipo: " + classe.getName());
		
		List<T> entities = criteria.getExecutableCriteria(session).list();
		logger.debug("Entities.tamanho: " + entities.size());
		
		return entities;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<T> getEntities() {
		List<T> entities = (List<T>) session.createCriteria(classe).list();
		logger.debug("Entity.tipo: " + classe.getName());
		logger.debug("Entities.tamanho: " + entities.size());
		
		return entities;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<T> getListByHQLQuery(String stringQuery) {
		logger.debug("HQL: " + stringQuery);
		
		Query query = session.createQuery(stringQuery);
		List<T> entities = query.list();
		logger.debug("Entities.tamanho: " + entities.size());
		
		return entities;
	}

	@Override
	public Criteria getCriteria() {
		return this.session.createCriteria(this.classe);
	}

	@Override
	public Criteria getCriteria(Class<T> persistentClass) {
		return this.session.createCriteria(persistentClass);
	}

}
