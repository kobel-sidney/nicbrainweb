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
import br.com.kolss.model.entities.Municipio;

@Repository
public class MunicipioRepositoryImpl extends AbstractRepository implements MunicipioRepository{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Municipio obter(Long id) {
		logger.debug("MunicipioRepositoryImpl.obter(id)");
		Session session = sessionFactory.getCurrentSession();
		return (Municipio) session.load(Municipio.class, id);
	}

	/**
	 * Retorna todos os municipios cadastrados no sistema.
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Municipio> obterTodos() {
		
		logger.debug("MunicipioRepositoryImpl.obterTodos");
		List<Municipio> list;
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Municipio.class);
		criteria.addOrder(Order.asc("nome"));
		list = criteria.list();
		return list;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Municipio> obterPorEstado(Estado estado) {
		
		logger.debug("MunicipioRepositoryImpl.obterPorEstado");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Municipio.class);
		criteria.add(Restrictions.eq("estado.id", estado.getId()));
		criteria.addOrder(Order.asc("nome"));

		return criteria.list();
	}

	@Override
	public void salvar(Municipio municipio) {
		logger.debug("MunicipioRepositoryImpl.salvar");
		Session session = sessionFactory.getCurrentSession();
		session.save(municipio);
	}
	
	@Override
	public void atualizar(Municipio municipio) {
		logger.debug("MunicipioRepositoryImpl.atualizar");
		Session session = sessionFactory.getCurrentSession();
		session.update(municipio);
	}

	@Override
	public void remover(Municipio municipio) {
		logger.debug("MunicipioRepositoryImpl.remover");
		Session session = sessionFactory.getCurrentSession();
		session.delete(municipio);
	}
}
