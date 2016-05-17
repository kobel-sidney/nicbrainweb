package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.Questao;

public class QuestaoDataModel extends ListDataModel<Questao> implements
		SelectableDataModel<Questao> {

	public QuestaoDataModel() {
	}

	public QuestaoDataModel(List<Questao> data) {
		super(data);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Questao getRowData(String rowKey) {

		List<Questao> questoes = (List<Questao>) getWrappedData();

		for (Questao questao : questoes) {
			if (questao.getId() != null
					&& questao.getId().toString().equals(rowKey))
				return questao;
		}
		return null;
	}

	@Override
	public Object getRowKey(Questao questao) {
		return questao.getId();
	}

}
