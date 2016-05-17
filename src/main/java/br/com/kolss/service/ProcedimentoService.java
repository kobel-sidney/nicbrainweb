package br.com.kolss.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.ChecklistPadrao;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Procedimento;
import br.com.kolss.model.entities.ProcedimentoMensagem;

public interface ProcedimentoService {

	/**
	 * Retorna a Ocorrência.
	 * 
	 * @param idProcedimento
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	Procedimento obter(Serializable idProcedimento) throws ServiceException;
	
	/**
	 * Retorna os Procedimentos cadastrados, em ordem alfabética do nome.
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Procedimento> obterTodos(Contratante contratante) throws ServiceException;
	
	/**
	 * Retorna os Procedimentos disponíveis para o Usuário informado, em ordem
	 * alfabética do nome do Procedimento.
	 * 
	 * @param idUsuario
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Procedimento> obterPorUsuario(Serializable idUsuario)
			throws ServiceException;
	
	/**
	 * Retorna todos os Procedimentos já associados com o Checklist Padrão
	 * selecionado.<br>
	 * Ordenado pela ordem do procedimento.
	 * 
	 * @param checklistPadrao
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Procedimento> obterAssociadosChecklist(
			ChecklistPadrao checklistPadrao) throws ServiceException;

	/**
	 * Retorna todos os Procedimentos disponíveis para o Usuário inforamdo para
	 * associar com o Checklist Padrão escolhido.<br>
	 * Ordenado pela ordem do nome do procedimento.
	 * 
	 * @param checklistPadrao
	 * @param idUsuario
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Procedimento> obterDisponiveisPorUsuario(
			ChecklistPadrao checklistPadrao, Serializable idUsuario)
					throws ServiceException;
	
	/**
	 * Salva um novo procedimento.
	 * 
	 * @param procedimento
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	Serializable salvar(Procedimento procedimento) throws ServiceException;
	
	/**
	 * Salva um novo procedimento.
	 * 
	 * @param procedimento
	 * @param procedimentosMensagens
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	Serializable salvar(Procedimento procedimento,
			Collection<ProcedimentoMensagem> procedimentosMensagens)
					throws ServiceException;
	
	/**
	 * Atualiza um procedimento.
	 * 
	 * @param procedimento
	 * 
	 * @throws ServiceException
	 */
	void atualizar(Procedimento procedimento) throws ServiceException;
	
	/**
	 * Atualiza um procedimento.
	 * 
	 * @param procedimento
	 * @param procedimentosMensagens
	 * 
	 * @throws ServiceException
	 */
	void atualizar(Procedimento procedimento,
			Collection<ProcedimentoMensagem> procedimentosMensagens)
					throws ServiceException;
	
	/**
	 * Remove um procedimento.
	 * 
	 * @param procedimento
	 *
	 * @throws ServiceException
	 */
	void remover(Procedimento procedimento) throws ServiceException;
	
}
