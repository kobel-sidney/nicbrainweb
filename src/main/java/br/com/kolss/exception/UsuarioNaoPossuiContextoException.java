package br.com.kolss.exception;

public class UsuarioNaoPossuiContextoException extends LoginException {
	
	private static String mensagemDaException = "Usuario não Possui Contexto";

    public UsuarioNaoPossuiContextoException() {
        super(mensagemDaException);
    }

}