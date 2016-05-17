package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.Evento;

public class EventoDataModel extends ListDataModel<Evento> implements
		SelectableDataModel<Evento> {

	public EventoDataModel() {
	}

	public EventoDataModel(List<Evento> data) {
		super(data);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Evento getRowData(String rowKey) {

		List<Evento> eventos = (List<Evento>) getWrappedData();

		for (Evento evento : eventos) {
			if (evento.getId() != null
					&& evento.getId().toString().equals(rowKey))
				return evento;
		}
		return null;
	}

	@Override
	public Object getRowKey(Evento evento) {
		return evento.getId();
	}

}
