package br.com.kolss.service;

import org.junit.Assert;
import org.junit.Test;

/**
 *
 * @author weverton
 */
public class PrimeiroTeste {

    //@Test
    public void ordemCrescente() {
        String nome = "Weverton";

        Assert.assertEquals("Weverton", nome);
    }

    //@Test
    public void ordemCrescente2() {
        String nome = "Weverton";

        Assert.assertEquals("weverton", nome);
    }

    //@Test
    public void ordemCrescente3() {
        String nome = "Weverton";

        Assert.assertEquals("ton", nome);
    }
}
