package br.com.kolss.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import br.com.kolss.model.entities.RelacionamentoPerfilFormulario;
import br.com.kolss.model.entities.SubQuestao;

@Repository("subQuestaoDao")
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class SubQuestaoDaoImpl implements SubQuestaoDao {
	
	private static final Logger LOGGER = Logger.getLogger(SubQuestaoDaoImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<SubQuestao> obterSubQuestao(Long idRelacionamento) {
		
		Assert.notNull(idRelacionamento,"INFORME UM ID DE RELACIONAMENTO PERFIL DE FORMULARIO");
		
		List<SubQuestao> list = new ArrayList<SubQuestao>();
		try{
			final Criteria criteria = this.sessionFactory.getCurrentSession().createCriteria(SubQuestao.class,
					"subQuestao");
			
			criteria.createAlias("subQuestao.relacionamentoPerflFormulario","rl");
			criteria.createAlias("subQuestao.questao","qt");
			criteria.createAlias("qt.tipoQuestao","tp");
			criteria.createAlias("subQuestao.resposta","rs",JoinType.LEFT_OUTER_JOIN);
			
			criteria.add(Restrictions.eq("rl.id", idRelacionamento));
			criteria.addOrder(Order.asc("ordemPergunta"));
			criteria.addOrder(Order.asc("ordemResposta"));
			
			list = criteria.list();
			
		}catch(Exception ex){
			LOGGER.error("ERRO AO OBETER SUBQUESTAO",ex);
		}
		
		return list;
	}

}
