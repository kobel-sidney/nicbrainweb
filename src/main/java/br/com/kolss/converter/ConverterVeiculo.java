package br.com.kolss.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import br.com.kolss.model.entities.Veiculo;
import br.com.kolss.model.repository.VeiculoRepository;


@Component
public class ConverterVeiculo implements Converter {  
    
	@Autowired private VeiculoRepository veiculoRepository;
	
        @Override  
        public Object getAsObject(FacesContext context, UIComponent component,String value) {  
                if (value != null) {
                	Long id= Long.parseLong(value);
                    return veiculoRepository.obter(id);  
                }  
            return null;  
        }  
      
        @Override  
        public String getAsString(FacesContext context, UIComponent component,Object value) {  
        	
            if (value != null) {  
            	  
                Veiculo entity = (Veiculo) value;  
                Long id = entity.getId();  
                if (id != null) {  
                    return String.valueOf(id);  
                }  
            }  
      
            return (String) value;  
        }  
}
      

