package br.com.kolss.bbeans;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.PerfilFormulario;
import br.com.kolss.service.PerfilFormularioService;


@Controller(value = "bbPerfilFormulario")
@Scope("request")
public class BbPerfilFormulario {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private PerfilFormularioService service;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;
	
	
	/**
	 * Retorna todos os Perfis Formulário ativos, ordenados em ordem alfabética
	 * do nome.
	 * 
	 * @return
	 */
	public List<PerfilFormulario> getPerfisFormularios() {
		logger.debug("BbFormulario.getPerfisFormularios");
		return service.obterTodos(usuarioLogado.obterContratanteUsuarioLogado());
	}
	
}