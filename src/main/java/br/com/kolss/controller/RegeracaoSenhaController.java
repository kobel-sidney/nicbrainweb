package br.com.kolss.controller;

import java.io.IOException;
import java.util.Date;

import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.RegeracaoSenha;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.enuns.RegeracaoSenhaStatusEnum;
import br.com.kolss.service.RegeracaoSenhaService;
import br.com.kolss.service.UsuarioService;
import br.com.kolss.util.NicBrainUtil;


@Controller(value = "regeracaoDaSenhaBean")
@Scope("session")
public class RegeracaoSenhaController {
	
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private RegeracaoSenhaService regeracaoSenhaService;

	
	private Usuario usuario;
	private String senhaNova;
	private Long idUsuario;
		
	public RegeracaoSenhaController(){
		
	}
					
	/**
	 * Atualiza a senha
	 *   
	 * @return
	 * @throws IOException
	 */
	public String atualizaSenha() {
		
		logger.debug("RegeracaoSenhaController.atualizaSenha");
		
		try {
									
			Usuario usuario = getUsuario();
			
			usuario.setSenha(NicBrainUtil.criptografarSenha(getSenhaNova()));

			usuario.setDataUltimoLogin(new Date());
			
			usuarioService.atualizar(usuario);
			
			RegeracaoSenha regeracaoSenha = regeracaoSenhaService.getEmAndamentoPorUsuario(usuario);
			regeracaoSenha.setDataEncerramento(new Date());
			regeracaoSenha.setStatus(RegeracaoSenhaStatusEnum.CONCLUIDO);
			
			regeracaoSenhaService.salvar(regeracaoSenha);

						
			return "/login.nicbrain";
		
		
		} catch(Exception e) {
			
			e.printStackTrace();
				
			// Falha na troca de senha:
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, 
							"Um problema aconteceu na regeração da senha!",
							""));
			
			return null;
			
		}
		
		
	}
	
	public String validaRegeracaoDeEmail(String hash){
		
		try {
			
			//Inverte novamente a String que é invertida no começo do Processo
			hash = new StringBuilder(hash).reverse().toString();
			
			//Procura pelo Hash para Ver se a Requisição é Valida
			RegeracaoSenha regeracaoSenha = regeracaoSenhaService.getPorHashDeValidacacaoNaoExpirado(hash);
			
			if (regeracaoSenha == null){
				
				avancaParaLinkInvalido();
				
			} else {
			
				if (hash.equals(regeracaoSenha.getHashValidacao())){
					
					//Expira o Hash
					regeracaoSenha.setDataTentativa(new Date());
					regeracaoSenha.setStatus(RegeracaoSenhaStatusEnum.EM_ANDAMENTO);
					regeracaoSenhaService.atualizar(regeracaoSenha);

					setUsuario(regeracaoSenha.getUsuario());
					
					//Expira todos os outros Hashs de Pessoa
					regeracaoSenhaService.expiraTodasAsRegeracoesQueNaoPossuemTentativaPorUsuario(getUsuario());
										
				} else {
					avancaParaLinkInvalido();
				}
				
			}			
			
		} catch (Exception e) {
			logger.info("Problema na Validação do Hash na Regeneração da Senha: " + e.getLocalizedMessage());
			return null;
		}
		
		return null;
		
	}
		
	public String avancaParaLinkInvalido() {
	    
	    FacesContext facesContext = FacesContext.getCurrentInstance();
	    NavigationHandler navigationHandler = facesContext.getApplication().getNavigationHandler();
	    
	    try {		
	    	facesContext.getExternalContext().dispatch("/linkInvalido.nicbrain");
	    	facesContext.responseComplete();
	    	//navigationHandler.handleNavigation(facesContext, null, "/linkInvalido.nicbrain");
			
		} catch (Exception e) {
			logger.info("Problema ao avançar da Validação do Hash para o linkInvalido");
		}

	    return null;
	    
	}
	
	public String getSenhaNova() {
		return senhaNova;
	}

	public void setSenhaNova(String senhaNova) {
		this.senhaNova = senhaNova;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
		this.idUsuario = usuario.getId();
	}
	
	public long getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(long idUsuario) {
		this.idUsuario = idUsuario;
	}

	public void beforePhase(PhaseEvent event) {
		
		try {
		
			if (event.getPhaseId().equals(PhaseId.RENDER_RESPONSE)){
								
				String hashDeRegeracaoDoEmail = event.getFacesContext().getExternalContext().
												getRequestParameterMap().get("hash");
				
				if (hashDeRegeracaoDoEmail != null){
					if (!hashDeRegeracaoDoEmail.equals("")){
						validaRegeracaoDeEmail(hashDeRegeracaoDoEmail);
					}
				}
				
				   
	        }
			
		} catch (Exception e) {
			logger.info("Problemas no LoginPhaseListener: " + e.getLocalizedMessage());
		}
		
	}

	
}
