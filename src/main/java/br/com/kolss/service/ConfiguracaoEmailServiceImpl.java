package br.com.kolss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.ConfiguracaoEmail;
import br.com.kolss.model.repository.ConfiguracaoEmailRepository;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class ConfiguracaoEmailServiceImpl implements ConfiguracaoEmailService {
	@Autowired
	private ConfiguracaoEmailRepository configEmailRepository;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvar(ConfiguracaoEmail configEmail) throws ServiceException {
		configEmailRepository.salvar(configEmail);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void atualizar(ConfiguracaoEmail configEmail) throws ServiceException {
		configEmailRepository.atualizar(configEmail);
	}

}