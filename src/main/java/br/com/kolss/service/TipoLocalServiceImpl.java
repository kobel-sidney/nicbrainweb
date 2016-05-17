package br.com.kolss.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.TipoLocal;
import br.com.kolss.model.repository.TipoLocalRepository;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class TipoLocalServiceImpl implements TipoLocalService {
	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	protected TipoLocalRepository repository;

	@Override
	public List<TipoLocal> getTiposLocal() throws ServiceException {
		logger.debug("TipoLocalServiceImpl.getTiposLocal");
		
		return repository.getTiposLocal();
	}

}