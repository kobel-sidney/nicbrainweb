package br.com.kolss.webservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import br.com.kolss.dto.EnvioFormularioDTO;
import br.com.kolss.dto.PerfilFormularioDTO;
import br.com.kolss.dto.RetornoDTO;
import br.com.kolss.service.PerfilFormularioService;

@Controller(value = "perfilFormulario")
@RequestMapping("/perfilFormulario")
public class PerfilFormularioEndPoint {
	
	@Autowired
	private PerfilFormularioService perfilFormularioService;
	
	@RequestMapping(value = "/obterPerfilFormulario/{id}", method = RequestMethod.GET,produces="application/json")
	public @ResponseBody PerfilFormularioDTO obterPerfilFormulario(@PathVariable Long id){
		return perfilFormularioService.obterPerfilFormulario(id);
	}
	
	@RequestMapping(value = "/enviarPerfilFormulario", method = RequestMethod.POST,
			produces="application/json")
	public @ResponseBody RetornoDTO enviarPerfilFormulario(@RequestBody String envioFormularioDTO){
		Gson gson = new Gson();
		EnvioFormularioDTO envioFormulario = gson.fromJson(envioFormularioDTO,EnvioFormularioDTO.class);
		
		return perfilFormularioService.salvarEnvioPerfilFormulario(envioFormulario);
	}
	
	@RequestMapping(value = "/salvarAssinatura", method = RequestMethod.POST,
			produces="application/json")
	public @ResponseBody RetornoDTO salvarAssinatura(@RequestBody String envioFormularioDTO){
		Gson gson = new Gson();
		EnvioFormularioDTO envioFormulario = gson.fromJson(envioFormularioDTO,EnvioFormularioDTO.class);
		
		return perfilFormularioService.salvarAssinatura(envioFormulario.getListRespostaQuestao());
	}	
}
