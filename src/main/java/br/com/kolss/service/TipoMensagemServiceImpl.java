package br.com.kolss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.model.entities.TipoMensagem;
import br.com.kolss.model.repository.DadosMestresRepository;

@Service
public class TipoMensagemServiceImpl extends DadosMestresServiceImpl<TipoMensagem> implements TipoMensagemService {

	@Autowired
	public TipoMensagemServiceImpl(DadosMestresRepository<TipoMensagem> repository) {
		super(repository, TipoMensagem.class);
	}

}
