package br.com.kolss.converter;

import java.io.Serializable;
import java.util.List;

import javax.faces.component.UIComponent;
import javax.faces.component.UISelectItems;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

import br.com.kolss.dto.SimpleDTO;


/** Classe conversora para utilizar o Select Many Checkbox. */
@FacesConverter(value = "simpleSelectManyCheckboxConverter")
public class SimpleSelectManyCheckboxConverter implements Serializable,
		Converter {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -81332011169587679L;
	
	@Override
	public Object getAsObject(FacesContext arg0, UIComponent arg1, String arg2) {
		
		for (UIComponent child : arg1.getChildren()) {
			
			if (child instanceof UISelectItems) {
				UISelectItems select = (UISelectItems) child;
				@SuppressWarnings("unchecked")
				List<SimpleDTO> dtos = (List<SimpleDTO>) select.getValue();
				
				for (SimpleDTO dto : dtos) {
					if (dto.getId().toString().equals(arg2)) {
						return dto;
					}
				}
			}
		}
		
		return null;
	}
	
	@Override
	public String getAsString(FacesContext arg0, UIComponent arg1, Object arg2) {
		
		SimpleDTO dto = (SimpleDTO) arg2 ;
		return dto.getId().toString();
	}
	
}
