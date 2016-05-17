package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Municipio;
import br.com.kolss.service.MunicipioService;

@Controller(value = "bbMunicipio")
@Scope("request")
public class BbMunicipio {

	@Autowired
	protected MunicipioService service;
	
	public List<Municipio> getMunicipios() {
		return service.obterTodos();
	}

}