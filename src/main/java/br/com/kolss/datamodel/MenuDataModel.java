package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.Menu;

public class MenuDataModel extends ListDataModel<Menu> implements
		SelectableDataModel<Menu> {

	public MenuDataModel() {
	}

	public MenuDataModel(List<Menu> data) {
		super(data);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Menu getRowData(String rowKey) {

		List<Menu> menus = (List<Menu>) getWrappedData();

		for (Menu menu : menus) {
			if (menu.getId().toString().equals(rowKey)) {
				return menu;
			}
		}
		return null;
	}

	@Override
	public Object getRowKey(Menu menu) {
		return menu.getId();
	}
}