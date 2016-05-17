package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.ChecklistPadrao;
import br.com.kolss.model.entities.Segmento;


@Repository
public class SegmentoRepositoryImpl extends AbstractRepository implements SegmentoRepository {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	/**
	 * Retorna todos os segmentos cadastrados no sistema. 
	 *
	 * @return
	 */
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Segmento> obterTodos() {
		logger.debug("SegmentoRepositoryImpl.getSegmentos");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Segmento.class);
		criteria.addOrder(Order.asc("nome"));
		
		return criteria.list();
	}
	
	
	/**
	 * Retorna todos os segmentos associados ao Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 * 
	 * @return
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<Segmento> getSegmentosAssociados(ChecklistPadrao checklistPadrao) {
		logger.debug("SegmentoRepositoryImpl.getSegmentosAssociados");
		
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Segmento.class);
		criteria.addOrder(Order.asc("nome"));
		
		criteria.createAlias("checklistsPadroes", "chkPadrao");
		criteria.add(Restrictions.eq("chkPadrao.id", checklistPadrao.getId()));
		
		return criteria.list();
	}
	
	/**
	 * Remove todas as associações dos Segmentos com o Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 */
	@Override
	public void removerAssociacao(ChecklistPadrao checklistPadrao) {
		logger.debug("SegmentoRepositoryImpl.removerAssociacao");
		
		Session session = this.sessionFactory.getCurrentSession();
		ChecklistPadrao entity = (ChecklistPadrao) session.load(
				ChecklistPadrao.class, checklistPadrao.getId());
		
		entity.setSegmentos(null);
		session.update(entity);
	}
	
	/**
	 * Associa os Segmentos escolhidos ao Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 * @param idSegmentos
	 */
	@Override
	public void associarSegmentos(ChecklistPadrao checklistPadrao,
			Collection<Serializable> idSegmentos) {
		logger.debug("SegmentoRepositoryImpl.associarSegmentos");
		
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Segmento.class);
		criteria.add(Restrictions.in("id", idSegmentos));
		
		@SuppressWarnings("unchecked")
		List<Segmento> lst = criteria.list();
		
		ChecklistPadrao entity = (ChecklistPadrao) session.load(ChecklistPadrao.class, checklistPadrao.getId());
		entity.setSegmentos(new HashSet<Segmento>(lst));
		
		session.update(entity);
	}


	@Override
	public void salvar(Segmento segmento) {
		logger.debug("SegmentoRepositoryImpl.salvar()");
		Session session = sessionFactory.getCurrentSession();
		session.save(segmento);
	}


	@Override
	public void atualizar(Segmento segmento) {
		logger.debug("SegmentoRepositoryImpl.atualizar()");
		Session session = sessionFactory.getCurrentSession();
		session.update(segmento);
	}

	@Override	
	public void remover(Segmento segmento) {
		logger.debug("SegmentoRepositoryImpl.salvar()");
		Session session = sessionFactory.getCurrentSession();
		session.delete(segmento);
	}
	
}
