package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import br.com.kolss.dto.QuantidadeChecklistsPorLocalDTO;
import br.com.kolss.dto.QuantidadeStatusChecklistPorLocalDTO;
import br.com.kolss.filtro.ChecklistFiltro;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.ChecklistComentario;
import br.com.kolss.model.entities.ChecklistMensagem;

public interface ChecklistRepository {

	Checklist obter(Serializable idChecklist);

	List<Checklist> obterEmAbertoPorFiltro(ChecklistFiltro checklistFiltros);
	
	List<Checklist> obterNaoCanceladoPorFiltro(ChecklistFiltro checklistFiltros);

	List<Checklist> obterPorFiltro(ChecklistFiltro checklistFiltros);
	
	List<QuantidadeChecklistsPorLocalDTO> obterQuantidadeChecklistsPorLocais(Date dateFrom, Date dateTo, Serializable idUsuarioContexto);
	
	List<QuantidadeStatusChecklistPorLocalDTO> getQuantidadeStatusChecklistsPorLocal(Serializable idLocal, Date dateFrom, Date dateTo, Serializable idUsuarioContexto);

	List<ChecklistMensagem> getChecklistsMensagens(Serializable idChecklist);

	List<Checklist> obterComTerminoNaoRealizadoSemAlerta(Date dtAtual);

	List<ChecklistComentario> obterComentariosChecklists(Serializable idChecklist);

	void salvar(Checklist checklist);

	void salvar(ChecklistComentario checklistComentario);

	void atualizar(Checklist checklist);

	void remover(Checklist checklist);

}
