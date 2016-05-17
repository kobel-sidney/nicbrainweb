package br.com.kolss.model.repository;

import java.io.Serializable;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.ConfiguracaoEmail;
import br.com.kolss.model.entities.Contratante;


/**
 * Componente responsável por obter as configurações de envio de mensagens dos
 * Contratantes cadastrados no sistema.
 */
@Repository
@Transactional(readOnly = true)
public class ConfigContratanteRepositoryImpl implements ConfigContratanteRepository {

	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	/**
	 * Obtém as configurações de envio de email do Contratante.
	 *  
	 * @param idContratante
	 * 
	 * @return
	 */
	@Override
	public ConfiguracaoEmail getConfiguracaoEmail(Serializable idContratante) {
		logger.debug("EmailconfigContratante.getConfiguracaoEmail");
		
		Session currentSession = this.sessionFactory.getCurrentSession();
		Criteria criteria = currentSession.createCriteria(Contratante.class);
		
		criteria.add(Restrictions.eq("id", idContratante));
		ProjectionList projection = Projections.projectionList();
    	projection.add(Projections.property("configuracaoEmail"));
    	
    	ConfiguracaoEmail configuracaoEmail = null;
    	Contratante contratante = (Contratante) criteria.uniqueResult();
    	
    	if (contratante != null) {
    		configuracaoEmail = contratante.getConfiguracaoEmail();
    	}
    	
    	return configuracaoEmail;
    	
	}
	
}
