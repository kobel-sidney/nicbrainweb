package br.com.kolss.model.repository;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TelefoneUtil;

@Repository
public class TelefoneUtilRepositoryImpl implements TelefoneUtilRepository {

	private final Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private SessionFactory sessionFactory;

	
	@SuppressWarnings("unchecked")
	@Override
	public List<TelefoneUtil> obterTodos(Contratante contratante) throws ServiceException {
		logger.info("TelefoneUtilRepositoryImpl.obterTodos");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TelefoneUtil.class);
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		return criteria.list();
	}

	@Override
	public void remover(TelefoneUtil telefoneUtil) {
		logger.info("TelefoneUtilRepositoryImpl.remover");
		Session session = sessionFactory.getCurrentSession();
		session.delete(telefoneUtil);
	}

	@Override
	public void atualizar(TelefoneUtil telefoneUtil) {
		logger.info("TelefoneUtilRepositoryImpl.atualizar");
		Session session = sessionFactory.getCurrentSession();
		session.update(telefoneUtil);
	}

	@Override
	public void salvar(TelefoneUtil telefoneUtil) {
		logger.info("TelefoneUtilRepositoryImpl.salvar");
		Session session = sessionFactory.getCurrentSession();
		session.save(telefoneUtil);
	}
	
}
