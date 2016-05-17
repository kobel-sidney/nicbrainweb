package br.com.kolss.bbeans;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.TipoClassificacao;
import br.com.kolss.service.TipoClassificacaoService;


@Controller(value = "bbTipoClassificacao")
@Scope("request")
public class BbTipoClassificacao {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private TipoClassificacaoService tipoClassificacaoService;
	
	@Autowired
	private BbUsuarioLogado bbUsuarioLogado;
	
	
	public List<TipoClassificacao> getTiposClassificacoes() {
		logger.debug("BbTipoClassificacao.getTiposClassificacoes");
		return (List<TipoClassificacao>) tipoClassificacaoService.obterTodos(bbUsuarioLogado.obterContratanteUsuarioLogado());
	}
	
}
