package br.com.kolss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.model.entities.TipoEnvio;
import br.com.kolss.model.repository.DadosMestresRepository;


@Service
public class TipoEnvioServiceImpl extends DadosMestresServiceImpl<TipoEnvio> implements TipoEnvioService {

	
	@Autowired
	public TipoEnvioServiceImpl(DadosMestresRepository<TipoEnvio> dadosMestresRepository) {
		super(dadosMestresRepository, TipoEnvio.class);
	}

}
