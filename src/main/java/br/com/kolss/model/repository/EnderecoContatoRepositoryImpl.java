package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Contato;
import br.com.kolss.model.entities.EnderecoContato;

@Repository
public class EnderecoContatoRepositoryImpl implements EnderecoContatoRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void adicionar(EnderecoContato enderecoContato) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(enderecoContato);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EnderecoContato> listarPorContato(Contato contato) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(EnderecoContato.class);
		criteria.add(Restrictions.eq("contato", contato));
		return criteria.list();
	}

	@Override
	public void remover(EnderecoContato enderecoContato) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(enderecoContato);
	}

}
