package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.Checklist;


/**
 * Classe para montar a tabela.
 */
public class ChecklistDataModel extends ListDataModel<Checklist>
		implements SelectableDataModel<Checklist> {
	
	/** Metodo construtor padrao */
	public ChecklistDataModel() {
	}
	
	
	public ChecklistDataModel(List<Checklist> checklists) {
		super(checklists);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Checklist getRowData(String rowKey) {

		List<Checklist> entities = (List<Checklist>) getWrappedData();

		for (Checklist entity : entities) {
			if (entity.getId() != null
					&& entity.getId().toString().equals(rowKey))
				return entity;
		}

		return null;
	}
	
	@Override
	public Object getRowKey(Checklist entity) {
		return entity.getId();
	}
	
}
