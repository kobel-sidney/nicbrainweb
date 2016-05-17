package br.com.kolss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.GrupoQuestao;
import br.com.kolss.model.repository.GrupoQuestaoRepository;

@Service("GrupoQuestaoService")
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class GrupoQuestaoServiceImpl implements GrupoQuestaoService {

	@Autowired
	private GrupoQuestaoRepository grupoQuestaoRepository;

	@Override
	public List<GrupoQuestao> obterTodos(Contratante contratante) {
		return grupoQuestaoRepository.obterTodos(contratante);
	}

	@Override
	public void obter(GrupoQuestao grupoQuestao) {
		grupoQuestaoRepository.obter(grupoQuestao.getId());

	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvar(GrupoQuestao grupoQuestao) {
		grupoQuestaoRepository.salvar(grupoQuestao);

	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void atualizar(GrupoQuestao grupoQuestao) {
		grupoQuestaoRepository.atualizar(grupoQuestao);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void remover(GrupoQuestao grupoQuestao) {
		grupoQuestaoRepository.remover(grupoQuestao);
	}

}
