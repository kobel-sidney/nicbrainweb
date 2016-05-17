package br.com.kolss.bbeans;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.repository.UsuarioRepository;
import br.com.kolss.service.ContratanteService;


@Controller(value = "bbUsuarioLogado")
@Scope("request")
public class BbUsuarioLogado {

	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@Autowired
	private ContratanteService contratanteService;
	
	
	public BbUsuarioLogado() {
		
	}
	
	
	public Contratante obterContratanteUsuarioLogado(){
		return contratanteService.obterPorUsuario(getUserSession());
	}
	
	
	/**
	 * Retorna o Usuário Logado.
	 * 
	 * @return
	 */
	public Usuario getUserSession() {
		return usuarioRepository.getUsuarioPorEmail(getUserName());
	}
	
	/**
	 * Retorna a permissão do Usuário logado no formato String.
	 * 
	 * @return
	 */
	public String getUsuarioPermissao() {
		
		/* FIX ME: Comentado para que o Login Funcionasse, é preciso reavaliar o campo permissão
		Session session = FacesContextUtil.getRequestSession();
		Query query = session.createQuery(
//				"SELECT u.permissao FROM Usuario u, Pessoa p WHERE u.id.idPessoa = p.idPessoa AND u.ativo = true AND p.cpfPessoa = ?");
				"SELECT u.permissao FROM Usuario u, Pessoa p WHERE u.id.idPessoa = p.idPessoa AND u.ativo = true AND u.emailUsuario = ?");
		query.setString(0, getUserName());
		
		
		
		return (String) query.uniqueResult();
		
		*/
		
		String permissao = "ROLE_ADMIN";
		
		return permissao;
		
	}
	
	/**
	 * Retorna o userName do Usuário logado.
	 * 
	 * @return
	 */
	private String getUserName() {
		
		String login = "";
		SecurityContext context = SecurityContextHolder.getContext();
		if (context instanceof SecurityContext) {
			Authentication authentication = context.getAuthentication();
			if (authentication instanceof Authentication) {
				login = (((User) authentication.getPrincipal()).getUsername());
			}
		}
		
		return login;
	}
	
}