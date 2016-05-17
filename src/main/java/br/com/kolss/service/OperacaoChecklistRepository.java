package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.OperacaoChecklist;


public interface OperacaoChecklistRepository {

	/**
	 * Método que Busca Operações de Acordo com um Determinado Checklist
	 * 
	 * @param checklist
	 * 
	 * @return
	 */
	public List<OperacaoChecklist> getOperacoesPorChecklist(Checklist checklist)
			throws ServiceException;
	
	/**
	 * Salva um novo Operação Checklist.
	 * 
	 * @param operacaoChecklist
	 */
	public void salvarOperacao(OperacaoChecklist operacaoChecklist);
	
}
