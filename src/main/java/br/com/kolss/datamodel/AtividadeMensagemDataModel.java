package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.AtividadeMensagem;


public class AtividadeMensagemDataModel extends ListDataModel<AtividadeMensagem>
		implements SelectableDataModel<AtividadeMensagem> {
	
	
	public AtividadeMensagemDataModel() {
	}
	
	public AtividadeMensagemDataModel(
			List<AtividadeMensagem> atividadeMensagens) {
		super(atividadeMensagens);
	}
	
	
	@Override
	public Object getRowKey(AtividadeMensagem entity) {
		return entity.getId();
	}

	@SuppressWarnings("unchecked")
	@Override
	public AtividadeMensagem getRowData(String rowKey) {
		List<AtividadeMensagem> entities = (List<AtividadeMensagem>) getWrappedData();
		for (AtividadeMensagem entity : entities) {
			if (entity.getId() != null
					&& entity.getId().toString().equals(rowKey))
				return entity;
		}

		return null;
	}

}
