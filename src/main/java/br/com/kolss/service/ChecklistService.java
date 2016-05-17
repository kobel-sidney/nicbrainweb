package br.com.kolss.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import br.com.kolss.dto.ChecklistDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.filtro.ChecklistFiltro;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.ChecklistComentario;
import br.com.kolss.model.entities.ChecklistMensagem;


public interface ChecklistService {
	
	void salvar(Checklist model);
	
	void atualizar(Checklist model);
	
	void remover(Checklist model);
	
	Checklist obter(Serializable idChecklist) throws ServiceException;
	
	ChecklistDTO preencherCheklistDTO(Checklist checklist) throws ServiceException;
	
	List<Checklist> obterEmAbertoPorFiltro(ChecklistFiltro checklistFiltro) throws ServiceException;
	
	List<Checklist> obterNaoCanceladoPorFiltro(ChecklistFiltro checklistFiltro) throws ServiceException;
	
	List<Checklist> obterPorFiltro(ChecklistFiltro checklistFiltro) throws ServiceException;
	
	List<ChecklistMensagem> obterChecklistMensagensPorId(Serializable idChecklist)throws ServiceException;
	
	List<ChecklistDTO> preencherListaChecklistDTO(List<Checklist> listChecklist)throws ServiceException;
	
	List<ChecklistComentario> obterChecklistsComentarios(Serializable idChecklist) throws ServiceException;
	
	boolean iniciarChecklist(Checklist checklist, Serializable idUsuario)throws ServiceException;

	boolean concluirChecklist(Serializable idChecklist, Serializable idUsuario)	throws ServiceException;

	boolean cancelarChecklist(Serializable idChecklist, String observacao,	Serializable idUsuario) throws ServiceException;
	
	public boolean novoComentario(Serializable idChecklist, String comentario,Date datahoraComentario, Serializable idUsuario) throws ServiceException;
	
	@Deprecated
	boolean iniciarChecklistMobile(Integer idChecklist, Integer idEvento,Integer idLocal) throws ServiceException;
				
	@Deprecated
	boolean concluirChecklistMobile(Integer idChecklist, Integer idEvento,Integer idLocal) throws ServiceException;
	
	@Deprecated
	boolean cancelarChecklistMobile(Integer idChecklist, Integer idEvento, Integer idLocal, String observacao) throws ServiceException;

	Checklist buscar(Long id);


	
}
