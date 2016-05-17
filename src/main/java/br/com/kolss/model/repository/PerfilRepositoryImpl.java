package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Perfil;

@Repository
public class PerfilRepositoryImpl implements PerfilRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Perfil find(Serializable id) throws ServiceException {
		Session session = sessionFactory.getCurrentSession();
		return (Perfil) session.load(Perfil.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Perfil> listarPerfis() throws ServiceException {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Perfil.class);
		return criteria.list();
	}
}
