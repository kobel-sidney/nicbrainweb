package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Funcionario;
import br.com.kolss.service.FuncionarioService;


@Controller(value="bbFuncionario")
@Scope("request")
public class BbFuncionario {

	@Autowired
	protected BbUsuarioLogado bbUsuarioLogado;

	@Autowired
	protected FuncionarioService service;


	public List<Funcionario> getFuncionariosPorChecklist() {

		return service.getFuncionariosResponsaveisPorChecklist(
				bbUsuarioLogado.getUserSession());
	}

	/**
	 * FIXME: Trocar pela versão que pesquisa a associação "Responsável x Evento"
	 *
	 * @return
	 */
	public List<String> getFuncionarioPorEvento() {

		return service.getPorEvento(bbUsuarioLogado.getUserSession());

	}

	public List<Funcionario> getFuncionariosPorAtividade() {

		return service.getFuncionariosResponsaveisPorAtividade(
				bbUsuarioLogado.getUserSession());

	}

	public List<Funcionario> getFuncionariosAtivos() {
		return service.listarTodosFuncionarios();
	}
	
	public List<Funcionario> getFuncionariosPorContratante() {
		return service.getFuncionariosPorContratante(bbUsuarioLogado.obterContratanteUsuarioLogado().getId());
	}
}
