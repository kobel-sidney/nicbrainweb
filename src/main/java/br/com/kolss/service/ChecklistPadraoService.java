package br.com.kolss.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.ChecklistPadrao;
import br.com.kolss.model.entities.Contratante;


public interface ChecklistPadraoService {

	/**
	 * Obtêm os Checklist Padrão.<br>
	 * 
	 * @param idChecklistPadrao
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	ChecklistPadrao obter(Serializable idChecklistPadrao, Contratante contratante) throws ServiceException;
	
	/**
	 * Obtêm os Checklist Padrão, ordenado por nome.
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<ChecklistPadrao> obterTodos(Contratante contratante) throws ServiceException;
	
	/**
 	 * Retorna os Checklists Padrões disponíveis para o Usuário informado, em
 	 * ordem alfabética do nome do Checklist Padrão.
	 * 
	 * @param idUsuario
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<ChecklistPadrao> obterPorUsuario(Serializable idUsuario) throws ServiceException;
	
	/**
	 * Salva um novo Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 * 
	 * @throws ServiceException
	 */
	void salvar(ChecklistPadrao checklistPadrao) throws ServiceException;
	
	/**
	 * Atualiza o Checklist Padrão
	 * 
	 * @param checklistPadrao
	 * 
	 * @throws ServiceException
	 */
	void atualizar(ChecklistPadrao checklistPadrao) throws ServiceException;
	
	/**
	 * Remove um Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 * 
	 * @throws ServiceException
	 */
	void remover(ChecklistPadrao checklistPadrao) throws ServiceException;
	
	/**
	 * Remove os Checklists Padrão.
	 * 
	 * @param checklistsPadrao
	 * 
	 * @throws ServiceException
	 */
	void remover(Collection<ChecklistPadrao> checklistsPadrao) throws ServiceException;
	
	/**
	 * Remove todos os Checklists Procedimentos associados a um Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 * 
	 * @throws ServiceException
	 */
	void removerAssociacao(ChecklistPadrao checklistPadrao)	throws ServiceException;
	
	/**
	 * Associa os Procedimentos selecionados ao Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 * @param idProcedimentos
	 * 
	 * @throws ServiceException
	 */
	void associarProcedimentos(ChecklistPadrao checklistPadrao,	List<Serializable> idProcedimentos) throws ServiceException;
}
