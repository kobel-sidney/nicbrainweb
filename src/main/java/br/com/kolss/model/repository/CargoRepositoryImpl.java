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

import br.com.kolss.model.entities.Cargo;
import br.com.kolss.model.entities.Contratante;

@Repository("CargoRepository")
public class CargoRepositoryImpl implements CargoRepository {
	
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void atualizar(Cargo cargo) {
		logger.debug("CargoRepositoryImpl.atualizar()");
		Session session = sessionFactory.getCurrentSession();
		session.update(cargo);
	}

	@Override
	public void salvar(Cargo cargo) {
		
		logger.debug("CargoRepositoryImpl.salvar()");
		Session session = sessionFactory.getCurrentSession();
		session.save(cargo);
	}

	@Override
	public void remover(Cargo cargo) {
		
		logger.debug("CargoRepositoryImpl.remover()");
		Session session = sessionFactory.getCurrentSession();
		session.delete(cargo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Cargo> obterTodos(Contratante contratante) {
		
		logger.debug("CargoRepositoryImpl.obterTodos()");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Cargo.class);
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		criteria.addOrder(Order.asc("nome"));
		return criteria.list();
	}

	@Override
	public Cargo obter(Serializable id) {
		
		logger.debug("CargoRepositoryImpl.obter()");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Cargo.class);
		criteria.add(Restrictions.eq("id", id));
		return (Cargo) criteria.uniqueResult();
	}

}
