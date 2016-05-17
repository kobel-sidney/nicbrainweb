package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.GrupoQuestao;

public class GrupoQuestaoDataModel extends ListDataModel<GrupoQuestao>
		implements SelectableDataModel<GrupoQuestao> {

	public GrupoQuestaoDataModel() {
	}

	public GrupoQuestaoDataModel(List<GrupoQuestao> data) {
		super(data);
	}

	@SuppressWarnings("unchecked")
	@Override
	public GrupoQuestao getRowData(String rowKey) {

		List<GrupoQuestao> grupoQuestoes = (List<GrupoQuestao>) getWrappedData();

		for (GrupoQuestao grupoQuestao : grupoQuestoes) {
			if (grupoQuestao.getId() != null
					&& grupoQuestao.getId().toString().equals(rowKey))
				return grupoQuestao;
		}
		return null;
	}

	@Override
	public Object getRowKey(GrupoQuestao grupoQuestao) {
		return grupoQuestao.getId();
	}

}