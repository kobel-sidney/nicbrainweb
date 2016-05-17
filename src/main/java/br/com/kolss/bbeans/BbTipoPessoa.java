package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.TipoPessoa;
import br.com.kolss.service.TipoPessoaService;


@Controller(value = "bbTipoPessoa")
@Scope("request")
public class BbTipoPessoa {

	@Autowired
	private TipoPessoaService  pessoaService;

	public List<TipoPessoa> getTipoPessoas() {
		return pessoaService.obterTodos();
	}

}
