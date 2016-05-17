package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Regra;

@Repository
public class RegraRepositoryImpl implements RegraRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Regra> obterRegras() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Regra.class);

		return criteria.list();
	}

	@Override
	public Regra obterRegras(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Regra.class);
		criteria.add(Restrictions.eq("id", id));

		return (Regra) criteria.uniqueResult();
	}
}
