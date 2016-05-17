package br.com.kolss.bbeans;


import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.exception.LoginException;
import br.com.kolss.exception.SenhaDoUsuarioInvalidaException;
import br.com.kolss.exception.UsuarioNaoExisteException;
import br.com.kolss.exception.UsuarioNaoPossuiContextoException;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.LoginServiceImpl;
import br.com.kolss.service.UsuarioService;


@Controller(value = "bbLogin")
@Scope("session")
public class BbLogin {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private LoginServiceImpl loginService;
	@Autowired
	private UsuarioService usuarioService;
	
	private String nomeDoUsuario;
	private String senhaDoUsuario;
	private String emailDeConfirmacaoDaRegeracaoDeSenhaDoUsuario;
	
	private boolean oCampoDeEmailDoUsuarioDeveEstarFocado;
	private boolean oCampoDaSenhaDoUsuarioDeveEstarFocado;
	
	public String login() {
	    
 	    FacesContext facesContext = FacesContext.getCurrentInstance();
	    ExternalContext extenalContext = facesContext.getExternalContext();
	    
	    try {
	    	
	    	RequestDispatcher dispatcher = ((ServletRequest)extenalContext.getRequest()).getRequestDispatcher("/j_spring_security_check");
		    dispatcher.forward((ServletRequest)extenalContext.getRequest(), (ServletResponse)extenalContext.getResponse());
		    facesContext.responseComplete();
		    			
		} catch (Exception e) {
		
			logger.info("Problemas no Login do Usuário: " + e.getLocalizedMessage());
			
		}
	    
	    return null;
	}
	
	public String avancaParaAConfirmacaoDaRegeracaoDaSenha() {
	    
	    FacesContext facesContext = FacesContext.getCurrentInstance();
	    NavigationHandler navigationHandler = facesContext.getApplication().getNavigationHandler();
	    
	    try {		
			
	    	navigationHandler.handleNavigation(facesContext, null, "/confirmacaoDaRegeracaoDaSenha.nicbrain");
			
		} catch (Exception e) {
			logger.info("Problema ao avançar do Login para o confirmacaoDaRegeracaoDaSenha");
		}
	    
	    return null;
	}
	
	public String confirmacaoDaRegeracaoDaSenha(){
		
		FacesContext facesContext = FacesContext.getCurrentInstance();
	    NavigationHandler navigationHandler = facesContext.getApplication().getNavigationHandler();
	    
	    HttpServletRequest servletRequest = (HttpServletRequest) facesContext.getExternalContext().getRequest();
	    StringBuffer fullURI = servletRequest.getRequestURL();
	    
	    String pathDoUriDeEnvioParaOEmail = fullURI.toString().split("/")[2];
	    
	    try {
	    
	    	if (loginService.oUsuarioCujaSenhaSeraRegeradaExiste(emailDeConfirmacaoDaRegeracaoDeSenhaDoUsuario)){
	    		    	
	    		Usuario usuario = usuarioService.getUsuarioPorEmail(emailDeConfirmacaoDaRegeracaoDeSenhaDoUsuario);
	    		
				if(loginService.regerarSenhaDoUsuario(usuario, pathDoUriDeEnvioParaOEmail)){
					
					navigationHandler.handleNavigation(facesContext, null, "/emailDeRegeracaoDaSenhaEnviado.nicbrain");
					
				} else {
			    	
					FacesContext.getCurrentInstance().addMessage(null, 
				              new FacesMessage(FacesMessage.SEVERITY_ERROR,
				                "Não foi possível regerar a sua senha!", "Não foi possível regerar a sua senha!"));
					
				}
				
	    	} else {
	    		
	    		FacesContext.getCurrentInstance().addMessage(null, 
			              new FacesMessage(FacesMessage.SEVERITY_ERROR,
			                "O Usuário não Existe!", "O Usuário não Existe!"));
	    		
	    	}
			
	    } catch (Exception e) {
			logger.info("Problema ao avançar do confirmacaoDaRegeracaoDaSenha para o emailDeRegeracaoDaSenhaEnviado");
		}
		
		return null;
		
	}
	

	
	public String voltarParaTelaDeLogin() {
	    
	    FacesContext facesContext = FacesContext.getCurrentInstance();
	    NavigationHandler navigationHandler = facesContext.getApplication().getNavigationHandler();
	    
	    try {		
			
			navigationHandler.handleNavigation(facesContext, null, "/login.nicbrain");
			
		} catch (Exception e) {
			logger.info("Problema ao voltar para a tela de Login");
		}
	    
	    return null;
	}
	
	
	
	
	public String getNomeDoUsuario() {
		return nomeDoUsuario;
	}
	
