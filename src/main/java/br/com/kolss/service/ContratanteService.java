package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Usuario;

/**
 * Serviço responsável pelas operações para os Contratantes
 * 
 * @return
 * 
 * @throws ServiceException
 */
public interface ContratanteService {

	void salvar(Contratante contratante) throws ServiceException;

	void atualizar(Contratante entity) throws ServiceException;

	void remover(Contratante entity) throws ServiceException;

	Contratante obter(Long id) throws ServiceException;

	List<Contratante> obterTodos() throws ServiceException;

	Contratante obterPorUsuario(Usuario usuario) throws ServiceException;
}