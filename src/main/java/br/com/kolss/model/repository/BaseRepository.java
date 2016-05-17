package br.com.kolss.model.repository;

import java.io.Serializable;

/**
 * Created by weverton on 15/05/16.
 */
public interface BaseRepository {

    /**
     *
     * @param entityClass
     * @param key
     * @param propertiesForJoin
     * @param propertiesForSelect
     * @param <T>
     * @return
     */
    public <T> T getByPK(Class<T> entityClass, Serializable key, String[] propertiesForJoin,
                         String[] propertiesForSelect);
}
