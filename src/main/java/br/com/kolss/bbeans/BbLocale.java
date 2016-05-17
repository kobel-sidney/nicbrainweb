package br.com.kolss.bbeans;

import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.event.AbortProcessingException;
import javax.faces.event.ActionEvent;
import javax.faces.event.ActionListener;
import javax.faces.event.ValueChangeEvent;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


@Controller(value = "bbLocale")
@Scope("request")
public class BbLocale implements ActionListener {
	
	/** Caminho do arquivo de Internacionalizacao de mensagens. */
	private static final String MESSAGE_BUNDLE = "i18n.MessagesBundle";
	
	public static final String SAVE_SUCCESSFULLY = "message.successfully.save";
	public static final String UPDATE_SUCCESSFULLY = "message.successfully.update";
	public static final String DELETE_SUCCESSFULLY = "message.successfully.delete";
	public static final String CANCEL_SUCCESSFULLY = "message.successfully.cancel";
	public static final String START_SUCCESSFULLY = "message.successfully.start";
	public static final String COMPLETE_SUCCESSFULLY = "message.successfully.complete";
	public static final String OPERATION_NOT_ALLOWED = "message.alert.operation_not_allowed";
	
	public static final String DELETE_ERROR = "message.error.delete";
	public static final String CONSTRAINT_ERROR = "message.constraint.error";
	
	protected static Logger logger = Logger.getLogger(BbLocale.class);
		
	
	/** Armazena o Locale corrente para os proximos <i>requests</i>. */
	private static Locale currentLocale = 
			FacesContext.getCurrentInstance().getApplication().getDefaultLocale();
	
	
	@Override
	public void processAction(final ActionEvent event)
			throws AbortProcessingException {
		final UIComponent component = event.getComponent();
		final String languageCode = getLanguageCode(component);
		FacesContext.getCurrentInstance().getViewRoot().setLocale(
				new Locale(languageCode));
		currentLocale = new Locale(languageCode);
	}

	private String getLanguageCode(final UIComponent component) {
		final Map<String, Object> attrs = component.getAttributes();
		return (String) attrs.get("languageCode");
	}
	
		
	/**
	 * Obtem mensagem internacionalizada.
	 * 
	 * @param key Chave para obter a mensagem internacionalizada.
	 * @return
	 */
	public static String getI18nMessage(String key) {
			
		String mensagem = null;
		
		ResourceBundle i18nMessages = ResourceBundle.getBundle(
				BbLocale.MESSAGE_BUNDLE, currentLocale);	
		
		try {
			
			mensagem = i18nMessages.getString(key);
			
		} catch (Throwable t) {
			logger.debug("Chave não encontrada no arquivo de Bunble: " + key);
			mensagem = null;			
		} 			
		
		return mensagem;		
	}
	
	/**
	 * Realiza a troca de idioma na aplicacao.
	 * Metodo utilizado anteriormente
	 * @param e
	 */
	public void changeLanguage(ValueChangeEvent e) {
		logger.debug("Troca de idioma");
		try {
			String newLanguage = e.getNewValue().toString();
			Locale newLocale = new Locale(newLanguage);
			FacesContext.getCurrentInstance().getViewRoot().setLocale(newLocale);
			currentLocale = newLocale;
		} catch (Exception ex) {
			logger.error("Erro na troca de idioma: " + ex);
			FacesContext.getCurrentInstance().getViewRoot().setLocale(
					currentLocale);
		}
		
		logger.debug("Idioma corrente: " + currentLocale);
	}	
		
	
	/**
	 * Retorna o Locale utilizado pela aplicacao.
	 * 
	 * @return
	 */
	public Locale getCurrentLocale() {
		return currentLocale;
	}
	
}
