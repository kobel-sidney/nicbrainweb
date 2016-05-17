package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.dto.RetornoStatusDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Status;


public interface StatusService {
	
	/**
	 * Retorna o Status pelo seu ID, contendo todos os seus atributos 
	 * populados.
	 * 
	 * @param idStatus
	 * 
	 * @return
	 */
	public Status obter(Serializable idStatus);
	
	/**
	 * Retorna todos os status que podem ser alterados dentro de uma Atividade
	 * ou AtividadeOcorrencia.
	 * 
	 * @return
	 */
	List<Status> getStatusAlteraveis() throws ServiceException;
	
	/**
	 * Retorna todos os status que podem ser consultados dentro Checklist
	 *  
	 * @return
	 */
	List<Status> getAllChecklistStatus() throws ServiceException;

	public List<Status> obterTodos();

	public void remover(Status status);

	public void atualizar(Status status);

	public void salvar(Status status);

	public RetornoStatusDTO obterTodosMobile(String idUsuario);
	
}
