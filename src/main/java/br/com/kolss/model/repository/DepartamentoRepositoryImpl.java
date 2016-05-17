/**
 * 
 */
package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Departamento;

/**
 * @author adansbento
 *
 */
@Repository
public class DepartamentoRepositoryImpl implements DepartamentoRepository {
	

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void atualizar(Departamento departamento) {
		Session session = sessionFactory.getCurrentSession();
		session.update(departamento);
	}

	@Override
	public void salvar(Departamento departamento) {
		Session session = sessionFactory.getCurrentSession();
		session.save(departamento);
	}

	@Override
	public void remover(Departamento departamento) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(departamento);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Departamento> obterTodos(Contratante contratante) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Departamento.class);
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		return criteria.list();
	}

	@Override
	public Departamento obter(Serializable id, Contratante contratante) {

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Departamento.class);
		criteria.add(Restrictions.eq("id", id));
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		
		return (Departamento) criteria.uniqueResult();
	}
	
	

}
