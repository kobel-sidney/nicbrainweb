package br.com.kolss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.repository.AtividadeRepository;


@Service
public class AtividadeServiceImpl implements AtividadeService {
	
	@Autowired
	private AtividadeRepository atividadeRepository;

	@Override
	public Atividade obter(Long idAtividade) {
		return atividadeRepository.obter(idAtividade);
	}

	@Override
	public boolean hasAtividadeFormularioComQuestao(Long idAtividade) {
		return atividadeRepository.hasAtividadeFormularioComQuestao(idAtividade);
	}

}
