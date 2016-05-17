package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Perfil;
import br.com.kolss.model.repository.PerfilRepository;


@Controller(value = "bbPerfilAcessoUsuario")
@Scope("request")
public class BbPerfilAcessoUsuario {

	@Autowired
	private PerfilRepository perfilRepository;

	public List<Perfil> getPerfis() {
		return perfilRepository.listarPerfis();
	}

}