	public void setNomeDoUsuario(String nomeDoUsuario) {
		this.nomeDoUsuario = nomeDoUsuario;
	}
	
	public String getSenhaDoUsuario() {
		return senhaDoUsuario;
	}
	
	public void setSenhaDoUsuario(String senhaDoUsuario) {
		this.senhaDoUsuario = senhaDoUsuario;
	}
	
	public boolean isCampoDeEmailDoUsuarioDeveEstarFocado(){
		return oCampoDeEmailDoUsuarioDeveEstarFocado;
	}
	
	public void setCampoDeEmailDoUsuarioDeveEstarFocado(boolean oCampoDeEmailDoUsuarioDeveEstarFocado){
		this.oCampoDeEmailDoUsuarioDeveEstarFocado = oCampoDeEmailDoUsuarioDeveEstarFocado;  
	}
	
	public boolean isCampoDaSenhaDoUsuarioDeveEstarFocado(){
		return oCampoDaSenhaDoUsuarioDeveEstarFocado;
	}
	
	public void setCampoDaSenhaDoUsuarioDeveEstarFocado(boolean oCampoDaSenhaDoUsuarioDeveEstarFocado){
		this.oCampoDaSenhaDoUsuarioDeveEstarFocado = oCampoDaSenhaDoUsuarioDeveEstarFocado;  
	}
	
	public String getEmailDeConfirmacaoDaRegeracaoDeSenhaDoUsuario() {
		return emailDeConfirmacaoDaRegeracaoDeSenhaDoUsuario;
	}

	public void setEmailDeConfirmacaoDaRegeracaoDeSenhaDoUsuario(
			String emailDeConfirmacaoDaRegeracaoDeSenhaDoUsuario) {
		this.emailDeConfirmacaoDaRegeracaoDeSenhaDoUsuario = emailDeConfirmacaoDaRegeracaoDeSenhaDoUsuario;
	}

	public void beforePhase(PhaseEvent event) {
		
		try {
		
			if (event.getPhaseId().equals(PhaseId.RENDER_RESPONSE)){
				
				Exception e = (Exception) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("LoginException");
				 
		        if (e instanceof LoginException) {
		        	
		        	if (e instanceof SenhaDoUsuarioInvalidaException){
		        		
		        		setCampoDeEmailDoUsuarioDeveEstarFocado(false);
		        		setCampoDaSenhaDoUsuarioDeveEstarFocado(true);
		        		
		        	}
		        	
		        	if (e instanceof UsuarioNaoExisteException || e instanceof UsuarioNaoPossuiContextoException){
		        		
		        		setCampoDeEmailDoUsuarioDeveEstarFocado(true);
		        		setCampoDaSenhaDoUsuarioDeveEstarFocado(false);
		        		
		        	}
		        	
		            FacesContext.getCurrentInstance().addMessage("LoginException", 
		              new FacesMessage(FacesMessage.SEVERITY_ERROR,
		                e.getLocalizedMessage(), e.getMessage()));
		            
		            String nomeDoUsuario = (String)FacesContext.getCurrentInstance().
		                    getExternalContext().getSessionMap().get("emailDoUsuario");
		            
		            setNomeDoUsuario(nomeDoUsuario);
		            
		        }   
	        }
			
		} catch (Exception e) {
			logger.info("Problemas no LoginPhaseListener: " + e.getLocalizedMessage());
		}
		
	}
	
	public void afterPhase(PhaseEvent event) {
		
		if (event.getPhaseId().equals(PhaseId.RENDER_RESPONSE)){
			FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("LoginException", null);
		}
	}
	
	
}