package br.com.kolss.model.entities;


/** Define que uma entitade possui um Usuário Responsável. */
public interface UsuarioResponsavel {
	
	/** Retorna o Usuário Responsável do Entity. */
	Usuario getUsuarioResponsavel();
	
	/** Define o Usuário Responsavel do Entity. */
	void setUsuarioResponsavel(Usuario usuario);
	
}
