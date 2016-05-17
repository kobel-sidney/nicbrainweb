package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.CercaVirtual;
import br.com.kolss.model.entities.Coordenada;

@Repository
public class CoordenadaRepositoryImpl implements CoordenadaRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void salvar(Coordenada coordenada) {
		Session session = sessionFactory.getCurrentSession();

		session.save(coordenada);
	}

	@Override
	public void excluir(Coordenada coordenada) {
		Session session = sessionFactory.getCurrentSession();

		session.delete(coordenada);
		session.flush();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Coordenada> obterCoordenadas(CercaVirtual cercaVirtual) {
		Session session = sessionFactory.getCurrentSession();

		Criteria criteria = session.createCriteria(Coordenada.class);
		criteria.add(Restrictions.eq("cercaVirtual", cercaVirtual));
		criteria.addOrder(Order.asc("indiceCoordenada"));

		return criteria.list();
	}

}
