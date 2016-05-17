package br.com.kolss.util;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.repository.UsuarioRepository;


@Component
public final class LoginSuccessHandler implements AuthenticationSuccessHandler {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	protected UsuarioRepository usuarioRepository;
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		logger.debug("LoginSuccessHandler.onAuthenticationSuccess");
    	
    	String userName = "";
		SecurityContext context = SecurityContextHolder.getContext();
		if (context instanceof SecurityContext) {
			authentication = context.getAuthentication();
			if (authentication instanceof Authentication) {
				userName = (((User) authentication.getPrincipal()).getUsername());
			}
		}
    	
		String redirectPath = "";
		if (userName != null) {
			request.getSession().setAttribute("usuario", userName);
			
			Usuario usuario = usuarioRepository.getUsuarioPorEmail(userName);
			
			usuario.setDataUltimoLogin(new Date());
			usuario.setUltimoIP(request.getRemoteAddr());
			
			//caso esteja nulo, grava a data do primeiro acesso;
			if (usuario.getDataPrimeiroAcesso() == null) {
//				usuario.setDtPrimeiroAcesso(new Date());
				redirectPath = "restrict/UpdatePassword.nicbrain";
			} else {
				redirectPath = "restrict/layout.nicbrain";
			}
			
			// Salva os dados do último login:
			usuarioRepository.atualizar(usuario);
		}
		
	    response.sendRedirect(redirectPath);
        return;
    }
	
}