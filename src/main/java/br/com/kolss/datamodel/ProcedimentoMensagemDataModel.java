package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.ProcedimentoMensagem;


public class ProcedimentoMensagemDataModel
		extends ListDataModel<ProcedimentoMensagem>
		implements SelectableDataModel<ProcedimentoMensagem> {
	
	public ProcedimentoMensagemDataModel() {
	}
	
	public ProcedimentoMensagemDataModel(List<ProcedimentoMensagem> data) {
		super(data);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ProcedimentoMensagem getRowData(String rowKey) {

		List<ProcedimentoMensagem> entities =
				(List<ProcedimentoMensagem>) getWrappedData();
		for (ProcedimentoMensagem model : entities) {
			if (model.getId() != null
					&& model.getId().toString().equals(rowKey))
				return model;
		}
		return null;
	}

	@Override
	public Object getRowKey(ProcedimentoMensagem entity) {
		return entity.getId();
	}

}
