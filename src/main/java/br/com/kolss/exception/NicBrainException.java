package br.com.kolss.exception;

import java.text.MessageFormat;

public class NicBrainException extends RuntimeException {

    private static final long serialVersionUID = 3422494428743141388L;

    protected Object[] params;

    public NicBrainException(final String mensagem) {
        super(mensagem);
    }

    public NicBrainException(final String mensagem, final Object[] params) {
        super(MessageFormat.format(mensagem, params));
    }

    public NicBrainException(final String mensagem, final Throwable cause) {
        super(mensagem, cause);
    }

    public NicBrainException(final String mensagem, final Object[] params, final Throwable cause) {
        super(MessageFormat.format(mensagem, params), cause);
    }

    protected NicBrainException() {
        super();
    }

    public NicBrainException(final Throwable cause) {
        super(cause);
    }

    public Object[] getParams() {
        return params;
    }

}