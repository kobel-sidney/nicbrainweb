package br.com.kolss.model.dao;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import br.com.kolss.exception.DaoException;
import br.com.kolss.model.entities.ChecklistMensagem;
import br.com.kolss.model.entities.TipoMensagem;
import br.com.kolss.util.HibernateUtil;


public class ChecklistMensagemDaoImpl implements ChecklistMensagemDao {
	
	private final Logger logger = Logger.getLogger(getClass());
	
	
	@Override
	public boolean existeAlertaPorLocal(Integer idLocal, boolean ativo)
			throws DaoException {
		logger.debug("ChecklistMensagemDaoImpl.contemAlertaPorLocal");
		
		try {
			final Session session = HibernateUtil.getSessionFactory().openSession();
			final Transaction tx = session.beginTransaction();
			
			Criteria criteria = session.createCriteria(ChecklistMensagem.class);
			criteria.createAlias("mensagem", "msg");
			criteria.createAlias("msg.tipoMensagem", "tpMessage");
			criteria.add(Restrictions.eq("tpMessage.idTipoMsg",
					TipoMensagem.ID_TIPO_ALERTA));
			criteria.add(Restrictions.eq("ativo", ativo));
			criteria.add(Restrictions.eq("id.idLocal", idLocal));
			criteria.setProjection(Projections.rowCount());
			
			Number qtd = (Number) criteria.uniqueResult();
			tx.commit();
			session.close();
			
			return (qtd.intValue() > 0 ? true : false);  
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new DaoException("Erro pesquisar 'contemAlertaPorLocal'");
		}
	}


	@Override
	public boolean existeMensagemPoChecklist(Integer idChecklist)
			throws DaoException {
		// TODO Auto-generated method stub
		
		final Session session = HibernateUtil.getSessionFactory().openSession();
		final Transaction tx = session.beginTransaction();
		
		  Criteria criteria = session.createCriteria(ChecklistMensagem.class);
		   criteria.createAlias("mensagem", "msg");
		   criteria.createAlias("msg.tipoMensagem", "tpMessage");
		   criteria.add(Restrictions.eq("id.idChecklist", idChecklist));
		   //criteria.add(Restrictions.eq("tpMessage.idTipoMsg", idTipoMensagem));
		   criteria.setProjection(Projections.rowCount());
		   
		   Number qtd = (Number) criteria.uniqueResult();
		   tx.commit();
		   session.close();
		   
		   return (qtd.intValue() > 0 ? true : false);
	}
	
	
	
}
