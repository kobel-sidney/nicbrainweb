package br.com.kolss.service;

import br.com.kolss.exception.NicBrainException;

import java.io.Serializable;

/**
 * Created by weverton on 15/05/16.
 */
public interface BaseService {

    public <T> T prepareForEdit(Class<T> entityClass, Serializable key, String[] propertiesForJoin,
                                String[] propertiesForSelect) throws NicBrainException;
}
