package br.com.kolss.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import br.com.kolss.model.entities.TipoVeiculo;
import br.com.kolss.model.repository.VeiculoTipoRepository;


@Component
public class ConverterVeiculoTipo implements Converter {  
      
	@Autowired
	private VeiculoTipoRepository veiculoTipoRepository;
	
        @Override  
        public Object getAsObject(FacesContext context, UIComponent component,String value) {  
                if (value != null) {
                	Long id= Long.parseLong(value);
                    return veiculoTipoRepository.BuscarPorId(id);  
                }  
            return null;  
        }  
      
        @Override  
        public String getAsString(FacesContext context, UIComponent component,Object value) {  
        	
            if (value != null) {  
            	  
                TipoVeiculo entity = (TipoVeiculo) value;  
                Long id = entity.getId();  
                if (id != null) {  
                    return String.valueOf(id);  
                }  
            }  
      
            return null;  
        }  

}
