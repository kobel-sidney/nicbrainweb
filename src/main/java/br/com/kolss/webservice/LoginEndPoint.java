package br.com.kolss.webservice;


import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.kolss.dto.RetornoAlterarSenhaDTO;
import br.com.kolss.dto.RondaDTO;
import br.com.kolss.dto.UsuarioDTO;
import br.com.kolss.enums.RetornoEnum;
import br.com.kolss.exception.SenhaDoUsuarioInvalidaException;
import br.com.kolss.exception.UsuarioNaoExisteException;
import br.com.kolss.service.RondaService;
import br.com.kolss.service.UsuarioService;
import br.com.kolss.util.HTTPStatusCodeEnum;
import br.com.kolss.util.HibernateUtil;


@Controller
@RequestMapping("/login")
public class LoginEndPoint {
 
	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private RondaService rondaService;
	
	@Deprecated
	@RequestMapping(value = "/checalogin/{cpfUsuario}/{senhaUsuario}", method = RequestMethod.GET, produces="application/json")
    public @ResponseBody UsuarioDTO getChecaLogin(
    		@PathVariable String cpfUsuario,
    		@PathVariable String senhaUsuario) {
		
		logger.debug("checalogin");
		UsuarioDTO usuarioDTO = usuarioService.getUsuarioDTO(cpfUsuario, senhaUsuario);
		
		final Session session = HibernateUtil.getSessionFactory().openSession();
		session.close();
		
		return usuarioDTO; 
	}
	
	@RequestMapping(value = "/acessar/{emailUsuario}/{senhaUsuario}", method = RequestMethod.GET, produces="application/json")
    public @ResponseBody UsuarioDTO getAcesso(
    		@PathVariable String emailUsuario,
    		@PathVariable String senhaUsuario) {
		
		logger.debug("checalogin");
		
		UsuarioDTO usuarioDTO = new UsuarioDTO();

		try {
		
			usuarioDTO = usuarioService.getUsuarioDTOMobile(emailUsuario, senhaUsuario);
			usuarioDTO.setRetornoEnum(RetornoEnum.SUCESSSO);
			
		} catch (SenhaDoUsuarioInvalidaException e) {
			usuarioDTO.setRetornoEnum(RetornoEnum.SENHA_INVALIDA);
		} catch (UsuarioNaoExisteException e) {
			usuarioDTO.setRetornoEnum(RetornoEnum.USUARIO_INVALIDO);
		}
		
		return usuarioDTO;
	} 
	
	@RequestMapping(value = "/alterarsenha/{emailUsuario}/{senhaUsuario}/{novaSenhaUsuario}/{confirmaSenhaUsuario}",
			method = RequestMethod.GET, produces="application/json")
    public @ResponseBody RetornoAlterarSenhaDTO alterarSenha(
    		@PathVariable String emailUsuario,
    		@PathVariable String senhaUsuario,
    		@PathVariable String novaSenhaUsuario,
    		@PathVariable String confirmaSenhaUsuario) {
		
		logger.debug("alterarsehna");
		RetornoAlterarSenhaDTO result = new RetornoAlterarSenhaDTO();
		result.setMensagem("Sucesso");

		try {
			result = usuarioService.alterarSenhaMobile(emailUsuario,senhaUsuario, novaSenhaUsuario, confirmaSenhaUsuario);
		} catch (SenhaDoUsuarioInvalidaException e) {
			result.setMensagem(e.toString());
		} catch (UsuarioNaoExisteException e) {
			result.setMensagem(e.toString());
		}
		return result;	
	}


	
	@RequestMapping(value = "/acessarpost", method = RequestMethod.POST, produces="application/json")
    public @ResponseBody UsuarioDTO getAcessoPost(
    		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      String emailUsuario,
    		@RequestParam String senhaUsuario) {
		
		logger.debug("checalogin");
		
		UsuarioDTO usuarioDTO = null;

		usuarioDTO = usuarioService.getUsuarioDTO(emailUsuario, senhaUsuario);
		
		return usuarioDTO; 
	}
	
	@RequestMapping(value = "/registrar/{idPessoa}/{idProjeto}/{idRegistro}", method=RequestMethod.GET)
    public @ResponseBody String registrarDevice(@PathVariable String idPessoa,
 									    	    @PathVariable String idProjeto,
									    	    @PathVariable String idRegistro) {
    	logger.debug("LoginEndPoint.registrarDevice");
    	
    	Long _idPessoa = Long.valueOf(idPessoa);
    	usuarioService.removerAssociacaoDevice(idRegistro, idProjeto.trim(),_idPessoa);
    	usuarioService.associarDevice(idRegistro, idProjeto.trim(),	_idPessoa);
    	
    	return HTTPStatusCodeEnum.STATUS_200.getStatusCode();
    }
	
	@RequestMapping(value = "/obter_ronda/{idUsuario}", method=RequestMethod.GET)
	public @ResponseBody RondaDTO obterRondaPorUsuario(@PathVariable("idUsuario") String idUsuario){
		logger.debug("LoginEndPoint.obterRondaPorUsuario");
		Long idUsuarioLong = Long.parseLong(idUsuario);
		
		return rondaService.obterEmAndamentoPorUsuario(idUsuarioLong);		
	} 
    
}