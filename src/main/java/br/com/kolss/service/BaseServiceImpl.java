package br.com.kolss.service;

import br.com.kolss.exception.NicBrainException;
import br.com.kolss.model.repository.BaseRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;

/**
 * Created by weverton on 15/05/16.
 */
@Service
public class BaseServiceImpl implements BaseService {

    @Autowired
    private BaseRepository baseRepository;

    @Override
    public <T> T prepareForEdit(Class<T> entityClass, Serializable key,
                                String[] propertiesForJoin, String[] propertiesForSelect) throws NicBrainException {

        Logger logger = Logger.getLogger(BaseServiceImpl.class);

        try {
            logger.debug("Entrando metodo br.com.pfm.model.service.IBaseService#" +
                    "prepareForEdit(Class<T> entityClass, Serializable key, " +
                    "String[] propertiesForJoin, String[] propertiesForSelect)");
            return baseRepository.getByPK(entityClass, key,
                    propertiesForJoin, propertiesForSelect);
        } catch (Exception e) {

            String msg = "Nao foi possivel preparar para edicao o objeto : " + e.toString();
            logger.error(msg, e);
            throw new NicBrainException(e);
        }
    }
}
