package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.AtividadeOcorrencia;


public class AtividadeOcorrenciaDataModel 
		extends ListDataModel<AtividadeOcorrencia>
		implements SelectableDataModel<AtividadeOcorrencia> {

	
	public AtividadeOcorrenciaDataModel() {
	}
	
	public AtividadeOcorrenciaDataModel(
			List<AtividadeOcorrencia> atividadesOcorrencia) {
		super(atividadesOcorrencia);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public AtividadeOcorrencia getRowData(String rowKey) {

		List<AtividadeOcorrencia> entities = (List<AtividadeOcorrencia>) getWrappedData();
		for (AtividadeOcorrencia entity : entities) {
			if (entity.getId() != null
					&& entity.getId().toString().equals(rowKey))
				return entity;
		}

		return null;
	}
	
	@Override
	public Object getRowKey(AtividadeOcorrencia entity) {
		return entity.getId();
	}
	
}
