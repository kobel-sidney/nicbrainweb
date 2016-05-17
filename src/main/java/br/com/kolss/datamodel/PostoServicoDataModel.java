package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.PostoServico;

public class PostoServicoDataModel extends ListDataModel<PostoServico>
		implements SelectableDataModel<PostoServico> {

	public PostoServicoDataModel() {
	}

	public PostoServicoDataModel(List<PostoServico> data) {
		super(data);
	}

	@SuppressWarnings("unchecked")
	@Override
	public PostoServico getRowData(String rowKey) {

		List<PostoServico> postoServicos = (List<PostoServico>) getWrappedData();

		for (PostoServico postoServico : postoServicos) {
			if (postoServico.getId() != null
					&& postoServico.getId().toString().equals(rowKey))
				return postoServico;
		}
		return null;
	}

	@Override
	public Object getRowKey(PostoServico postoServico) {
		return postoServico.getId();
	}

}