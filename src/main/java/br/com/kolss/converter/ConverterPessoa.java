package br.com.kolss.converter;


import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.repository.PessoaRepository;

@Component
public class ConverterPessoa implements Converter {
 
	@Autowired
	private PessoaRepository pessoaRepository;
	
    @Override  
    public Object getAsObject(FacesContext context, UIComponent component,String value) {  
            if (value != null) {
            	Long id= Long.parseLong(value);
                return pessoaRepository.obter(id);  
            }  
        return null;  
    }  
  
    @Override  
    public String getAsString(FacesContext context, UIComponent component,Object value) {  
    	
        if (value != null) {  
        	  
            Pessoa entity = (Pessoa) value;  
            Long id = entity.getId();  
            if (id != null) {  
                return String.valueOf(id);  
            }  
        }  
  
        return "";  
    }  
 
}