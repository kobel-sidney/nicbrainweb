package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Contato;
import br.com.kolss.model.entities.Email;

@Repository
public class EmailRepositoryImpl implements EmailRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void adicionar(Email email) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(email);
	}

	@Override
	public void remover(Email email) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(email);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Email> listarPorContato(Contato contato) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Email.class);
		criteria.add(Restrictions.eq("contato", contato));
		return criteria.list();
	}
}
