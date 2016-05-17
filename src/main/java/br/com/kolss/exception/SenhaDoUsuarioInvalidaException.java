package br.com.kolss.exception;

public class SenhaDoUsuarioInvalidaException extends LoginException {

	private static String mensagemDaException = "Senha Incorreta";

    public SenhaDoUsuarioInvalidaException() {
        super(mensagemDaException);
    }
    

    @Override
    public String toString() {
    	return mensagemDaException;
    }

}