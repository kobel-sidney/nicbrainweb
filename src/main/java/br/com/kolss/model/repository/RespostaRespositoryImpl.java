package br.com.kolss.model.repository;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Resposta;

/**
 * 
 * @author hamseshenrique
 *
 */
@Repository("respostaRespository")
public class RespostaRespositoryImpl extends AbstractRepository implements RespostaRespository {
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	@Override
	public Resposta obter(Long id) {
		
		final Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Resposta.class);
		criteria.add(Restrictions.eq("id",id));
		
		return (Resposta) criteria.uniqueResult();
	}

	@Override
	public String obterDescricao(Long idResposta) {
		
		final Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Resposta.class);
		criteria.add(Restrictions.eq("id",idResposta));
		criteria.setProjection(Projections.property("descricao"));
		
		return (String) criteria.uniqueResult();
	}
}