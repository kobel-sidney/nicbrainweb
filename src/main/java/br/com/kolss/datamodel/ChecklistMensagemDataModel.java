package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.ChecklistMensagem;


public class ChecklistMensagemDataModel extends ListDataModel<ChecklistMensagem>
		implements SelectableDataModel<ChecklistMensagem> {
	
	
	public ChecklistMensagemDataModel() {
	}
	
	public ChecklistMensagemDataModel(
			List<ChecklistMensagem> checklistsMensagens) {
		super(checklistsMensagens);
	}
	
	
	@Override
	public Object getRowKey(ChecklistMensagem entity) {
		return entity.getId();
	}

	@SuppressWarnings("unchecked")
	@Override
	public ChecklistMensagem getRowData(String rowKey) {
		List<ChecklistMensagem> entities = (List<ChecklistMensagem>) getWrappedData();
		for (ChecklistMensagem entity : entities) {
			if (entity.getId() != null
					&& entity.getId().toString().equals(rowKey))
				return entity;
		}

		return null;
	}

}
