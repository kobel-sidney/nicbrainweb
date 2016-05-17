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
import br.com.kolss.model.entities.OperacaoAtividade;


@Repository
public class OperacaoAtividadeChecklistRepository {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@SuppressWarnings("unchecked")
	public List<OperacaoAtividade> getOperacoesDaAtividadePorChecklist(
			Checklist checklist) {
		logger.debug("OperacaoAtividadeChecklistRepository.getAtividadesPorChecklist");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(OperacaoAtividade.class);
		
		criteria.createAlias("atividade", "atv");
		criteria.createAlias("atv.checklist", "chk");
		criteria.add(Restrictions.eq("chk.id",checklist.getId()));
		
		List<OperacaoAtividade> lst = criteria.list();
		for (OperacaoAtividade entity : lst) {
			entity.toString();
		}
		
		return lst;
	}
	
	public void salvar(OperacaoAtividade operacaoAtividade) {
		logger.debug("OperacaoAtividadeChecklistRepository.salvar");
		
		Session session = sessionFactory.getCurrentSession();
		session.save(operacaoAtividade);
		
		// TODO: Verificar 'no mobile, precisa dar flush na mão' (transaction?!) 
//		session.flush();
	}
	
}
