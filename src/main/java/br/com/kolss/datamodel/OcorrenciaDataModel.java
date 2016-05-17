package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.Ocorrencia;


public class OcorrenciaDataModel extends ListDataModel<Ocorrencia> implements
		SelectableDataModel<Ocorrencia> {

	public OcorrenciaDataModel() {
	}
	
	public OcorrenciaDataModel(List<Ocorrencia> data) {
		super(data);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Ocorrencia getRowData(String rowKey) {

		List<Ocorrencia> ocorrencias = (List<Ocorrencia>) getWrappedData();

		for (Ocorrencia ocorrencia : ocorrencias) {
			if (ocorrencia.getId() != null
					&& ocorrencia.getId().toString().equals(rowKey))			
				return ocorrencia;
		}
		return null;
	}

	@Override
	public Object getRowKey(Ocorrencia ocorrencia) {
		return ocorrencia.getId();		
	}
	
}
