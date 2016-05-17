package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Resposta;

public interface RespostaService {

	List<Resposta> obterTodos(Contratante contratante) throws ServiceException;

	void salvar(Resposta resposta) throws ServiceException;

	void atualizar(Resposta resposta) throws ServiceException;

	void remover(Resposta resposta) throws ServiceException;

}
