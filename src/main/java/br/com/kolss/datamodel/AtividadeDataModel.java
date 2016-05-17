package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.Atividade;


public class AtividadeDataModel extends ListDataModel<Atividade>
		implements SelectableDataModel<Atividade> {
	
	
	public AtividadeDataModel() {
	}
	
	public AtividadeDataModel(List<Atividade> atividades) {
		super(atividades);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public Atividade getRowData(String rowKey) {
		List<Atividade> entities = (List<Atividade>) getWrappedData();
		for (Atividade entity : entities) {
			if (entity.getId() != null
					&& entity.getId().toString().equals(rowKey))
				return entity;
		}

		return null;
	}
	
	@Override
	public Object getRowKey(Atividade entity) {
		return entity.getId();
	}
	
}
