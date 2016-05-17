package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.repository.PessoaRepository;

@Controller(value = "bbPessoa")
@Scope("request")
public class BbPessoa {

	@Autowired
	private PessoaRepository pessoaRepository;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	public List<Pessoa> getPessoas() {
		return pessoaRepository.obterTodos(usuarioLogado.obterContratanteUsuarioLogado());
	}
}
