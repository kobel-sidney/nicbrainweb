package br.com.kolss.exception;

public class UsuarioNaoExisteException extends LoginException {

	private static String mensagemDaException = "Usuario não Existe";
	
    public UsuarioNaoExisteException() {
        super(mensagemDaException);
    }
    
    @Override
    public String toString() {
    	return mensagemDaException;
    }

}