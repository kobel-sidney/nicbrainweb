package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.Device;
import br.com.kolss.model.entities.Usuario;


public class DeviceDataModel extends ListDataModel<Device> implements SelectableDataModel<Device> {
	
	
	public DeviceDataModel() {
	}

	public DeviceDataModel(List<Device> data) {
		super(data);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Device getRowData(String rowKey) {

		List<Device> devices = (List<Device>) getWrappedData();
		
		for (Device device : devices) {
			if (device.getId() != null					
					&& device.getId().toString().equals(rowKey))
				return device;
		}
		
		return null;
	}

	@Override
	public Object getRowKey(Device device) {		
		return device.getId();
	}
	
}