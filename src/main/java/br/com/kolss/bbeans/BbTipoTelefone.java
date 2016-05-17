package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.TipoTelefone;
import br.com.kolss.service.TipoTelefoneService;

@Controller(value = "bbTipoTelefone")
@Scope("request")
public class BbTipoTelefone {

	@Autowired
	private TipoTelefoneService tipoTelefoneService;

	public List<TipoTelefone> getTiposTelefone() {
        return tipoTelefoneService.obterTodos();
    }
}
