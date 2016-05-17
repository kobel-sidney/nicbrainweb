package br.com.kolss.service;

import br.com.kolss.model.entities.Atividade;

public interface AtividadeService {

	Atividade obter(Long id);
	
	boolean hasAtividadeFormularioComQuestao(Long idAtividade);

}
