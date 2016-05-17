package br.com.kolss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.TipoUsuario;
import br.com.kolss.model.repository.DadosMestresRepository;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class TipoUsuarioServiceImpl extends	DadosMestresServiceImpl<TipoUsuario> implements
		DadosMestresService<TipoUsuario> {

	@Autowired
	public TipoUsuarioServiceImpl(DadosMestresRepository<TipoUsuario> dadosMestresRepository) {
		super(dadosMestresRepository, TipoUsuario.class);
	}

}
