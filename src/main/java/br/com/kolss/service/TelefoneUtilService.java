package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TelefoneUtil;

/**
 * Serviço responsável pelo TelefoneUtil
 */
public interface TelefoneUtilService {

	List<TelefoneUtil> obterTodos(Contratante contratante) throws ServiceException;
	void remover(TelefoneUtil telefoneUtil);
	void atualizar(TelefoneUtil telefoneUtil);
	void salvar(TelefoneUtil telefoneUtil);
}
