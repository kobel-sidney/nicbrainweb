package br.com.kolss.webservice;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLEncoder;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.kolss.service.message.EmailMessageSender;
//



@Controller
@RequestMapping("/pushnotification")
public class PushNotificatioEndPoint {
	
	private final Logger logger = Logger.getLogger(this.getClass());
	private static final String DEVICE_REGISTRATION_ID = "APA91bEU5KTsum6z7e1xpYl6_5H1j_fk_G14LtYt6SBYg9OxZ2V3QmEKuSMRM5BCY-vYmwlQNwUzqRh1_MDMzV_RmcXQO0kMMTDfFeL67QW-atp_TI39N6ONcOtp9Vhq0zoRsgwib8xtBb9XXFw67l-R0ErEDSjj7xpaLFQbLDztl4gv4hZUjxY"; 
	  //private static final String DEVICE_REGISTRATION_ID ="APA91bHKwJApHBLkY1fyfKucQyhbiSRJa8u_jpzg9jVxErmbSRLfUlnegLeSgCCmiMV3YwFhO180FWbeQChMK7voODRwao91T4sMY-Q5e_LrDXctFSuXaFbgZkTgtWigkUcSuqZ5x5PnWMOFKdacacWsJ1Y2t7nZeisRbvbgiMZ1-JoYpVdJXCw";
	private static final String API_KEY = "AIzaSyC1xhzScQ9bkrz9hkcvVskaKNhEEl8bOuI";
	
	@Autowired
	protected EmailMessageSender emailSender;
	
	@RequestMapping(value = "/enviar/{tituloMensagem}/{corpoMensagem}", method = RequestMethod.GET)
    @ResponseBody
    public String enviarPush(@PathVariable String tituloMensagem, @PathVariable String corpoMensagem){
    	
    	logger.debug("PushNotificatioEndPoint.getImagem");
    	//emailSender.enviarPush(tituloMensagem, corpoMensagem);
    	try {
			enviar();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	return "OK"; 
	}
	
	
	public String enviar() throws IOException{
		// Par�metros necess�rios para o POST
				StringBuilder postBody = new StringBuilder();
				postBody.append("registration_id").append("=").append(DEVICE_REGISTRATION_ID);
				
				// Cria os par�metros chave=valor
				//Set<String> keys = params.keySet();
				//for (String key : keys) {
					//String value = params.get(key);
					//postBody.append("&").append("data.").append(key).append("=").append(URLEncoder.encode(value, "UTF-8"));
					postBody.append("&").append("data.").append("msg").append("=").append(URLEncoder.encode("mensagem do bigode", "UTF-8"));
				//}

				// Cria a mensagem
				byte[] postData = postBody.toString().getBytes("UTF-8");

				// Faz POST
				URL url = new URL("https://android.googleapis.com/gcm/send");
				HttpsURLConnection.setDefaultHostnameVerifier(new CustomizedHostnameVerifier());
				HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
				conn.setDoOutput(true);
				conn.setUseCaches(false);
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
				conn.setRequestProperty("Content-Length", Integer.toString(postData.length));
				conn.setRequestProperty("Authorization", "key=" + API_KEY);

				// L� a resposta
				OutputStream out = conn.getOutputStream();
				out.write(postData);
				out.close();

				int responseCode = conn.getResponseCode();
				if(responseCode == 200) {
					// OK
					String response = conn.getResponseMessage();
					return response;
				} else {
					System.err.println(responseCode + ": " + conn.getResponseMessage());
				}
				
				return null;
	}
	
	private static class CustomizedHostnameVerifier implements HostnameVerifier {
		public boolean verify(String hostname, SSLSession session) {
			return true;
		}
	}
	
}
