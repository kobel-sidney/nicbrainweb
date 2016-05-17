package br.com.kolss.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.TipoEndereco;
import br.com.kolss.model.repository.TipoEnderecoRepository;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class TipoEnderecoServiceImpl implements TipoEnderecoService {

	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	protected TipoEnderecoRepository repository;

	@Override
	public List<TipoEndereco> obterTodos() throws ServiceException {
		logger.debug("TipoEnderecoServiceImpl.getTiposEnderecos");
		return repository.getTiposEnderecos();
	}

	@Override
	public TipoEndereco buscar(Long id) {
		return repository.buscar(id);
	}

	@Override
	public void remover(TipoEndereco tipoEndereco) {
		repository.remover(tipoEndereco);
	}

	@Override
	public void salvar(TipoEndereco tipoEndereco) {
		repository.salvar(tipoEndereco);
	}

	@Override
	public void atualizar(TipoEndereco tipoEndereco) {
		repository.atualizar(tipoEndereco);
	}

}