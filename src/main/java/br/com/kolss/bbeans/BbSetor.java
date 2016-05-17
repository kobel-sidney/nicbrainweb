package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Setor;
import br.com.kolss.service.SetorService;


@Controller(value = "bbSetor")
@Scope("request")
public class BbSetor {
	
	@Autowired
	protected SetorService setorService;
	
	@Autowired
	private BbUsuarioLogado bbUsuarioLogado;
	
	public List<Setor> getSetores() {
		
		return setorService.obterTodos();
	}
	
	public List<Setor> getSetoresPorContexto() {
		return setorService.obterPorContratante(bbUsuarioLogado.obterContratanteUsuarioLogado());
	}

	public List<Setor> getSetoresPorCliente() {
		return setorService.obterPorCliente(bbUsuarioLogado.getUserSession().getCliente());
	}
}