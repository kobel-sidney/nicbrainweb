package br.com.kolss.model.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.DaoException;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.StatusEnum;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class AtividadeChecklistDaoImpl implements AtividadeChecklistDao{

	private final Logger logger = Logger.getLogger(AtividadeChecklistDaoImpl.class);
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Atividade> listarAtividadeChecklist(Long idChecklist, Long idEvento)
			throws DaoException {
		// TODO Auto-generated method stub
		try {
			
			Session session = this.sessionFactory.getCurrentSession();
			
			@SuppressWarnings("unchecked")
			List<Atividade> listaAtividade = 
					session.createCriteria(Atividade.class)
					.add(Restrictions.eq("checklist.id", idChecklist))
					.add(Restrictions.ne("status.id", StatusEnum.FINALIZADA.getId()))
					.add(Restrictions.ne("status.id", StatusEnum.CANCELADA.getId()))
					.list();
			
			return listaAtividade; 
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new DaoException("Erro ao listar Checklist");
		}
	}

	@Override
	public Atividade getAtividadePorId(Long idAtividade)
			throws ServiceException {
		// TODO Auto-generated method stub
		
		
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(Atividade.class);
		criteria.add(Restrictions.eq("id.idAtividade", idAtividade));
		Atividade atividade = (Atividade) criteria.uniqueResult();
		
		return atividade;
	}
}
