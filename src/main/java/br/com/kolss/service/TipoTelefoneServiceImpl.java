package br.com.kolss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.model.entities.TipoTelefone;
import br.com.kolss.model.repository.DadosMestresRepository;


@Service
public class TipoTelefoneServiceImpl extends DadosMestresServiceImpl<TipoTelefone> implements TipoTelefoneService {

	@Autowired
	public TipoTelefoneServiceImpl(DadosMestresRepository<TipoTelefone> dadosMestresRepository) {
		super(dadosMestresRepository, TipoTelefone.class);
	}

}
