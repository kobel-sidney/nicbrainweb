package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.TipoQuestao;

public class TipoQuestaoDataModel extends ListDataModel<TipoQuestao> implements
		SelectableDataModel<TipoQuestao> {

	public TipoQuestaoDataModel() {
	}

	public TipoQuestaoDataModel(List<TipoQuestao> data) {
		super(data);
	}

	@SuppressWarnings("unchecked")
	@Override
	public TipoQuestao getRowData(String rowKey) {

		List<TipoQuestao> tipoQuestoes = (List<TipoQuestao>) getWrappedData();

		for (TipoQuestao tipoQuestao : tipoQuestoes) {
			if (tipoQuestao.getId() != null
					&& tipoQuestao.getId().toString().equals(rowKey))
				return tipoQuestao;
		}
		return null;
	}

	@Override
	public Object getRowKey(TipoQuestao tipoQuestao) {
		return tipoQuestao.getId();
	}
}
