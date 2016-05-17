package br.com.kolss.service.message;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Serializable;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.Set;

import javax.mail.internet.MimeMessage;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSession;

import org.apache.commons.mail.SimpleEmail;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;

import br.com.kolss.dto.MessagePushDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.ConfiguracaoEmail;
import br.com.kolss.model.entities.Device;
import br.com.kolss.model.entities.Funcionario;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.repository.ConfigContratanteRepository;
import br.com.kolss.model.repository.UsuarioRepository;


@Service
@Transactional(readOnly = true)
public class EmailMessageSenderImpl implements EmailMessageSender {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private ConfigContratanteRepository repository;
	
	@Autowired
	private UsuarioRepository usuarioRepository;
	
	
	/**
	 * Envia um email.<br>
	 *   
	 * @param idContratante
	 * @param titulo
	 * @param corpoMensagem
	 * @param emailDestinatario
	 * @param nomeDestinatario
	 * 
	 * @throws ServiceException
	 */
	@Override
	public void enviarNoFormatoHtml(Long idContratante, String titulo,
			String corpoMensagem, String emailDestinatario,
			String nomeDestinatario) throws ServiceException {
		logger.debug("EmailMessageSender.enviarNoFormatoHtml");
		
		ConfiguracaoEmail configEmail = repository.getConfiguracaoEmail(
				idContratante);
		if (configEmail == null) {
			throw new ServiceException(
					"Sem dados do servidor de email do Contratante: idContratante="
							+ idContratante);
		}
		
		try {
			enviarNoFormatoHtml(configEmail, titulo, corpoMensagem, emailDestinatario,
					nomeDestinatario);
		} catch(Exception e) {
			logger.debug(e.getMessage());
		}
	}
	
	/**
	 * Envia um email.<br>
	 *  
	 * @param idContratante
	 * @param titulo
	 * @param corpoMensagem
	 * @param funcionarios
	 * 
	 * @throws ServiceException
	 */
	@Deprecated
	@Override
	public void enviar(Long idContratante, String titulo, String corpoMensagem,
			Collection<Funcionario> funcionarios) throws ServiceException {
		logger.debug("EmailMessageSender.enviar");
		
		ConfiguracaoEmail configEmail = repository.getConfiguracaoEmail(
				idContratante);
		if (configEmail == null) {
			throw new ServiceException(
					"Sem dados do servidor de email do Contratante: idContratante="
							+ idContratante);
		}

		if (funcionarios != null && !funcionarios.isEmpty()) {
			for (Funcionario fnc : funcionarios) {

				try {
					if (fnc.getUsuario() != null) {
						String emailDestinatario = fnc.getUsuario().getEmail();
						String nomeDestinatario = fnc.getUsuario().getNome();
						
						enviar(configEmail, titulo, corpoMensagem,
								emailDestinatario, nomeDestinatario);
					}
				} catch (Exception e) {
					logger.debug(e.getMessage());
				}

			}
		}

	}
	
	@Override
	public void enviar(Serializable idContratante, String titulo,
			String corpoMensagem, Collection<Usuario> usuarios)
					throws ServiceException {
		logger.debug("EmailMessageSender.enviar(Serializable, String, String, Collection<Usuario>)");
		
		ConfiguracaoEmail configEmail = repository.getConfiguracaoEmail(
				idContratante);
		if (configEmail == null) {
			throw new ServiceException(
					"Sem dados do servidor de email do Contratante: idContratante="
							+ idContratante);
		}

		if (usuarios != null && !usuarios.isEmpty()) {
			for (Usuario user : usuarios) {
				try {
					String emailDestinatario = user.getEmail();
					String nomeDestinatario = user.getNome();
					
					enviar(configEmail, titulo, corpoMensagem,
							emailDestinatario, nomeDestinatario);
				} catch (Exception e) {
					logger.debug(e.getMessage());
				}
			}
		}
	}
	
