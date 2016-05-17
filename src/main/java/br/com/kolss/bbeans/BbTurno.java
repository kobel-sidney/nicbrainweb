package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Turno;
import br.com.kolss.service.TurnoService;

@Controller(value="bbTurno")
@Scope("request")
public class BbTurno {

	@Autowired
	private TurnoService turnoService;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	public List<Turno> getTurnos() {
		return turnoService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado());
	}
}
