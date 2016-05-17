package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Estado;
import br.com.kolss.model.entities.Municipio;

public interface MunicipioService {

	public Municipio obter(Long id) throws ServiceException;

	public List<Municipio> obterTodos() throws ServiceException;

	List<Municipio> obterPorEstado(Estado id) throws ServiceException;

	public void salvar(Municipio model);

	public void atualizar(Municipio model);

	public void remover(Municipio model);

}
