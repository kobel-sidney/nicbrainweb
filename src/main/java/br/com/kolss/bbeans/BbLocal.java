package br.com.kolss.bbeans;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Local;
import br.com.kolss.service.LocalService;

@Controller(value = "bbLocal")
@Scope("request")
public class BbLocal {

    protected Logger logger = Logger.getLogger(getClass());

    @Autowired
    protected LocalService localService;

    @Autowired
    protected BbUsuarioLogado bbUsuarioLogado;

    public List<Local> getLocais() {
        logger.debug("BbLocal.getLocais");

        return localService.getLocais();
    }

    /**
     * Retorna todos os locais autorizados para o Usuário logado, ordenados pelo
     * nome do local.
     *
     * @return
     */
    public List<Local> getLocaisPorContexto() {
        logger.debug("BbLocal.getLocaisPorContexto");

        return localService.getLocais(bbUsuarioLogado.getUserSession().getId());
    }

    public List<Local> getLocaisPorCliente() {

        return localService.getLocaisAtivosPorCliente(bbUsuarioLogado.getUserSession().getCliente());
    }

    public List<Local> getLocaisRonda() {
        return localService.getLocaisRonda(bbUsuarioLogado.getUserSession().getId());
    }

    public List<Local> getLocaisPorContratante() {
		return localService.getLocaisPorContratante(bbUsuarioLogado.obterContratanteUsuarioLogado());
	}
}
