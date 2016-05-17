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

@Repository("relacionamentoPerfilFormularioDao")
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class RelacionamentoPerfilFormularioDaoImpl implements
		RelacionamentoPerfilFormularioDao {
	
	private static final Logger LOGGER = Logger.getLogger(RelacionamentoPerfilFormularioDaoImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<RelacionamentoPerfilFormulario> obterRelacionamentoPorPerfil(
			final Long idPerfil) {
		
		Assert.notNull(idPerfil,"INFORME UM ID DE PERFIL DE FORMULARIO");
		List<RelacionamentoPerfilFormulario> list = new ArrayList<RelacionamentoPerfilFormulario>();
		try{
			final Criteria criteria = this.sessionFactory.getCurrentSession().createCriteria(RelacionamentoPerfilFormulario.class,
					"relacionamento");
			
			criteria.createAlias("relacionamento.perfilFormulario","pf");
			criteria.createAlias("relacionamento.grupoQuestao","gr");
			criteria.createAlias("relacionamento.questao","qt");
			criteria.createAlias("qt.tipoQuestao","tp");
			criteria.createAlias("relacionamento.resposta","rs",JoinType.LEFT_OUTER_JOIN);
			
			criteria.add(Restrictions.eq("pf.id", idPerfil));
			criteria.addOrder(Order.asc("ordemGrupo"));
			criteria.addOrder(Order.asc("ordemPergunta"));
			criteria.addOrder(Order.asc("ordemResposta"));
			
			list = criteria.list();
			
		}catch(Exception ex){
			LOGGER.error("ERRO AO OBETER RELACIONAMENTO PERFIL FORMULARIO",ex);
		}
		
		return list;
	}

}
