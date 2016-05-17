package br.com.kolss.converter;

import java.io.Serializable;
import java.util.Collection;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

import org.primefaces.component.picklist.PickList;
import org.primefaces.model.DualListModel;

import br.com.kolss.dto.SimplePickListDTO;


@FacesConverter(value = "simplePickListConverter")
public class SimplePickListConverter implements Serializable, Converter {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -2864371937039227236L;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public Object getAsObject(FacesContext arg0, UIComponent arg1, String arg2) {
		
		Object ret = null;
		if (arg1 instanceof PickList) {
			
			Object dualList = ((PickList) arg1).getValue();
			DualListModel<SimplePickListDTO> dl = (DualListModel<SimplePickListDTO>) dualList;
			
			// Pesquisa na lista de source:
			ret = findById(arg2, dl.getSource());
			
			// Pesquisa na lista de target:
			if (ret == null) {
				ret = findById(arg2, dl.getTarget());
			}
		}
		
		return ret;
	}
	
	/**
	 * Pesquisa a coleção de DTOs.<br>
	 * 
	 * @param id
	 * @param dtos
	 * 
	 * @return
	 */
	private SimplePickListDTO findById(String id,
			Collection<SimplePickListDTO> dtos) {
		
		SimplePickListDTO _dto = null;
		for (SimplePickListDTO dto : dtos) {
			if (id.equals(dto.getId() + "")) {
				_dto = dto;
				break;
			}
		}
		
		return _dto;
	}

	@Override
	public String getAsString(FacesContext arg0, UIComponent arg1, Object arg2) {
		return (arg2 != null && arg2 instanceof SimplePickListDTO)
				? (((SimplePickListDTO) arg2).getId() + "").toString()
				: "";
	}

}
