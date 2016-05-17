package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.Resposta;

public class RespostaDataModel extends ListDataModel<Resposta> implements
		SelectableDataModel<Resposta> {

	public RespostaDataModel() {
	}

	public RespostaDataModel(List<Resposta> data) {
		super(data);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Resposta getRowData(String rowKey) {

		List<Resposta> respostas = (List<Resposta>) getWrappedData();

		for (Resposta resposta : respostas) {
			if (resposta.getId() != null
					&& resposta.getId().toString().equals(rowKey))
				return resposta;
		}
		return null;
	}

	@Override
	public Object getRowKey(Resposta resposta) {
		return resposta.getId();
	}
}