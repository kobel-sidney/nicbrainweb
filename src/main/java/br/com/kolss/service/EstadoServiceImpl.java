package br.com.kolss.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Estado;
import br.com.kolss.model.repository.EstadoRepository;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class EstadoServiceImpl implements EstadoService {
	
	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	protected EstadoRepository estadoRepository;

	@Override
	public List<Estado> obterTodos() throws ServiceException {
		logger.debug("EstadoServiceImpl.getEstados");
		return estadoRepository.obterTodos();
	}

	@Override
	public List<Estado> obterPorPais(Long idPais) throws ServiceException {
		logger.debug("EstadoServiceImpl.obterPorPais()");
		return estadoRepository.obterPorPais(idPais);
	}

	@Override
	public Estado obter(Long id) {
		logger.debug("EstadoServiceImpl.buscar()");
		return estadoRepository.buscar(id);
	}

	@Override
	public void atualizar(Estado model) {
		logger.debug("EstadoServiceImpl.atualizar()");
		estadoRepository.atualizar(model);
	}

	@Override
	public void remover(Estado model) {
		logger.debug("EstadoServiceImpl.remover()");
		estadoRepository.remover(model);		
	}

	@Override
	public void salvar(Estado model) {
		logger.debug("EstadoServiceImpl.salvar()");
		estadoRepository.salvar(model);
	}

}