package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Cargo;
import br.com.kolss.service.CargoService;


@Controller(value = "bbCargo")
@Scope("request")
public class BbCargo {

	@Autowired
	private CargoService cargoService;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	public List<Cargo> getCargos() {
        return cargoService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado());
    }
}
