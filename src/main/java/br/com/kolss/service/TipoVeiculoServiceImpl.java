package br.com.kolss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.TipoVeiculo;
import br.com.kolss.model.repository.DadosMestresRepository;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class TipoVeiculoServiceImpl extends DadosMestresServiceImpl<TipoVeiculo> implements TipoVeiculoService {

	@Autowired
	public TipoVeiculoServiceImpl(DadosMestresRepository<TipoVeiculo> dadosMestresRepository) {
		super(dadosMestresRepository, TipoVeiculo.class);
	}

}
