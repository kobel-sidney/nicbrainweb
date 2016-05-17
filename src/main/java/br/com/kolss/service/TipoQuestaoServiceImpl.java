package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TipoQuestao;
import br.com.kolss.model.repository.TipoQuestaoRepository;

@Service("TipoQuestaoService")
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class TipoQuestaoServiceImpl implements TipoQuestaoService {

	@Autowired
	private TipoQuestaoRepository repository;

	@Override
	public List<TipoQuestao> obterTodos(Contratante contratante) {
		return repository.obterTodos(contratante);
	}

	@Override
	public TipoQuestao obter(Serializable idTipoQuestao) {
		return repository.obter(idTipoQuestao);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void salvar(TipoQuestao tipoQuestao) {
		repository.salvar(tipoQuestao);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void atualizar(TipoQuestao tipoQuestao) {
		repository.atualizar(tipoQuestao);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void remover(TipoQuestao tipoQuestao) {
		repository.remover(tipoQuestao);
	}

}
