package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TipoServico;

public interface TipoServicoService {

	void atualizar(TipoServico tipoServico) throws ServiceException;

	void salvar(TipoServico tipoServico) throws ServiceException;

	void remover(TipoServico tipoServico) throws ServiceException;

	List<TipoServico> obterTodos(Contratante contratante) throws ServiceException;

	TipoServico obter(Serializable id) throws ServiceException;

	List<TipoServico> obterTodos() throws ServiceException;
}
