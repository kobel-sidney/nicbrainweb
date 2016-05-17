package br.com.kolss.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;

public class NicBrainUtil {

    protected static Logger logger = Logger.getLogger(NicBrainUtil.class);

    /**
     * Realiza a criptografia da senha.<br>
     * (Encapsula o algoritmo de criptografia de senha).
     *
     * @param password
     * @return
     */
    public static String criptografarSenha(String password) {
        logger.debug("NicBrainUtil.criptografarSenha");

        /* Algoritmo de criptografia - Alterar aqui!*/
        return DigestUtils.sha256Hex(password);
    }

    public static String converterParaIso88591(String string) {
        Charset charsetUtf8 = Charset.forName("ISO-8859-1");
        CharsetEncoder encoder = charsetUtf8.newEncoder();

        Charset charsetIso88591 = Charset.forName("UTF-8");
        CharsetDecoder decoder = charsetIso88591.newDecoder();
        String s = "";
        try {
            ByteBuffer bbuf = encoder.encode(CharBuffer.wrap(string));

            CharBuffer cbuf = decoder.decode(bbuf);
            s = cbuf.toString();
        } catch (CharacterCodingException e) {

        }
        return s;
    }

    /**
     *
     * @param inputStream
     * @return
     * @throws IOException
     */
    public static String inputStreamToString(InputStream inputStream) throws IOException {
        String line = "";
        final StringBuilder total = new StringBuilder();
        //
        final BufferedReader rd = new BufferedReader(new InputStreamReader(inputStream, "UTF8"));

        while ((line = rd.readLine()) != null) {
            total.append(line);
        }

        return total.toString();
    }
}
