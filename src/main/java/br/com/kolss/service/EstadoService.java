package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Estado;

public interface EstadoService {
	
	List<Estado> obterPorPais(Long idPais) throws ServiceException;
	
	List<Estado> obterTodos() throws ServiceException;

	Estado obter(Long id);

	void atualizar(Estado model);

	void remover(Estado model);

	void salvar(Estado model);
}
