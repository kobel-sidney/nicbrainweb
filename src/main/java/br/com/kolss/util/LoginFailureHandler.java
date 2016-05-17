package br.com.kolss.util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import br.com.kolss.exception.SenhaDoUsuarioInvalidaException;
import br.com.kolss.exception.UsuarioNaoExisteException;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.repository.UsuarioRepository;

@Component
public final class LoginFailureHandler implements AuthenticationFailureHandler{

protected Logger logger=Logger.getLogger(getClass());

@Autowired
protected UsuarioRepository usuarioRepository;

@Override
public void onAuthenticationFailure(HttpServletRequest request,
        HttpServletResponse response,AuthenticationException exception)
        throws IOException,ServletException{

        try{

        String emailDoUsuario=request.getParameter("j_username");

        request.getSession().setAttribute("emailDoUsuario",emailDoUsuario);

        Usuario usuarioQueEstaTentandoLogar=usuarioRepository
        .getUsuarioPorEmail(emailDoUsuario);

        if(usuarioQueEstaTentandoLogar==null){
        request.getSession().setAttribute("LoginException",new UsuarioNaoExisteException());
        }else{
        request.getSession().setAttribute("LoginException",new SenhaDoUsuarioInvalidaException());
        }

        response.sendRedirect("login.nicbrain");

        }catch(Exception e){
        // TODO: handle exception
        logger.error("Problema na Classe que trata a Falha na Autenticação: "+e.getLocalizedMessage());
        }

        return;

        }

        }