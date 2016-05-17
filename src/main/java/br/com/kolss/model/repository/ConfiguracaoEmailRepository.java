package br.com.kolss.model.repository;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.ConfiguracaoEmail;

@Repository
public class ConfiguracaoEmailRepository extends AbstractRepository {

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Salva a configuracao de email
	 * 
	 * @param configEmail
	 */
	public void salvar(ConfiguracaoEmail configEmail) {
		logger.debug("ConfiguracaoEmailRepository.salvar");

		Session session = sessionFactory.getCurrentSession();
		session.save(configEmail);
	}
	
	/**
	 * Atualiza a configuracao de email
	 * 
	 * @param configEmail
	 */
	public void atualizar(ConfiguracaoEmail configEmail) {
		logger.debug("ConfiguracaoEmailRepository.atualizar");

		Session session = sessionFactory.getCurrentSession();
		session.update(configEmail);
	}

}