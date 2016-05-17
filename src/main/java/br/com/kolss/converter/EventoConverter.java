package br.com.kolss.converter;

import java.util.Iterator;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

import org.primefaces.component.picklist.PickList;
import org.primefaces.model.DualListModel;

import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Regra;

@FacesConverter(value = "evento")
public class EventoConverter implements Converter {

	@Override
	public Object getAsObject(FacesContext arg0, UIComponent arg1, String arg2) {
		Object ret = null;
		if (arg1 instanceof PickList) {
			Object dualList = ((PickList) arg1).getValue();
			DualListModel dl = (DualListModel) dualList;
			for (Iterator iterator = dl.getSource().iterator(); iterator.hasNext();) {
				Object o = iterator.next();
				String id = (new StringBuilder()).append(((Evento) o).getId()).toString();
				if (arg2.equals(id)) {
					ret = o;
					break;
				}
			}
			if (ret == null) {
				for (Iterator iterator1 = dl.getTarget().iterator(); iterator1.hasNext();) {
					Object o = iterator1.next();
					String id = (new StringBuilder()).append(((Evento) o).getId()).toString();
					if (arg2.equals(id)) {
						ret = o;
						break;
					}
				}
			}
		}
		
		return ret;
	}

	@Override
	public String getAsString(FacesContext arg0, UIComponent arg1, Object arg2) {
		String str = "";
		if (arg2 instanceof Evento)
			str = ((Evento) arg2).getId().toString();
		
		return str;
	}

}
