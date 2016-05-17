package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Contato;
import br.com.kolss.model.entities.EnderecoNovoModelo;

@Repository
public class EnderecoNovoModeloRepositoryImpl implements EnderecoNovoModeloRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void adicionar(EnderecoNovoModelo endereco) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(endereco);
	}

	@Override
	public void remover(EnderecoNovoModelo endereco) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(endereco);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EnderecoNovoModelo> listarPorContato(Contato contato) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(EnderecoNovoModelo.class);
		criteria.add(Restrictions.eq("contato", contato));
		return criteria.list();
	}
}
