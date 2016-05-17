package br.com.kolss.exception;

public class DaoException extends NicBrainException {

    private static final long serialVersionUID = -8454540961921832433L;

    public DaoException(final String mensagem, final Throwable cause) {
        super(mensagem, cause);
    }

    public DaoException(final String mensagem, final Object[] params, final Throwable cause) {
        super(mensagem, params, cause);
    }

    public DaoException(final String mensagem) {
        super(mensagem);
    }

}
