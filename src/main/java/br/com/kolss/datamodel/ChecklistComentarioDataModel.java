package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.ChecklistComentario;


public class ChecklistComentarioDataModel extends ListDataModel<ChecklistComentario>
		implements SelectableDataModel<ChecklistComentario> {
	
	
	public ChecklistComentarioDataModel() {
	}
	
	public ChecklistComentarioDataModel(
			List<ChecklistComentario> checklistsComentarios) {
		super(checklistsComentarios);
	}
	
	
	@Override
	public Object getRowKey(ChecklistComentario entity) {
		return entity.getId();
	}

	@SuppressWarnings("unchecked")
	@Override
	public ChecklistComentario getRowData(String rowKey) {
		List<ChecklistComentario> entities = (List<ChecklistComentario>) getWrappedData();
		for (ChecklistComentario entity : entities) {
			if (entity.getId() != null
					&& entity.getId().toString().equals(rowKey))
				return entity;
		}

		return null;
	}

}
