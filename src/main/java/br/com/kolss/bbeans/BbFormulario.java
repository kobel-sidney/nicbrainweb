package br.com.kolss.bbeans;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Formulario;
import br.com.kolss.service.FormularioService;


@Controller(value = "bbFormulario")
@Scope("request")
public class BbFormulario {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	protected FormularioService service;
	
	
	/**
	 * Retorna todos os Formulário ativos, ordenados em ordem alfabética do nome.
	 * 
	 * @return
	 */
	public List<Formulario> getFormularios() {
		logger.debug("BbFormulario.getFormularios");
		
		return service.obterTodos();
	}
	
}