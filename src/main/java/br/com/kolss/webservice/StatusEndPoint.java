package br.com.kolss.webservice;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.kolss.dto.RetornoStatusDTO;
import br.com.kolss.service.StatusService;


@Controller
@RequestMapping("/status")
public class StatusEndPoint {
 
	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private StatusService statusService;
	
	
	@RequestMapping(value = "/obterTodos", method = RequestMethod.GET, produces="application/json")
	public @ResponseBody RetornoStatusDTO obterTodosMobile(@PathVariable String idUsuario){
		
		logger.info("StatusEndPoint.obterTodosMobile()");
		RetornoStatusDTO retornoStatusDTO = new RetornoStatusDTO();
		
		try{
			retornoStatusDTO = statusService.obterTodosMobile(idUsuario);
		}catch(Exception e){
			logger.error("ERRO AO OBTER STATUS", e);
		}
		
		return retornoStatusDTO;
	}
    
}