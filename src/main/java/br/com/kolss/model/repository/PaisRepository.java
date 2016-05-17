package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Pais;


@Repository
public class PaisRepository extends AbstractRepository {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Pais> obterTodos() {
		logger.debug("PaisRepository.getPaises");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Pais.class);
		criteria.addOrder(Order.asc("nome"));
		return criteria.list();
	}

	public void salvar(Pais pais) {
		logger.debug("PaisRepository.salvar");
		Session session = sessionFactory.getCurrentSession();
		session.save(pais);
	}

	public void atualizar(Pais pais) {
		logger.debug("PaisRepository.atualizar");
		Session session = sessionFactory.getCurrentSession();
		session.update(pais);
	}

	public void remover(Pais pais) {
		logger.debug("PaisRepository.remover");
		Session session = sessionFactory.getCurrentSession();
		session.delete(pais);
	}
	
}
