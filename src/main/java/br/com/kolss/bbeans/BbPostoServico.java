package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Cargo;
import br.com.kolss.model.entities.PostoServico;
import br.com.kolss.service.CargoService;
import br.com.kolss.service.PostoServicoService;


@Controller(value = "bbPostoServico")
@Scope("request")
public class BbPostoServico {

	@Autowired
	private PostoServicoService postoServicoService;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	public List<PostoServico> getPostoServicosPorContexto() {
        return postoServicoService.obterPostoServicos(usuarioLogado.obterContratanteUsuarioLogado());
    }
}
