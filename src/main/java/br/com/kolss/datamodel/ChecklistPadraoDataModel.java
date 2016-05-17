package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.ChecklistPadrao;


/** Classe para montar a tabela. */
public class ChecklistPadraoDataModel extends ListDataModel<ChecklistPadrao>
		implements SelectableDataModel<ChecklistPadrao> {
	
	/** Metodo construtor padrao */
	public ChecklistPadraoDataModel() {
	}
	
	
	public ChecklistPadraoDataModel(List<ChecklistPadrao> checklistsPadroes) {
		super(checklistsPadroes);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ChecklistPadrao getRowData(String rowKey) {

		List<ChecklistPadrao> entities = (List<ChecklistPadrao>) getWrappedData();
		for (ChecklistPadrao entity : entities) {
			if (entity.getId() != null
					&& entity.getId().toString().equals(rowKey))
				return entity;
		}
		
		return null;
	}
	
	@Override
	public Object getRowKey(ChecklistPadrao entity) {
		return entity.getId();
	}
	
}
