package br.com.kolss.service;

import java.util.Date;
import java.util.Random;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.model.entities.RegeracaoSenha;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.enuns.RegeracaoSenhaStatusEnum;
import br.com.kolss.util.NicBrainUtil;


@Service
public class LoginServiceImpl {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private RegeracaoSenhaService regeracaoSenhaService;
	
	@Autowired
	private MessageSenderServiceImpl messageSenderService;
	
	public LoginServiceImpl(){
	}


	public boolean regerarSenhaDoUsuario(Usuario usuario, String dominio){
		logger.debug("LoginServiceImpl.regerarSenhaDoUsuario");
		
		try {
		
			String codigoDeHash = geradorCodigoHash(usuario);
			
			RegeracaoSenha rSenha = new RegeracaoSenha();
			rSenha.setHashValidacao(codigoDeHash);
			rSenha.setDataSolicitacao(new Date());
			rSenha.setStatus(RegeracaoSenhaStatusEnum.EM_ANDAMENTO);
			rSenha.setExpirado(false);
			rSenha.setUsuario(usuario);
			
			regeracaoSenhaService.salvar(rSenha);
			
			//Inverte o Hash, sendo mais uma opção de segurança
			codigoDeHash = new StringBuilder(codigoDeHash).reverse().toString();
			
			String tituloDaMensagem = "Regeração de Senha";
			String mensagem = 	"<html> " + 
								"	<head> " + 
									"	<style type=\"text/css\"> " + 
									"	  a:link { " + 
									"		  font: bold 11px Arial; " +
									"		  text-decoration: none; " +
									"		  background-color: #EEEEEE; " +
									"		  color: #333333; " +
									"		  padding: 2px 6px 2px 6px; " +
									"		  border-top: 1px solid #CCCCCC; " +
									"		  border-right: 1px solid #333333; " +
									"		  border-bottom: 1px solid #333333; " +
									"		  border-left: 1px solid #CCCCCC; " +
									"		} " +
									"	</style> " +
								"	<head> " + 
								"		<body> " + 
								 
								"			<p>Clique Abaixo para Regerar a sua Senha!</p><br/><br/> " + 
								"			<input type=\"hidden\" name=\"hash\" value=\"" + codigoDeHash + "\" /> " + 
								"			<a href=\"http://" + dominio + "/nicBrain/regeracaoDaSenha.nicbrain?hash=" + codigoDeHash + "\">Regerar Senha</a> " + 
								
								"		</body> " + 
								"</html> ";
			messageSenderService.enviarMensagemHtmlParaUsuario(usuario,
					tituloDaMensagem, mensagem);
			return true;
			
			
		} catch (Exception e) {
			logger.info("Problema ao Regerar a Senha do Usuário: " + e.getLocalizedMessage());
			return false;
		}
		
	}
	
	public boolean oUsuarioCujaSenhaSeraRegeradaExiste(String emailDoUsuario){
		
		if (usuarioService.getUsuarioPorEmail(emailDoUsuario) != null){
			return true;
		}else{
			return false;
		}
		
	}
	
	/**
	 * Gera um Código Hash para ser usado como chave de validação para a
	 * solicitação de nova senha.
	 * 
	 * @param usuario
	 * 
	 * @return
	 */
	private String geradorCodigoHash(Usuario usuario) {
		logger.debug("LoginServiceImpl.geradorCodigoHash");
		
		StringBuilder seedKey = new StringBuilder();
		seedKey.append(usuario.getNome());
		seedKey.append(usuario.getSenha());
		seedKey.append(usuario.getDataUltimoLogin());
		seedKey.append(usuario.getUltimoIP());
		seedKey.append(new Random().nextInt(1000));
		
		return NicBrainUtil.criptografarSenha(seedKey.toString());
	}

}