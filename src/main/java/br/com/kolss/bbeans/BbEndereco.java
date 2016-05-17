package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Endereco;
import br.com.kolss.service.EnderecoService;


@Controller(value = "bbEndereco")
@Scope("request")
public class BbEndereco {

	@Autowired
	private EnderecoService enderecoService;

	public List<Endereco> getEnderecos() {
		return (List<Endereco>) enderecoService.obterTodos();
	}

}
