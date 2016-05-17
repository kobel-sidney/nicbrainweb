package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.TipoEndereco;
import br.com.kolss.service.TipoEnderecoService;

@Controller(value = "bbTipoEndereco")
@Scope("request")
public class BbTipoEndereco {

	@Autowired
	protected TipoEnderecoService service;


	public List<TipoEndereco> getTiposEnderecos() {
		return service.obterTodos();
	}

	public List<TipoEndereco> getTipoEnderecos() {
		return service.obterTodos();
	}

}
