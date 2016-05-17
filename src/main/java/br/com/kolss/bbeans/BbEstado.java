package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Estado;
import br.com.kolss.service.EstadoService;

@Controller(value = "bbEstado")
@Scope("request")
public class BbEstado {

	@Autowired
	private EstadoService estadoService;

	public List<Estado> getEstados() {
		return (List<Estado>) estadoService.obterTodos();
	}
}