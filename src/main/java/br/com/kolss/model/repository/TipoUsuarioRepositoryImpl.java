package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.TipoUsuario;

@Repository
public class TipoUsuarioRepositoryImpl implements TipoUsuarioRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public TipoUsuario find(Serializable id) throws ServiceException {

		Session session = sessionFactory.getCurrentSession();
		return (TipoUsuario) session.load(TipoUsuario.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TipoUsuario> listarTipoUsuario() throws ServiceException {

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TipoUsuario.class);
		return criteria.list();
	}
}
