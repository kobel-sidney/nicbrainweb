package br.com.kolss.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Estado;
import br.com.kolss.model.entities.Municipio;
import br.com.kolss.model.repository.MunicipioRepositoryImpl;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class MunicipioServiceImpl implements MunicipioService {
	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	protected MunicipioRepositoryImpl repository;

	@Autowired
	private EstadoService estadoService;

	@Override
	public Municipio obter(Long id) throws ServiceException {
		return (Municipio) repository.obter(id);
	}

	@Override
	public List<Municipio> obterTodos() throws ServiceException {
		logger.debug("BbMunicipioServiceImpl.getMunicipios");
		return repository.obterTodos();
	}

	@Override
	public List<Municipio> obterPorEstado(Estado estado) throws ServiceException {
		if (estado == null || estado.getId() == null || estado.getId().equals(0L)) {
			throw new ServiceException("ID do estado inválido.");
		}
		return repository.obterPorEstado(estado);
	}

	@Override
	public void salvar(Municipio municipio) {
		 repository.salvar(municipio);
	}

	@Override
	public void atualizar(Municipio municipio) {
		 repository.atualizar(municipio);
	}

	@Override
	public void remover(Municipio municipio) {
		 repository.remover(municipio);		
	}

}
