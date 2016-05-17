package br.com.kolss.bbeans;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.ClassificacaoOcorrencia;
import br.com.kolss.service.ClassificacaoOcorrenciaService;


@Controller(value = "bbClassificacaoOcorrencia")
@Scope("request")
public class BbClassificacaoOcorrencia {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private ClassificacaoOcorrenciaService service;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;
	
	
	/**
	 * Retorna todas as Classificações Ocorrência cadastrados no sistema.
	 * 
	 * @return
	 */
    public List<ClassificacaoOcorrencia> getClassificacoesOcorrencias() {
    	logger.debug("BbClassificacaoOcorrencia.getClassificacoesOcorrencias");
        return service.obterTodos(usuarioLogado.obterContratanteUsuarioLogado());
    }
    
}