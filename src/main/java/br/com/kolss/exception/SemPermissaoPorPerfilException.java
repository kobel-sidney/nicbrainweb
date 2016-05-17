package br.com.kolss.exception;

import java.text.MessageFormat;


/** Exceção para quando o Usuário não possuir Permissão pelo seu perfil. */
public class SemPermissaoPorPerfilException extends NicBrainException {

	/** serialVersionUID */
	private static final long serialVersionUID = 5396763390581581853L;
	
	
	/** Método construtor padrão. */
	protected SemPermissaoPorPerfilException() {
		super();
	}
	
	/**
	 * Método construtor que recebe um objeto do tipo Throwable.
	 * 
	 * @param cause
	 */
	public SemPermissaoPorPerfilException(final Throwable cause) {
		super(cause);
	}
	
	/**
	 * Método construtor que recebe uma mensagem em formato String.
	 * 
	 * @param mensagem
	 */
	public SemPermissaoPorPerfilException(final String mensagem) {
		super(mensagem);
	}
	
	/**
	 * Método construtor que recebe uma mensagem em formato String e um
	 * array de parametros.
	 * 
	 * @param mensagem
	 * @param params
	 */
	public SemPermissaoPorPerfilException(final String mensagem,
			final Object[] params) {
		super(MessageFormat.format(mensagem, params));
	}
	
	/**
	 * Método construtor que recebe uma mensagem em formato String e um objeto 
	 * do tipo Throwable.
	 * 
	 * @param mensagem
	 * @param cause
	 */
	public SemPermissaoPorPerfilException(final String mensagem,
			final Throwable cause) {
		super(mensagem, cause);
	}
	
	/**
	 * Método construtor que recebe uma mensagem em formato String, um array 
	 * de parametros e um objeto do tipo Throwable.
	 * 
	 * @param mensagem
	 * @param params
	 * @param cause
	 */
	public SemPermissaoPorPerfilException(final String mensagem,
			final Object[] params, final Throwable cause) {
		super(MessageFormat.format(mensagem, params), cause);
	}
	
}
