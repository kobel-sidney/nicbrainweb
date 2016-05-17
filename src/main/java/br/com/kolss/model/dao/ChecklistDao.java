package br.com.kolss.model.dao;

import java.util.Date;
import java.util.List;

import br.com.kolss.exception.DaoException;
import br.com.kolss.model.entities.Checklist;

public interface ChecklistDao {
	
	
	/**
	 *Inicio: Novos metodos
	 */
	List<Checklist> listarChecklistEmAberto(Integer idEvento, Integer idPessoa, Integer idStatus, Date dataInicio) throws DaoException;
	
	
	/**
	 * Obter todos os checklists em aberto.
	 * 
	 * @param filtroIdEvento
	 * @param filtroIdLocal
	 * @param filtroIdResponsavel
	 * @param filtroIddResponsavelSuperior
	 * @param filtroIdStatus
	 * @param filtroDataHoraInicio
	 * 
	 * @return
	 * 
	 * @throws DaoException
	 */
	List<Checklist> listarChecklistEmAberto(Integer filtroIdEvento,
			Integer filtroIdLocal, Integer filtroIdResponsavel,
			Integer filtroIddResponsavelSuperior, Integer filtroIdStatus,
			Date filtroDataHoraInicio) throws DaoException;
	
	/**
	 * Obter todos os checklists.
	 * 
	 * @param filtroIdEvento
	 * @param filtroIdLocal
	 * @param filtroIdResponsavel
	 * @param filtroIddResponsavelSuperior
	 * @param filtroIdStatus
	 * @param filtroDataHoraInicio
	 * 
	 * @return
	 * 
	 * @throws DaoException
	 */
	List<Checklist> listarAllChecklist(Integer filtroIdEvento,
			Integer filtroIdLocal, Integer filtroIdResponsavel,
			Integer filtroIddResponsavelSuperior, Integer filtroIdStatus,
			Date filtroDataHoraInicio) throws DaoException;

	
	List<Checklist> listarTotalChecklistPorLocal(Date dateFrom, Date dateTo) throws DaoException;
	
	List<Checklist> listarChecklistPorLocal(Integer idLocal, Date dateFrom, Date dateTo)
			throws DaoException;
	
	public List<Checklist> getChecklistsParaRastreamentoPorEvento(Integer idEvento,
			Integer idPessoa)
			throws DaoException;

	List<Checklist> listarAllChecklist(Integer idEvento, Integer idPessoa,
			Integer idStatus, Date dataInicio) throws DaoException;

	
//	List<Checklist> listarTotalChecklistPorLocal(Integer idEvento) throws DaoException;
//	
//	List<Checklist> listarChecklistPorLocal(Integer idLocal) throws DaoException;
//	
	
	/**
	 *Fim:Novos metodos
	 */
	
}
