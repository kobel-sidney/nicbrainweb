package br.com.kolss.exception;

public class UsuarioNaoEstaAtivoException extends LoginException {

	private static String mensagemDaException = "Usuario não está Ativo!";
	
    public UsuarioNaoEstaAtivoException() {
        super(mensagemDaException);
    }

}