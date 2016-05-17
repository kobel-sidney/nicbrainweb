package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.AgendamentoRastreamentoUsuario;


/**
 * Classe para montar a tabela.
 */
public class RastreamentoDataModel extends ListDataModel<AgendamentoRastreamentoUsuario>
		implements SelectableDataModel<AgendamentoRastreamentoUsuario> {
	
	/** Metodo construtor padrao */
	public RastreamentoDataModel() {
	}
	
	
	public RastreamentoDataModel(List<AgendamentoRastreamentoUsuario> rastreamentos) {
		super(rastreamentos);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public AgendamentoRastreamentoUsuario getRowData(String rowKey) {

		List<AgendamentoRastreamentoUsuario> entities = (List<AgendamentoRastreamentoUsuario>) getWrappedData();

		for (AgendamentoRastreamentoUsuario entity : entities) {
			if (entity.getId() != null
					&& entity.getId().toString().equals(rowKey))
				return entity;
		}

		return null;
	}
	
	@Override
	public Object getRowKey(AgendamentoRastreamentoUsuario entity) {
		return entity.getId();
	}
	
}
