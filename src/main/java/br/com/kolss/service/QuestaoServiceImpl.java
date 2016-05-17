package br.com.kolss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Questao;
import br.com.kolss.model.entities.TipoQuestao;
import br.com.kolss.model.repository.QuestaoRepository;

@Service("QuestaoService")
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class QuestaoServiceImpl implements QuestaoService {

	@Autowired
	private QuestaoRepository repository;

	@Override
	public List<Questao> obterTodos(Contratante contratante) {
		
		if(contratante==null || contratante.getId()==null){
			throw new ServiceException("Contratante inválido");
		}
		
		return repository.obterTodos(contratante);
	}

	@Override
	public List<TipoQuestao> obterTipoQuestao(Contratante contratante) {
		
		if(contratante==null || contratante.getId()==null){
			throw new ServiceException("Contratante inválido");
		}
		
		return repository.obterTipoQuestao(contratante);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void salvar(Questao questao) {
		
		if(questao==null){
			throw new ServiceException("Questao inválido");
		}
		
		repository.salvar(questao);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void atualizar(Questao questao) {
		
		if(questao==null){
			throw new ServiceException("Questao inválido");
		}
		
		repository.atualizar(questao);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void remover(Questao questao) {
		if(questao==null){
			throw new ServiceException("Questao inválido");
		}
		
		repository.remover(questao);
	}

}
