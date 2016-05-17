package br.com.kolss.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.kolss.dto.EquipamentoDTO;
import br.com.kolss.model.entities.Equipamento;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.EquipamentoService;
import br.com.kolss.service.UsuarioService;

@Controller
@RequestMapping("cameras")
public class CameraController {

	@Autowired
	private UsuarioService usuarioService;

	@Autowired
	private EquipamentoService equipamentoService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		Usuario usuario = usuarioService.getUsuarioPorEmail(username);

		List<EquipamentoDTO> cameras = obterCameras();

		ModelAndView mv = new ModelAndView("cameras");
		mv.addObject("cameras", cameras);
		mv.addObject("userName", usuario.getNome());
		
		return mv;
	}

	@RequestMapping(method = RequestMethod.GET)
	public @ResponseBody List<EquipamentoDTO> obterCameras() {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		Usuario usuario = usuarioService.getUsuarioPorEmail(username);
		Long idModeloCamera = Long.valueOf(1);

		List<Equipamento> cameras = equipamentoService.getEquipamentosPorContexto(idModeloCamera, null,
				usuario.getId());
		List<EquipamentoDTO> camerasDTO = new ArrayList<>(0);
		for (Equipamento equipamento : cameras) {
			camerasDTO.add(new EquipamentoDTO(equipamento));
		}

		return camerasDTO;
	}
}
