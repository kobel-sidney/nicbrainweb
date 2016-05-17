package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Pais;
import br.com.kolss.service.PaisService;

@Controller(value = "bbPais")
@Scope("request")
public class BbPais {
	@Autowired
	protected PaisService service;
	
	public List<Pais> getPaises() {
        return service.obterTodos();
    }	
}