package br.com.kolss.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.kolss.dto.CercaVirtualDTO;
import br.com.kolss.dto.CoordenadaDTO;
import br.com.kolss.dto.ListaCercaVirtualDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.CercaVirtual;
import br.com.kolss.model.entities.Coordenada;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.CercaVirtualService;
import br.com.kolss.service.UsuarioService;

@Controller
public class CercaVirtualController {

	@Autowired
	private CercaVirtualService cercaVirtualService;
	
	@Autowired
	private UsuarioService usuarioService;

	@RequestMapping(value = "/salvarCercaVirtual", method = RequestMethod.POST, produces = "application/json")
	public void salvarCercaVirtual(@RequestBody final CercaVirtualDTO cercaVirtualDTO) {

		cercaVirtualService.salvar(cercaVirtualDTO);
	}

	@RequestMapping(value = "/removerCercaVirtual", method = RequestMethod.POST, produces = "application/json")
	public void removerCercaVirtual(@RequestBody final CercaVirtualDTO cercaVirtualDTO) {

		cercaVirtualService.excluir(cercaVirtualDTO.getIdCercaVirtual());
	}

	@RequestMapping(value = "/buscarCercaVirtual", method = RequestMethod.POST, produces = "application/json")
	private @ResponseBody CercaVirtualDTO buscarCercaVirtual(@RequestBody final CercaVirtualDTO cercaVirtualDTO) {

		CercaVirtualDTO cercaVirtual = cercaVirtualService.buscarCercaVirtual(cercaVirtualDTO.getIdCercaVirtual());
		if (cercaVirtual == null) {
			cercaVirtual = new CercaVirtualDTO();
		}

		return cercaVirtual;
	}

	@RequestMapping(value = "/cercasVirtuais",method = RequestMethod.GET,produces = "application/json")
	private @ResponseBody ListaCercaVirtualDTO buscarCercasVirtuais() {
		
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		Usuario usuario = usuarioService.getUsuarioPorEmail(username);
		if (usuario == null) {
			throw new ServiceException("Usuário nulo.");
		}
		
		ListaCercaVirtualDTO lista = new ListaCercaVirtualDTO();
		
		List<CercaVirtualDTO> cercasVirtuais = cercaVirtualService.listarCercasVirtuais(usuario);
		if (cercasVirtuais != null) {
			lista.setCercasVirtuais(cercasVirtuais);
		}
		
		return lista;
	}

	@RequestMapping(value="/cercaVirtual/{cercaVirtualId}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<CoordenadaDTO> obterCercaVirtual(@PathVariable("cercaVirtualId") Integer cercaVirtualId) {
		CercaVirtual cercaVirtual = cercaVirtualService.obterCercaVirtualPorId(cercaVirtualId);
		
		CercaVirtualDTO cercaVirtualDTO = new CercaVirtualDTO();
		
		List<CoordenadaDTO> coordenadas = new ArrayList<>();
		for (Coordenada coordenada : cercaVirtual.getCoordenadas()) {
			CoordenadaDTO coordenadaDTO = new CoordenadaDTO();
			coordenadaDTO.setLatitude(coordenada.getCoordenada().getLatitude());
			coordenadaDTO.setLongitude(coordenada.getCoordenada().getLongitude());
			coordenadas.add(coordenadaDTO);
		}
		
		cercaVirtualDTO.setCoordenadas(coordenadas);
		
		return coordenadas;
	}
}
