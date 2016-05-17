package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import br.com.kolss.model.entities.ChecklistPadrao;
import br.com.kolss.model.entities.Segmento;

public interface SegmentoRepository {

	List<Segmento> obterTodos();
	List<Segmento> getSegmentosAssociados(ChecklistPadrao checklistPadrao);
	void removerAssociacao(ChecklistPadrao checklistPadrao);
	void associarSegmentos(ChecklistPadrao checklistPadrao,Collection<Serializable> idSegmentos);
	void salvar(Segmento segmento);
	void atualizar(Segmento segmento);
	void remover(Segmento segmento);

}
