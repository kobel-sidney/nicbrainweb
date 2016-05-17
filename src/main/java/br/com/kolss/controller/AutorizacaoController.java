package br.com.kolss.controller;

import java.io.IOException;
import java.util.Date;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.UsuarioService;
import br.com.kolss.util.NicBrainUtil;


@Controller(value = "autorizacaoBean")
@Scope("request")
public class AutorizacaoController {
	
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private BbUsuarioLogado bbUsuarioLogado;
	
	@Autowired
	private UsuarioService usuarioService;
	
	private String senhaAtual;
	private String senhaNova;
	
	
	/**
	 * Atualiza a senha
	 *   
	 * @return
	 * @throws IOException
	 */
	public String updatePassword() throws IOException {
		logger.debug("AutorizacaoController.updatePassword");
		
		Usuario user = bbUsuarioLogado.getUserSession();
		
		String senhaAtualCriptografada = NicBrainUtil.criptografarSenha(this.getSenhaAtual());
		
		if (user.getSenha().equals(senhaAtualCriptografada)) {
			
			String senhaNovaCriptografada = NicBrainUtil.criptografarSenha(this.getSenhaNova());
			
			user.setDataPrimeiroAcesso(new Date());
			user.setSenha(senhaNovaCriptografada);
			usuarioService.atualizar(user);
			
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, 
							BbLocale.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY),
							""));
			FacesContext.getCurrentInstance().getExternalContext().redirect(
					"layout.nicbrain");
		} else {
			// Falha na troca de senha:
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, 
							BbLocale.getI18nMessage("message.alert.password_current_is_incorrect"),
							""));
		}
		
		return null;
	}
	
	
	public String getSenhaAtual() {
		return senhaAtual;
	}
	public void setSenhaAtual(String senhaAtual) {
		this.senhaAtual = senhaAtual;
	}
	public String getSenhaNova() {
		return senhaNova;
	}
	public void setSenhaNova(String senhaNova) {
		this.senhaNova = senhaNova;
	}
	
}
