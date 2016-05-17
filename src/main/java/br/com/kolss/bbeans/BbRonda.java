package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Ronda;
import br.com.kolss.model.repository.RondaRepository;


@Controller(value = "bbRonda")
@Scope("request")
public class BbRonda {

	@Autowired
	private RondaRepository rondaRepository;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	public List<Ronda> getRondasFinalizadasPorCliente() {
        return rondaRepository.obterRondasFinalizadas(usuarioLogado.getUserSession().getCliente());
    }
}
