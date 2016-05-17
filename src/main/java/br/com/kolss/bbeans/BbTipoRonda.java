package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.TipoRonda;
import br.com.kolss.service.TipoRondaService;

@Controller(value = "bbTipoRonda")
@Scope("request")
public class BbTipoRonda {

	@Autowired
	private TipoRondaService tipoRondaService;

	@Autowired
	private BbUsuarioLogado usuarioLogado;

	public List<TipoRonda> getTipos() {
		return tipoRondaService.obterRondas();
	}
}
