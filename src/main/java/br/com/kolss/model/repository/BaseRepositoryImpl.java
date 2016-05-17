package br.com.kolss.model.repository;

import br.com.kolss.util.HibernateUtils;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;

/**
 * Created by weverton on 15/05/16.
 */
@Repository
@Transactional(readOnly=false)
public class BaseRepositoryImpl implements BaseRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public <T> T getByPK(Class<T> entityClass, Serializable key,
                         String[] propertiesForJoin, String[] propertiesForSelect) {

        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(entityClass);
        crit.add(Restrictions.idEq(key));

        if (propertiesForJoin != null) {
            for (String prop : propertiesForJoin) {
                crit.setFetchMode(prop, FetchMode.JOIN);
            }
        }
        if (propertiesForSelect != null) {
            for (String prop : propertiesForSelect) {
                crit.setFetchMode(prop, FetchMode.SELECT);
            }
        }

        T result = (T)crit.uniqueResult();

        if (propertiesForSelect != null) {
            HibernateUtils.initializeProperties(result, propertiesForSelect);
        }

        return result;
    }
}
