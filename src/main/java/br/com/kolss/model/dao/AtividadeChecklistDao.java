package br.com.kolss.model.dao;

import java.util.List;

import br.com.kolss.exception.DaoException;
import br.com.kolss.model.entities.Atividade;

public interface AtividadeChecklistDao {
	List<Atividade> listarAtividadeChecklist(Long idChecklist, Long idEvento) throws DaoException;

	Atividade getAtividadePorId(Long idAtividade) throws DaoException;
	
}
