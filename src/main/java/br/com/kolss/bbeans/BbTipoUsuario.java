package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.TipoUsuario;
import br.com.kolss.model.repository.TipoUsuarioRepository;

@Controller(value = "bbTipoUsuario")
@Scope("request")
public class BbTipoUsuario {

	@Autowired
	private TipoUsuarioRepository tipoUsuarioRepository;

	public List<TipoUsuario> getTipoUsuarios() {
		return tipoUsuarioRepository.listarTipoUsuario();
	}
}
