package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.Status;
import br.com.kolss.model.entities.StatusEnum;


@Repository
@Transactional(readOnly=false)
public class StatusRepositoryImpl implements StatusRepository{
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	/**
	 * Retorna o Status pelo seu ID, contendo todos os seus atributos 
	 * populados.
	 * 
	 * @param idStatus
	 * 
	 * @return
	 */
	@Override
	public Status obter(Serializable idStatus) {
		logger.debug("StatusRepository.find");
		
		Session session = this.sessionFactory.getCurrentSession();
		return (Status) session.load(Status.class, idStatus);
	}
	
	/**
	 * Retorna todos os status que podem ser alterados dentro de uma Atividade
	 * ou AtividadeOcorrencia.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Status> obterStatusAlteraveis() {
		logger.debug("StatusRepository.getStatusAlteraveis");
		
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Status.class);
		
		criteria.addOrder(Order.asc("nome"));
		criteria.add(Restrictions.ne("id", StatusEnum.CANCELADA.getId()));
		criteria.add(Restrictions.ne("id", StatusEnum.FINALIZADA.getId()));
		
		return criteria.list();
	}
	
	/**
	 * Retorna todos os status que podem ser consultados dentro Checklist
	 * 
	 * @return
	 */
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Status> obterChecklistStatus() {
		
		logger.debug("StatusRepository.getAllChecklistStatus");
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Status.class);
		
		criteria.addOrder(Order.asc("nome"));
		criteria.add(Restrictions.ne("id", StatusEnum.AGUARDANDO.getId()));
		
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Status> obterTodos() {
		
		logger.debug("StatusRepository.obterTodos");
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Status.class);
		return ((List<Status>) criteria.list());
	}

	@Override
	public void remover(Status status) {
		logger.debug("StatusRepository.remover");
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(status);
	}

	@Override
	public void atualizar(Status status) {
		logger.debug("StatusRepository.atualizar");
		Session session = this.sessionFactory.getCurrentSession();
		session.update(status);
	}

	@Override
	public void salvar(Status status) {
		logger.debug("StatusRepository.salvar");
		Session session = this.sessionFactory.getCurrentSession();
		session.save(status);
	}
	
}
