package br.com.kolss.util;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class HibernateUtil {
	
	/* 
	 * FIXME: remover esta classe!
	 * WARN  (AutowiredAnnotationBeanPostProcessor.java:336) - Autowired 
	 * annotation is not supported on static fields: 
	 * private static org.hibernate.SessionFactory br.com.kolss.util.HibernateUtil.sessionFactory 
	 */
	@Autowired
	private static SessionFactory sessionFactory;
	
	private static Logger logger = Logger.getLogger(HibernateUtil.class);
	
	
	/** Método construtor privado */
	private HibernateUtil() {
	}
	
	public static void setSessionFactory(SessionFactory sessionFactory) {
		HibernateUtil.sessionFactory = sessionFactory;
		logger.debug("HibernateUtil.setSessionFactory: " + sessionFactory);
	}
	
	/**
	 * Retorna a SessionFactory.
	 * 
	 * @return
	 */
	public static SessionFactory getSessionFactory() {
		logger.debug("HibernateUtil.getSessionFactory: " + sessionFactory);
		return sessionFactory;
	}

	/**
	 * Retorna a sessão corrente.
	 * 
	 * @return
	 */
	public static Session getCurrentSession() {
		Session session = sessionFactory.getCurrentSession();
		logger.debug("HibernateUtil.getCurrentSession: " + session);
		if (session != null) {
			logger.debug("HibernateUtil.getCurrentSession.session.statistics: "
					+ session.getStatistics());
		}
		return session;
	}
	
}
