package br.com.kolss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.model.entities.TipoEquipamento;
import br.com.kolss.model.repository.DadosMestresRepository;
import br.com.kolss.service.DadosMestresServiceImpl;


@Service
public class TipoEquipamentoServiceImpl extends DadosMestresServiceImpl<TipoEquipamento> implements
		TipoEquipamentoService {

	@Autowired
	public TipoEquipamentoServiceImpl(DadosMestresRepository<TipoEquipamento> dadosMestresRepository) {
		super(dadosMestresRepository, TipoEquipamento.class);
	}

}
