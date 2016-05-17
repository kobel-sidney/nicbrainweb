package br.com.kolss.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.ChecklistPadrao;
import br.com.kolss.model.entities.Segmento;


public interface SegmentoService {
	
	/**
	 * Retorna todos os segmentos cadastrados no sistema
	 * 
	 * @return.
	 * 
	 * @throws ServiceException
	 */
	public List<Segmento> buscarTodos() throws ServiceException;
	
	/**
	 * Retorna todos os segmentos associados ao Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Segmento> getSegmentosAssociados(ChecklistPadrao checklistPadrao)
			throws ServiceException;

	/**
	 * Remove todas as associações dos Segmentos com o Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 * 
	 * @throws ServiceException
	 */
	void removerAssociacao(ChecklistPadrao checklistPadrao)
			throws ServiceException;
	
	/**
	 * Associa os Segmentos escolhidos ao Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 * @param idSegmentos
	 * 
	 * @throws ServiceException
	 */
	void associarSegmentos(ChecklistPadrao checklistPadrao,
			Collection<Serializable> idSegmentos) throws ServiceException;

	public void salvar(Segmento model);

	public void atualizar(Segmento model);

	public void remover(Segmento model);
	
}
