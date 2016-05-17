package br.com.kolss.model.dao;

import br.com.kolss.exception.DaoException;


public interface ChecklistMensagemDao {

	/**
	 * Verifica se o Local a ser pesquisado contém algum Alerta de Checklist.
	 * 
	 * @param idLocal
	 * @param ativo
	 * 
	 * @return
	 * 
	 * @throws DaoException
	 */
	boolean existeAlertaPorLocal(Integer idLocal, boolean ativo)
			throws DaoException;
	
	boolean existeMensagemPoChecklist(Integer idChecklist)
			throws DaoException;
	
}
