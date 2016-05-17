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

import br.com.kolss.model.entities.GravidadeOcorrencia;


@Repository
@Transactional(readOnly = true)
public class GravidadeOcorrenciaRepository {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	/**
	 * Retorna a Gravidade Ocorrência pelo seu ID, contendo todos os seus
	 * atributos populados.
	 * 
	 * @param idGravidadeOcorrencia
	 * 
	 * @return
	 */
	public GravidadeOcorrencia find(Serializable idGravidadeOcorrencia) {
		logger.debug("GravidadeOcorrenciaRepository.find(Serializable)");
		
		Session session = sessionFactory.getCurrentSession();
		return (GravidadeOcorrencia) session.load(
				GravidadeOcorrencia.class, idGravidadeOcorrencia);
	}
	
	/**
	 * Retorna a Gravidade Ocorrência pela sua descrição, contendo todos os
	 * seus atributos populados.
	 * 
	 * @param nomeGravidadeOcorrencia
	 * 
	 * @return
	 */
	public GravidadeOcorrencia obter(String nomeGravidadeOcorrencia) {
		logger.debug("GravidadeOcorrenciaRepository.find(String)");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(GravidadeOcorrencia.class);
		criteria.add(Restrictions.ilike("nome", nomeGravidadeOcorrencia,
				MatchMode.EXACT));
		
		return (GravidadeOcorrencia) criteria.uniqueResult();
	}
	
	/**
	 * Retorna todas as Gravidades Ocorrências cadastrados no sistema.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<GravidadeOcorrencia> obterTodos() {
		logger.debug("GravidadeOcorrenciaRepository.getGravidadesOcorrencias");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(GravidadeOcorrencia.class);
		criteria.addOrder(Order.asc("nome"));
		
		return criteria.list();
	}
	
}
