package br.com.kolss.model.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;

public interface InterfaceDAO<T> {

	void save (T entity);
	void update (T entity);
	void remove (T entity);
	void merge (T entity);
	T getEntity (Serializable id);
	T getEntityByDetachedCriteria (DetachedCriteria criteria);
	T getEntityByHQLQuery (String stringQuery);
	List<T> getEntities();
	List<T> getListByDetachedCriteria(DetachedCriteria criteria);
	List<T> getListByHQLQuery(String stringQuery);
	
	/** 
	 * Gera um Criteria a partir da sessão corrente.
	 * 
	 * @param <T> Tipo Genérico desta classe.
	 * 
	 * @return
	 */
	public Criteria getCriteria();
	
	/**
	 * Gera um Criteria a partir da sessão corrente. 
	 * 
	 * @param persistentClass Tipo da Classe a ser pesquisada.
	 * 
	 * @return
	 */
	public Criteria getCriteria(Class<T> persistentClass);
	
}
