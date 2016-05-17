package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Estado;


@Repository
public class EstadoRepository extends AbstractRepository {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	/**
	 * Retorna todos os estados cadastrados no sistema.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Estado> obterTodos() {
		logger.debug("EstadoRepository.getEstados");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Estado.class);
		criteria.addOrder(Order.asc("nome"));
		
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Estado> obterPorPais(Long idPais) {
		logger.debug("EstadoRepository.obterEstadosPorPais");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Estado.class);
		criteria.add(Restrictions.eq("pais.id", idPais));
		criteria.addOrder(Order.asc("nome"));
		
		return criteria.list();
	}

	public Estado buscar(Long id) {

		logger.debug("EstadoRepository.buscar()");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Estado.class);
		criteria.add(Restrictions.eq("id",id));

		return (Estado) criteria.uniqueResult();
	}

	public void atualizar(Estado model) {
		logger.debug("EstadoRepository.atualizar()");
		Session session = this.sessionFactory.getCurrentSession();
		session.save(model);
	}

	public void remover(Estado model) {
		logger.debug("EstadoRepository.remover()");
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(model);
	}

	public void salvar(Estado model) {
		logger.debug("EstadoRepository.salvar()");
		Session session = this.sessionFactory.getCurrentSession();
		session.save(model);
	}
	
}
