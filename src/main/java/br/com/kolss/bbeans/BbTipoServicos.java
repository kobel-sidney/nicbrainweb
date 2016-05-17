package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.TipoServico;
import br.com.kolss.service.TipoServicoService;


@Controller(value = "bbTipoServicos")
@Scope("request")
public class BbTipoServicos {

	@Autowired
	private TipoServicoService tipoServicoService;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	public List<TipoServico> getTipoServicosPorContratante() {
        return tipoServicoService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado());
    }
	
	public List<TipoServico> getTipoServicos() {
        return tipoServicoService.obterTodos();
    }
}
