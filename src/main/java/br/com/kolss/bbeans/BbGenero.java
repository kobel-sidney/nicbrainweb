package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Genero;
import br.com.kolss.service.GeneroService;

@Controller(value = "bbGenero")
@Scope("request")
public class BbGenero {

	
	@Autowired
	private GeneroService generoService;

	public List<Genero> getGeneros() {
		return (List<Genero>) generoService.obterTodos();
	}
}
