package br.com.kolss.model.repository;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.OperacaoChecklist;
import br.com.kolss.service.OperacaoChecklistRepository;


@Repository
public class OperacaoChecklistRepositoryImpl implements
		OperacaoChecklistRepository {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<OperacaoChecklist> getOperacoesPorChecklist(Checklist checklist) {
		logger.debug("OperacaoChecklistRepository.getOperacoesPorChecklist");
		
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(OperacaoChecklist.class);
		
		criteria.add(Restrictions.eq("checklist.id", checklist.getId()));
		
		List<OperacaoChecklist> lst = criteria.list();
		for (OperacaoChecklist entity : lst) {
			entity.toString();
		}
		
		return lst;
	}
	
	public void salvarOperacao(OperacaoChecklist operacaoChecklist) {
		logger.debug("OperacaoChecklistRepository.salvarOperacao");
		
		Session session = this.sessionFactory.getCurrentSession();
		session.save(operacaoChecklist);
		
		// TODO: Verificar 'no mobile, precisa dar flush na mão' (transaction?!)
//		session.flush();
	}
	
}
