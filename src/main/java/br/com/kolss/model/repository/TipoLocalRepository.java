package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.TipoLocal;

@Repository
public class TipoLocalRepository extends AbstractRepository {
	
	@Autowired
	private SessionFactory sessionFactory;

	public List<TipoLocal> getTiposLocal() {
		logger.debug("TipoLocalRepository.getTiposLocal");
		
		Session session = sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(TipoLocal.class);
		criteria.addOrder(Order.asc("nome"));
		
		return criteria.list();
	}

}
