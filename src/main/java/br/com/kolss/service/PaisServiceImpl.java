package br.com.kolss.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Pais;
import br.com.kolss.model.repository.PaisRepository;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class PaisServiceImpl implements PaisService {
	
	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	protected PaisRepository repository;

	@Override
	public List<Pais> obterTodos() throws ServiceException {
		logger.debug("PaisServiceImpl.getPaises");
		return repository.obterTodos();
	}

	@Override
	public void salvar(Pais pais) {
		logger.debug("PaisServiceImpl.salvar");
		repository.salvar(pais);		
	}

	@Override
	public void atualizar(Pais pais) {
		logger.debug("PaisServiceImpl.atualizar");
		repository.atualizar(pais);	
	}

	@Override
	public void remover(Pais pais) {
		logger.debug("PaisServiceImpl.remover");
		repository.remover(pais);	
	}

}