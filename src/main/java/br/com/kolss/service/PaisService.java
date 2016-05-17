package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Pais;

public interface PaisService {

	public List<Pais> obterTodos() throws ServiceException;
	public void salvar(Pais pais);
	public void atualizar(Pais pais);
	public void remover(Pais pais);
	
}
