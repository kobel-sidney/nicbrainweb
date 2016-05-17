package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Contato;
import br.com.kolss.model.entities.Telefone;

@Repository
public class TelefoneRepositoryImpl implements TelefoneRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void adicionar(Telefone telefone) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(telefone);
	}

	@Override
	public void remover(Telefone telefone) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(telefone);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Telefone> listarPorContato(Contato contato) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Telefone.class);
		criteria.add(Restrictions.eq("contato", contato));
		return criteria.list();
	}
}
