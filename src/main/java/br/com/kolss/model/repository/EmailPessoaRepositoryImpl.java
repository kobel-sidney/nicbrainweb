package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.EmailPessoa;
import br.com.kolss.model.entities.Pessoa;

@Repository
public class EmailPessoaRepositoryImpl implements EmailPessoaRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<EmailPessoa> listarPorPessoa(Pessoa pessoa) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(EmailPessoa.class, "email");
		criteria.createAlias("email.pessoa", "pessoa");
		criteria.add(Restrictions.eq("pessoa", pessoa));
		return criteria.list();
	}

	@Override
	public void salvar(EmailPessoa email) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(email);
	}

	@Override
	public void excluir(EmailPessoa email) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(email);
	}

	@Override
	public EmailPessoa buscar(Long id) {
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(EmailPessoa.class);
		criteria.add(Restrictions.eq("id", id));
		return (EmailPessoa) criteria.uniqueResult();
		
	}
}
