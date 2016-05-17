package br.com.kolss.webservice;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.kolss.dto.RetornoTelefoneUteisDTO;
import br.com.kolss.dto.TelefoneUtilDTO;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TelefoneUtil;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.ContratanteService;
import br.com.kolss.service.TelefoneUtilService;
import br.com.kolss.service.UsuarioService;


@Controller
@RequestMapping("/telefoneutil")
public class TelefoneUtilEndPoint {
 
	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired private ContratanteService  contratanteService;
	@Autowired private UsuarioService usuarioService;
	@Autowired private TelefoneUtilService telefoneUtilService;
	
	
	@RequestMapping(value = "/telefones/{idUsuario}", method = RequestMethod.GET, produces="application/json")
	public @ResponseBody RetornoTelefoneUteisDTO getTelefonesUteis(@PathVariable String idUsuario){
		
		logger.info("TelefoneUtilEndPoint.getTelefonesUteis()");
		RetornoTelefoneUteisDTO retornoTelefoneUteisDTO = new RetornoTelefoneUteisDTO();
		
		try{
			final Usuario usuario = usuarioService.obter(Long.valueOf(idUsuario));
			final Contratante contratante = contratanteService.obterPorUsuario(usuario);
			final List<TelefoneUtil> lstTelefoneUtil = telefoneUtilService.obterTodos(contratante);
			TelefoneUtilDTO telefoneUtilDTO = null;
			final List<TelefoneUtilDTO> lstTelefoneUtilDTO = new ArrayList<TelefoneUtilDTO>();
			for (int i = 0; i < lstTelefoneUtil.size(); i++) {
				telefoneUtilDTO = new TelefoneUtilDTO(
						lstTelefoneUtil.get(i).getId().toString(),
						lstTelefoneUtil.get(i).getNumero(),
						lstTelefoneUtil.get(i).getNome());
				lstTelefoneUtilDTO.add(telefoneUtilDTO);
			}
			
			retornoTelefoneUteisDTO = new RetornoTelefoneUteisDTO(lstTelefoneUtilDTO);
			
		}catch(Exception e){
			logger.error("ERRO AO OBTER TELEFONE UTEIS", e);
		}
		
		return retornoTelefoneUteisDTO;
	}
    
}