package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Departamento;
import br.com.kolss.service.DepartamentoService;

@Controller(value="bbDepartamento")
@Scope("request")
public class BbDepartamento {

	@Autowired
	private DepartamentoService departamentoService;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	public List<Departamento> getDepartamentos() {
		return (List<Departamento>) departamentoService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado());
	}
}
