package br.com.kolss.model.dao;

import br.com.kolss.model.entities.Usuario;


public interface UsuarioDao {
	
	/**
	 * 
	 * @param email
	 * @return
	 */
	Usuario obterUsuarioPorEmail(final String email);
	
	/**
	 * 
	 * @param nome
	 * @return
	 */
	Usuario obterUsuarioPorNome(final String nome);
}
