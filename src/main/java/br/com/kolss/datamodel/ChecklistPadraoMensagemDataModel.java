package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.ChecklistPadraoMensagem;


public class ChecklistPadraoMensagemDataModel
		extends ListDataModel<ChecklistPadraoMensagem>
		implements SelectableDataModel<ChecklistPadraoMensagem> {
	
	
	public ChecklistPadraoMensagemDataModel() {
	}
	
	public ChecklistPadraoMensagemDataModel(
			List<ChecklistPadraoMensagem> checklistsMensagens) {
		super(checklistsMensagens);
	}
	
	@Override
	public Object getRowKey(ChecklistPadraoMensagem entity) {
		return entity.getId();
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public ChecklistPadraoMensagem getRowData(String rowKey) {
		
		List<ChecklistPadraoMensagem> entities =
				(List<ChecklistPadraoMensagem>) getWrappedData();
		
		for (ChecklistPadraoMensagem entity : entities) {
			if (entity.getId() != null
					&& entity.getId().toString().equals(rowKey)) {
				return entity;
			}
		}
		
		return null;
	}
	
}
