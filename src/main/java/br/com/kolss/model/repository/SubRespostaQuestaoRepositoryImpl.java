package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.dto.SubRespostaQuestaoDTO;
import br.com.kolss.model.entities.SubRespostaQuestao;

@Repository("subRespostaQuestaoRepository")
public class SubRespostaQuestaoRepositoryImpl implements
		SubRespostaQuestaoRepository {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveOrUpdate(SubRespostaQuestao subRespostaQuestao) {
		sessionFactory.getCurrentSession().saveOrUpdate(subRespostaQuestao);
	}

	@Override
	public SubRespostaQuestao obterRespostaQuestao(final SubRespostaQuestaoDTO subRespostaQuestaoDTO) {
		
		final Criteria criteria = sessionFactory.getCurrentSession().createCriteria(SubRespostaQuestao.class);
		criteria.add(Restrictions.eq("idAtividade", subRespostaQuestaoDTO.getIdAtividade()));
		criteria.add(Restrictions.eq("idGrupoQuestao", subRespostaQuestaoDTO.getIdGrupo()));
		criteria.add(Restrictions.eq("idPerfilFormulario", subRespostaQuestaoDTO.getIdPerfil()));
		criteria.add(Restrictions.eq("idQuestao", subRespostaQuestaoDTO.getIdQuestao()));
		criteria.add(Restrictions.eq("idResposta", subRespostaQuestaoDTO.getIdResposta()));
		criteria.add(Restrictions.eq("linha", subRespostaQuestaoDTO.getLinha()));
		criteria.add(Restrictions.eq("ordemQuestao", subRespostaQuestaoDTO.getOrdemQuestao()));
		
		if(subRespostaQuestaoDTO.getIdSubQuestao() != null){
			criteria.add(Restrictions.eq("idSubQuestao", subRespostaQuestaoDTO.getIdSubQuestao()));
		}
		
		if(subRespostaQuestaoDTO.getIdSubResposta() != null){
			criteria.add(Restrictions.eq("idSubResposta", subRespostaQuestaoDTO.getIdSubResposta()));
		}
		
		if(subRespostaQuestaoDTO.getOrdemSubQuestao() != null){
			criteria.add(Restrictions.eq("ordemSubQuestao", subRespostaQuestaoDTO.getOrdemSubQuestao()));
		}
		
		if(subRespostaQuestaoDTO.getOrdemSubResposta() != null){
			criteria.add(Restrictions.eq("ordemSubResposta", subRespostaQuestaoDTO.getOrdemSubResposta()));
		}
		
		return (SubRespostaQuestao) criteria.uniqueResult();
	}

	@Override
	public List<SubRespostaQuestao> obter(final SubRespostaQuestaoDTO subRespostaQuestaoDTO) {
		
		final Criteria criteria = sessionFactory.getCurrentSession().createCriteria(SubRespostaQuestao.class);
		criteria.add(Restrictions.eq("idAtividade", subRespostaQuestaoDTO.getIdAtividade()));
		criteria.add(Restrictions.eq("idGrupoQuestao", subRespostaQuestaoDTO.getIdGrupo()));
		criteria.add(Restrictions.eq("idPerfilFormulario", subRespostaQuestaoDTO.getIdPerfil()));
		criteria.add(Restrictions.eq("idQuestao", subRespostaQuestaoDTO.getIdQuestao()));
		criteria.add(Restrictions.eq("idResposta", subRespostaQuestaoDTO.getIdResposta()));
		criteria.addOrder(Order.asc("ordemQuestao"));
		criteria.addOrder(Order.asc("ordemSubQuestao"));
		criteria.addOrder(Order.asc("ordemSubResposta"));
		criteria.addOrder(Order.asc("linha"));
		
		return criteria.list();
	}

}
