package br.com.kolss.datamodel;

import java.io.Serializable;
import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.AbstractEntity;

public class EntityDataModel<T extends AbstractEntity<?>> extends ListDataModel<T> implements SelectableDataModel<T> {

	/** Metodo construtor padrao */
	public EntityDataModel() {
	}

	public EntityDataModel(List<T> entities) {
		super(entities);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T getRowData(String rowKey) {

		List<T> entities = (List<T>) getWrappedData();

		for (T entity : entities) {
			if (entity.getId() != null
					&& entity.getId().toString().equals(rowKey))
				return entity;
		}

		return null;
	}

	@Override
	public Serializable getRowKey(T entity) {
		return entity.getId();
	}

}