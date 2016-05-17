package br.com.kolss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.model.entities.TipoPessoa;
import br.com.kolss.model.repository.DadosMestresRepository;

@Service
public class TipoPessoaServiceImpl extends DadosMestresServiceImpl<TipoPessoa>implements TipoPessoaService {

	
	@Autowired
	public TipoPessoaServiceImpl(DadosMestresRepository<TipoPessoa> dadosMestresRepository) {
		super(dadosMestresRepository, TipoPessoa.class);
	}

}
