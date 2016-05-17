package br.com.kolss.exception;

public class LoginException extends NicBrainException {

    private static final long serialVersionUID = 6779633064380572209L;

    /**
     * Construtor definido para compatibilizada com API de checked Exception.
     * 
     * @param e
     */
    public LoginException(final Exception e) {
        super(e);
    }

    /**
     * Construtor recebe String e outra exception.
     * 
     * @param msg : mensagem do erro.
     * @param e : armazena a outra exception.
     */
    public LoginException(final String msg, final Exception e) {
        super(msg, e);
    }

    /**
     * Construtor recebe String e outra exception.
     * 
     * @param msg : mensagem do erro
     * @param params : paranetros que podem ser utilizados com bundle.
     */
    public LoginException(final String msg, final Object[] params) {
        super(msg);
        super.params = params;
    }

    /**
     * Construtor recebe String representando a mensagem do erro.
     * 
     * @param msg
     */
    public LoginException(final String msg) {
        super(msg);
    }

}