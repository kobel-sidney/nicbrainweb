package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Turno;


@Repository("TurnoRespository")
public class TurnoRespositoryImpl implements TurnoRespository {
	
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private SessionFactory sessionFactory;
	

	@Override
	public void atualizar(Turno turno) {
		logger.debug("TurnoRespositoryImpl.salvar");
		Session session = sessionFactory.getCurrentSession();
		session.update(turno);
	}

	@Override
	public void salvar(Turno turno) {
		logger.debug("TurnoRespositoryImpl.salvar");
		Session session = sessionFactory.getCurrentSession();
		session.save(turno);

	}

	@Override
	public void remover(Turno turno) {
		logger.debug("TurnoRespositoryImpl.remover");
		Session session = sessionFactory.getCurrentSession();
		session.delete(turno);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Turno> obterTodos(Contratante contratante) {
		logger.debug("TurnoRespositoryImpl.obterTodos()");
		final Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Turno.class);
		criteria.add(Restrictions.eq("contratante.id",contratante.getId()));
		return (List<Turno>) criteria.list();
	}

	@Override
	public Turno obter(Serializable id) {
		logger.debug("TurnoRespositoryImpl.obter()");
		final Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Turno.class);
		criteria.add(Restrictions.eq("id",id));
		return (Turno) criteria.uniqueResult();
	}

}
