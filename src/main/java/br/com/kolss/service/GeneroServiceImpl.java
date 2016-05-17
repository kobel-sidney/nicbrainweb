package br.com.kolss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.model.entities.Genero;
import br.com.kolss.model.repository.DadosMestresRepository;


@Service
public class GeneroServiceImpl extends DadosMestresServiceImpl<Genero> implements GeneroService {

	@Autowired 
	public GeneroServiceImpl(DadosMestresRepository<Genero> dadosMestresRepository) {
		super(dadosMestresRepository, Genero.class);
	}


}
