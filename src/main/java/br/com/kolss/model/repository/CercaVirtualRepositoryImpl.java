package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.CercaVirtual;
import br.com.kolss.model.entities.Local;

@Repository
public class CercaVirtualRepositoryImpl implements CercaVirtualRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void salvar(CercaVirtual cercaVirtual) {
		Session session = sessionFactory.getCurrentSession();

		session.save(cercaVirtual);
	}

	@Override
	public void atualizar(CercaVirtual cercaVirtual) {
		Session session = sessionFactory.getCurrentSession();

		session.update(cercaVirtual);
	}

	@Override
	public void excluir(CercaVirtual cercaVirtual) {
		Session session = sessionFactory.getCurrentSession();

		session.delete(cercaVirtual);
		session.flush();
	}

	@Override
	public List<CercaVirtual> buscarPorLocal(Local local) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(CercaVirtual.class);
		criteria.add(Restrictions.eq("local", local));

		return criteria.list();
	}

	@Override
	public CercaVirtual buscarPorId(Integer idCercaVirtual) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(CercaVirtual.class);
		criteria.add(Restrictions.eq("id", idCercaVirtual));
		criteria.setFetchMode("coordenadas", FetchMode.SELECT);

		return (CercaVirtual) criteria.uniqueResult();
	}
}
