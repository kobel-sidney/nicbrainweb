package br.com.kolss.bbeans;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


@Controller(value = "bbUtil")
@Scope("request")
public class BbUtil {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	
	/**
	 * Retorna o valor (em milissegundos) do horário corrente do servidor.<br>
	 * Utilizado como parâmetro para forçar o <i>refresh</i> das páginas JSF.<br>
	 * <br>
	 * Pode ser utilizado para evitar problemas de cache nas imagens do
	 * primefaces.
	 * 
	 * @see Mais detalhes: <a href="http://forum.primefaces.org/viewtopic.php?f=3&t=34206">http://forum.primefaces.org/viewtopic.php?f=3&t=34206</a>
	 * 
	 * @return
	 */
	public long getTimemillis() {
		logger.debug("BbUtil.getTimemillis");
		return System.currentTimeMillis();
	}

}
