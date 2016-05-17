package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.PerfilFormulario;

public class PerfilFormularioDataModel extends ListDataModel<PerfilFormulario>
		implements SelectableDataModel<PerfilFormulario> {

	public PerfilFormularioDataModel() {
	}

	public PerfilFormularioDataModel(List<PerfilFormulario> data) {
		super(data);
	}

	@SuppressWarnings("unchecked")
	@Override
	public PerfilFormulario getRowData(String rowKey) {

		List<PerfilFormulario> perfilFormularios = (List<PerfilFormulario>) getWrappedData();

		for (PerfilFormulario perfilFormulario : perfilFormularios) {
			if (perfilFormulario.getId() != null
					&& perfilFormulario.getId().toString().equals(rowKey))
				return perfilFormulario;
		}
		return null;
	}

	@Override
	public Object getRowKey(PerfilFormulario perfilFormulario) {
		return perfilFormulario.getId();
	}

}