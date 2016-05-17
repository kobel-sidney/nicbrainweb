package br.com.kolss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Resposta;
import br.com.kolss.model.repository.RespostaRepository;

@Service("RespostaService")
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class RespostaServiceImpl implements RespostaService {

	@Autowired
	private RespostaRepository respostaRepository;

	@Override
	public List<Resposta> obterTodos(Contratante contratante) {
		if(contratante==null || contratante.getId()==null){
			throw new ServiceException("Contratante inválido");
		}
		return respostaRepository.obterTodos(contratante);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void salvar(Resposta resposta) {
		respostaRepository.salvar(resposta);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void atualizar(Resposta resposta) {
		respostaRepository.atualizar(resposta);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void remover(Resposta resposta) {
		respostaRepository.remover(resposta);
	}

}
