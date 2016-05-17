package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.Procedimento;


public class ProcedimentoDataModel extends ListDataModel<Procedimento>
		implements SelectableDataModel<Procedimento> {
	
	public ProcedimentoDataModel() {
	}
	
	public ProcedimentoDataModel(List<Procedimento> data) {
		super(data);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Procedimento getRowData(String rowKey) {

		List<Procedimento> entities = (List<Procedimento>) getWrappedData();
		for (Procedimento model : entities) {
			if (model.getId() != null
					&& model.getId().toString().equals(rowKey))
				return model;
		}
		return null;
	}

	@Override
	public Object getRowKey(Procedimento entity) {
		return entity.getId();
	}

}