	/**
	 * Realiza o envio do email utilizando os dados do servidor de email do
	 * Contratante.<br>
	 * Será enviado de forma <i>assincrona</i> quando for disparado por um 
	 * processo agendado.
	 * 
	 * @param configEmail
	 * @param titulo
	 * @param corpoMensagem
	 * @param emailDestinatario
	 * @param nomeDestinatario
	 * 
	 * @throws ServiceException
	 */
	@Async
	private void enviar(ConfiguracaoEmail configEmail, String titulo,
			String corpoMensagem, String emailDestinatario,
			String nomeDestinatario) throws ServiceException {
		
		logger.debug("EmailMessageSender.enviar(EmailconfigContratante)");
		
		try {
			SimpleEmail simpleEmail = new SimpleEmail();
			simpleEmail.setHostName(configEmail.getHostName());
			simpleEmail.addTo(emailDestinatario, nomeDestinatario);
			simpleEmail.setFrom(configEmail.getFromSender(), configEmail.getFromName());
			simpleEmail.setSubject(titulo);
			simpleEmail.setMsg(corpoMensagem);
			simpleEmail.setAuthentication(configEmail.getUserId(),configEmail.getPassword());
			simpleEmail.setSentDate(new Date());
			simpleEmail.setCharset("UTF-8");
			simpleEmail.setSmtpPort(configEmail.getSmtpPort());
			simpleEmail.setSSLOnConnect(configEmail.isSslOnConnect());
			simpleEmail.setStartTLSEnabled(configEmail.isStartTlsEnable());
			
			simpleEmail.send();
		} catch (Exception e) {
			throw new ServiceException("Erro ao enviar o email", e);
		}		
	}
	
	
	@Async
	private void enviarNoFormatoHtml(ConfiguracaoEmail configEmail,
			String titulo, String corpoMensagem,
			String emailDestinatario, String nomeDestinatario)
					throws ServiceException {
		
		logger.debug("EmailMessageSender.enviar(EmailconfigContratante)");
		
		try {
			
			JavaMailSenderImpl sender = new JavaMailSenderImpl();
			sender.setHost(configEmail.getHostName());
			sender.setPort(configEmail.getSmtpPort());
			sender.setUsername(configEmail.getUserId());
			sender.setPassword(configEmail.getPassword());
			
			MimeMessage message = sender.createMimeMessage();
			MimeMessageHelper simpleEmail = new MimeMessageHelper(message);
			
			//SimpleEmail simpleEmail = new SimpleEmail();
			//simpleEmail.setHostName(eConfig.getHostName());
			simpleEmail.addTo(emailDestinatario, nomeDestinatario);
			simpleEmail.setFrom(configEmail.getFromSender(), configEmail.getFromName());
			simpleEmail.setSubject(titulo);
			simpleEmail.setText(corpoMensagem, true);
			//simpleEmail.setAuthentication(eConfig.getUserId(),eConfig.getPassword());
			simpleEmail.setSentDate(new Date());
			//simpleEmail.setSmtpPort(eConfig.getSmtpPort());
			//simpleEmail.setSSLOnConnect(eConfig.isSslonConnect());
			//simpleEmail.setStartTLSEnabled(eConfig.isStartTlsEnabled());
			
			//simpleEmail.send();
			
			sender.send(message);
			
		} catch (Exception e) {
			throw new ServiceException("Erro ao enviar o email", e);
		}		
	}
	
	/**
	 * Push notification
	 */
	
	//Deletar aqui quando funcionar
	
	//	private static final String DEVICE_REGISTRATION_ID = "APA91bEU5KTsum6z7e1xpYl6_5H1j_fk_G14LtYt6SBYg9OxZ2V3QmEKuSMRM5BCY-vYmwlQNwUzqRh1_MDMzV_RmcXQO0kMMTDfFeL67QW-atp_TI39N6ONcOtp9Vhq0zoRsgwib8xtBb9XXFw67l-R0ErEDSjj7xpaLFQbLDztl4gv4hZUjxY"; 
	//	//private static final String DEVICE_REGISTRATION_ID ="APA91bHKwJApHBLkY1fyfKucQyhbiSRJa8u_jpzg9jVxErmbSRLfUlnegLeSgCCmiMV3YwFhO180FWbeQChMK7voODRwao91T4sMY-Q5e_LrDXctFSuXaFbgZkTgtWigkUcSuqZ5x5PnWMOFKdacacWsJ1Y2t7nZeisRbvbgiMZ1-JoYpVdJXCw";
	//	private static final String API_KEY = "AIzaSyC1xhzScQ9bkrz9hkcvVskaKNhEEl8bOuI";
	//	
	
	@Async
	@Override
	public void enviarPushs(Set<Usuario> usuariosANotificar,
			String tituloMensagem, String corpoMensagem) throws IOException {
		logger.debug("EmailMessageSender.enviarPushs");
		
		Iterator<Usuario> iterator = usuariosANotificar.iterator();
	    while(iterator.hasNext()) {
	    	Usuario usuario = iterator.next();
	        if(usuario != null){
	        	try {
	        		Device device = usuarioRepository.getDevice(usuario);
				    if (device != null && device.getIdRegistro() != null) {
				    	MessagePushDTO messagePushDTO = new MessagePushDTO();
				    	messagePushDTO.createData(tituloMensagem, corpoMensagem);
				    	messagePushDTO.addRegId(device.getIdRegistro());
				    	enviar(messagePushDTO);
				    }
				} catch (Exception e) {
					logger.info("Device nao registrado para o Usuario : " + usuario.getNome());
				}
	        	
	        }
	    }
		
		
	}
	
	@Async
	@Override
	public void enviarPushPorDevice(MessagePushDTO messagePushDTO) throws IOException{
	    enviar(messagePushDTO);
	}
	
	
	public String enviar(MessagePushDTO messagePushDTO) throws IOException {

		final String API_KEY = "AIzaSyDvoNdCGq3wI8LpOmIdvpPO003_V_og6HQ"; // antigo"AIzaSyC1xhzScQ9bkrz9hkcvVskaKNhEEl8bOuI";
		String response = null;

		try {
			URL url = new URL("https://gcm-http.googleapis.com/gcm/send");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "key=" + API_KEY);
			conn.setDoOutput(true);
			final OutputStream outputStream = new BufferedOutputStream(conn.getOutputStream());
			final JsonWriter writer = new JsonWriter(new OutputStreamWriter(outputStream, "UTF-8"));
			writer.setIndent("  ");
			Gson gson = new Gson();
			gson.toJson(messagePushDTO, MessagePushDTO.class, writer);
			writer.flush();
			writer.close();
			int responseCode = conn.getResponseCode();

			if (responseCode == 200) {
				response = conn.getResponseMessage();
			} else {
				logger.error(responseCode + ": " + conn.getResponseMessage());
			}

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return response;
	}
	
	public static class CustomizedHostnameVerifier implements HostnameVerifier {
		public boolean verify(String hostname, SSLSession session) {
			return true;
		}
	}
	
}
