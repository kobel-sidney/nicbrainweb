package br.com.kolss.util;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.Locale;

import org.apache.log4j.Logger;

/** Classe utilitária para formatar números. */
public class FormatterNumberUtil {
	
	protected static Logger logger = Logger.getLogger(FormatterNumberUtil.class);
	
	private static DecimalFormat decimalFormat =
			(DecimalFormat) DecimalFormat.getInstance(new Locale("pt", "BR"));
	
	/**
	 * Transforma uma String para 'double'.<br>
	 * Caso o formato seja inválido, será devolvido '0' (zero).
	 * 
	 * @return
	 */
	public static double parserToDouble(String strDouble) {
		
		double doubleValue;
		try {
			doubleValue = decimalFormat.parse(strDouble).doubleValue();
		} catch (ParseException e) {
			logger.error(
					"FormatterNumberUtil.parserToDouble Erro ao transformar String em double: "
							+ strDouble);
			doubleValue = 0d;
		}
		
		return doubleValue;
	}
	

	/**
	 * Converte uma ID que vem no formato String para o formato Long.<br>
	 * Caso não seja válido, irá retorna null.
	 * 
	 * @param id
	 * 
	 * @return
	 */
	public static Long converterId(String id) {
		Long _id = null;

		try {
			_id = Long.valueOf(id);
		} catch (Exception e) {
			_id = null;
		}

		return _id;
	}
	
}
