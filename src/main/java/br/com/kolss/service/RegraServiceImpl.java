package br.com.kolss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.Regra;
import br.com.kolss.model.repository.DadosMestresRepository;
import br.com.kolss.model.repository.RegraRepository;

@Service
@Transactional
public class RegraServiceImpl implements RegraService {

	@Autowired
	private RegraRepository regraRepository;
	
	@Override
	public List<Regra> obterRegras() {
		return regraRepository.obterRegras();
	}

	
}
