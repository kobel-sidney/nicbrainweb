package br.com.kolss.model.repository;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Contato;
import br.com.kolss.model.entities.PessoaNovoModelo;

@Repository
public class ContatoRepositoryImpl implements ContatoRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void adicionar(Contato contato) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(contato);
	}

	@Override
	public void remover(Contato contato) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(contato);
	}

	@Override
	public Contato buscarPorPessoa(PessoaNovoModelo pessoa) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Contato.class);
		criteria.add(Restrictions.eq("pessoa", pessoa));
		return (Contato) criteria.uniqueResult();
	}
}
