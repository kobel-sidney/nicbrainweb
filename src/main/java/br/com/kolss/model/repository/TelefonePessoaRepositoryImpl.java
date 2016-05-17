package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.TelefonePessoa;

@Repository
public class TelefonePessoaRepositoryImpl implements TelefonePessoaRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<TelefonePessoa> listarPorPessoa(Pessoa pessoa) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TelefonePessoa.class, "telefone");
		criteria.createAlias("telefone.tipoTelefone", "tipoTelefone");
		criteria.createAlias("telefone.pessoa", "pessoa");
		criteria.add(Restrictions.eq("pessoa", pessoa));
		return criteria.list();
	}

	@Override
	public void salvar(TelefonePessoa telefone) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(telefone);
	}

	@Override
	public void excluir(TelefonePessoa telefone) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(telefone);
	}

	@Override
	public TelefonePessoa buscar(Long id) {
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TelefonePessoa.class);
		criteria.add(Restrictions.eq("id", id));
		
		return (TelefonePessoa) criteria.uniqueResult();
	}
}
