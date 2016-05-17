package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Segmento;
import br.com.kolss.service.SegmentoService;

@Controller(value = "bbSegmento")
@Scope("request")
public class BbSegmento {
	@Autowired
	protected SegmentoService service;
	
	public List<Segmento> getSegmentos() {
		return service.buscarTodos();
    }	

}
