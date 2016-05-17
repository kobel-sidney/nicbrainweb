package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Documento;
import br.com.kolss.model.entities.PessoaNovoModelo;

@Repository
public class DocumentoRepositoryImpl implements DocumentoRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Documento> listarTodos() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Documento.class);
		return criteria.list();
	}

	@Override
	public Documento buscar(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Documento.class);
		criteria.add(Restrictions.eq("id", id));
		return (Documento) criteria.uniqueResult();
	}

	@Override
	public void adicionar(Documento documento) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(documento);
	}

	@Override
	public void remover(Documento documento) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(documento);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Documento> listarPorPessoa(PessoaNovoModelo pessoa) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Documento.class);
		criteria.add(Restrictions.eq("pessoa", pessoa));
		return criteria.list();
	}

}
