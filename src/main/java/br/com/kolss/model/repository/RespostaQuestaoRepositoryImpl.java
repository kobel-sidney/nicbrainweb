package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.dto.RespostaQuestaoDTO;
import br.com.kolss.model.entities.RespostaQuestao;

@Repository("respostaQuestaoRepository")
public class RespostaQuestaoRepositoryImpl implements RespostaQuestaoRepository {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveOrUpdate(RespostaQuestao respostaQuestao) {
		try{
			sessionFactory.getCurrentSession().saveOrUpdate(respostaQuestao);	
			sessionFactory.getCurrentSession().flush();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
	}
	
	@Override
	public RespostaQuestao obterRespostaQuestao(final RespostaQuestaoDTO respostaQuestao){
		
		final Criteria criteria = sessionFactory.getCurrentSession().createCriteria(RespostaQuestao.class);
		criteria.add(Restrictions.eq("idAtividade", respostaQuestao.getIdAtividade()));
		criteria.add(Restrictions.eq("idGrupoQuestao", respostaQuestao.getIdGrupo()));
		criteria.add(Restrictions.eq("idPerfilFormulario", respostaQuestao.getIdPerfilFormulario()));
		criteria.add(Restrictions.eq("idQuestao", respostaQuestao.getIdQuestao()));
		
		if(respostaQuestao.getIdResposta() != null){
			criteria.add(Restrictions.eq("idResposta", respostaQuestao.getIdResposta()));
		}
		
		return (RespostaQuestao) criteria.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<RespostaQuestao> obterRespostaQuestaoPorAtividade(final Long idAtividade){
		
		final Criteria criteria = sessionFactory.getCurrentSession().createCriteria(RespostaQuestao.class);
		criteria.add(Restrictions.eq("idAtividade",idAtividade));
		criteria.addOrder(Order.asc("ordemGrupo"));
		criteria.addOrder(Order.asc("ordemPergunta"));
		criteria.addOrder(Order.asc("ordemResposta"));
		
		return criteria.list();
	}
}
