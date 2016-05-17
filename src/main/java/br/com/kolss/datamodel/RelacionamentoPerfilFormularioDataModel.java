package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.RelacionamentoPerfilFormulario;

public class RelacionamentoPerfilFormularioDataModel extends
		ListDataModel<RelacionamentoPerfilFormulario> implements
		SelectableDataModel<RelacionamentoPerfilFormulario> {

	public RelacionamentoPerfilFormularioDataModel() {
	}

	public RelacionamentoPerfilFormularioDataModel(
			List<RelacionamentoPerfilFormulario> data) {
		super(data);
	}

	@SuppressWarnings("unchecked")
	@Override
	public RelacionamentoPerfilFormulario getRowData(String rowKey) {

		List<RelacionamentoPerfilFormulario> relacionamentos = (List<RelacionamentoPerfilFormulario>) getWrappedData();

		for (RelacionamentoPerfilFormulario relacionamentoPerfilFormulario : relacionamentos) {
			if (relacionamentoPerfilFormulario.getId() != null
					&& relacionamentoPerfilFormulario.getId().toString()
							.equals(rowKey))
				return relacionamentoPerfilFormulario;
		}
		return null;
	}

	@Override
	public Object getRowKey(
			RelacionamentoPerfilFormulario relacionamentoPerfilFormulario) {
		return relacionamentoPerfilFormulario.getId();
	}
}
