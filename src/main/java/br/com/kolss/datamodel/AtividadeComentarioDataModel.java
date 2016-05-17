package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.AtividadeComentario;


public class AtividadeComentarioDataModel extends ListDataModel<AtividadeComentario>
		implements SelectableDataModel<AtividadeComentario> {
	
	
	public AtividadeComentarioDataModel() {
	}
	
	public AtividadeComentarioDataModel(
			List<AtividadeComentario> atividadeComentarios) {
		super(atividadeComentarios);
	}
	
	
	@Override
	public Object getRowKey(AtividadeComentario entity) {
		return entity.getId();
	}

	@SuppressWarnings("unchecked")
	@Override
	public AtividadeComentario getRowData(String rowKey) {
		List<AtividadeComentario> entities = (List<AtividadeComentario>) getWrappedData();
		for (AtividadeComentario entity : entities) {
			if (entity.getId() != null
					&& entity.getId().toString().equals(rowKey))
				return entity;
		}

		return null;
	}

}
