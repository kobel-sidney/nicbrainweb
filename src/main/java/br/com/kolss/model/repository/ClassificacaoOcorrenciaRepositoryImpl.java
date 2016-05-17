package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.ClassificacaoOcorrencia;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TipoClassificacao;


@Repository
@Transactional(readOnly = true)
public class ClassificacaoOcorrenciaRepositoryImpl implements ClassificacaoOcorrenciaRepository{
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	/**
	 * Retorna a Classificação Ocorrência pelo seu ID, contendo todos os seus
	 * atributos populados.
	 * 
	 * @param idClassificacaoOcorrencia
	 * 
	 * @return
	 */
	@Override
	public ClassificacaoOcorrencia obter(Serializable idClassificacaoOcorrencia) {
		logger.debug("ClassificacaoOcorrenciaRepository.obter(Serializable)");
		
		Session session = sessionFactory.getCurrentSession();
		return (ClassificacaoOcorrencia) session.load(ClassificacaoOcorrencia.class, idClassificacaoOcorrencia);
	}
	
	/**
	 * Retorna a Classificação Ocorrência pela sua descrição, contendo todos os
	 * seus atributos populados.
	 * 
	 * @param nomeClassificacaoOcorrencia
	 * @param contratante 
	 * 
	 * @return
	 */
	@Override
	public ClassificacaoOcorrencia obterPorNome(String nomeClassificacaoOcorrencia, Contratante contratante) {
		logger.debug("ClassificacaoOcorrenciaRepository.obterPorNome(String)");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ClassificacaoOcorrencia.class);
		criteria.createAlias("tiposClassificacoes", "tiposClassificacoes");
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		criteria.add(Restrictions.ilike("nome",	nomeClassificacaoOcorrencia,MatchMode.EXACT));
		
		return (ClassificacaoOcorrencia) criteria.uniqueResult();
	}
	
	/**
	 * Retorna todas as Classificações Ocorrência cadastrados no sistema.
	 * 
	 * @return
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<ClassificacaoOcorrencia> obterTodos(Contratante contratante) {
		logger.debug("ClassificacaoOcorrenciaRepository.obterTodos");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ClassificacaoOcorrencia.class);
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		criteria.addOrder(Order.asc("nome"));
		
		return criteria.list();
	}
	
	/**
	 * Retorna todas as Classificações Ocorrência cadastrados no sistema.
	 * 
	 * @return
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<TipoClassificacao> obterTipoClassificacoesOcorrenciasPorIdClasContrante(Long idGravidade,Contratante contratante) {
		logger.debug("ClassificacaoOcorrenciaRepository.getTipoClassificacoes");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TipoClassificacao.class);
		criteria.add(Restrictions.eq("classificacaoOcorrencia.id" , idGravidade));
		criteria.add(Restrictions.eq("contratante.id",contratante.getId()));
		criteria.addOrder(Order.asc("nome"));
		
		return criteria.list();
	}


}
