package br.com.kolss.service.regras;

import java.io.Serializable;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.Mensagem;
import br.com.kolss.service.AtividadeChecklistService;
import br.com.kolss.service.MensagemService;
import br.com.kolss.service.MessageSenderServiceImpl;
import br.com.kolss.util.DataUtil;


/**
 * Implementa a regra de validação da Latitude e Longitude para as Atividades
 * do tipo Ronda.<br>
 * Caso a Latitude e/ou Longitudo estejam foram da "Distancia Limite", será
 * gerado um alerta.
 */
@Service
@Transactional(readOnly = true)
public class AtividadeRondaRegraServiceImpl implements AtividadeRondaRegraService {
	
	private static Long ID_ATIVIDADE_FORA_PERIMETRO = Long.valueOf(35);
	
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private AtividadeChecklistService atividadeService;
	
	@Autowired
	private MensagemService mensagemService;
	
	@Autowired
	private MessageSenderServiceImpl messageSenderService;
	
	
	/**
	 * Realiza a validação distância da Latitude e Longitude medida em relação
	 * à Latitude e Longitude referência da Atividade.
	 * 
	 * @param idAtividade
	 * @param latitudeUsuario
	 * @param longitudeUsuario
	 * @param idUsuarioResponsavel
	 * 
	 * @throws ServiceException
	 */
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void validarDistanciaLimite(Serializable idAtividade,
			String latitudeUsuario, String longitudeUsuario,
			Serializable idUsuarioResponsavel) throws ServiceException {
		logger.debug("AtividadeRondaRegra.validarDistanciaLimite");
		
		Atividade atividade = atividadeService.obter(idAtividade);
		String atvLtnStr = atividade.getLatitude();
		String atvLngStr = atividade.getLongitude();
		final Integer raioCircunferencia = atividade.getDistanciaLimite();
		
		// Atividade é do tipo "Ronda" e tem Latitude e Longitude válidos:
		if (atividade.isAtivo() && atividade.isCampoCheck()
				&& atvLtnStr != null && atvLngStr != null && raioCircunferencia!=null) {
			
			// Latitude de Longetudo do Usuários são válidos:
			if (latitudeUsuario != null && longitudeUsuario != null) {
				
				final double atvLtn = Double.valueOf(atvLtnStr);
				final double atvLng = Double.valueOf(atvLngStr);
				final double usrLtn = Double.valueOf(latitudeUsuario);
				final double usrLng = Double.valueOf(longitudeUsuario);
				
				
				/* 
				 * Equação para cálculo de distancia de ponto:
				 * distancia = [ ((centroX - pontoX) ^ 2) + ((centroY - pontoY) ^ 2) ] ^ (1/2)
				 * 
				 * Se a distancia for menor ou igual ao raio, o ponto esta dentro
				 * da circunferencia.
				 * ²
				 */
				double pontoX = Math.pow((atvLtn - usrLtn), 2);
				double pontoY = Math.pow((atvLng - usrLng), 2);
				double distanciaCentroPonto = Math.sqrt(pontoX + pontoY); 
				
				if (distanciaCentroPonto > raioCircunferencia.intValue()) {
					// Ponto fora da circunferencia - disparar alerta:
					
					Mensagem mensagem = mensagemService.obter(
							ID_ATIVIDADE_FORA_PERIMETRO);
					StringBuilder tituloMensagem = new StringBuilder();
					tituloMensagem.append(mensagem.getTipoMensagem().getNome());
					tituloMensagem.append(": ");
					tituloMensagem.append(mensagem.getDescricao());
					tituloMensagem.append(" - ");
					tituloMensagem.append(DataUtil.formataData(new Date()));
					
					String corpoMensagem = montarCorpoMensagem(mensagem,
							atividade);
					messageSenderService.enviarMensagem(atividade,
							ID_ATIVIDADE_FORA_PERIMETRO,
							tituloMensagem.toString(),
							corpoMensagem);

				} else {
					// Ponto dentro da circunferencia!
				}
				
			} else {
				// TODO: DISCUTIR A REGRA PARA latitude e longetude nulos!!!
			}
			
		}
	}
	
	/**
	 * Monta o corpo da Mensagem a ser enviada.
	 * 
	 * @param mensagem
	 * @param atividade
	 * 
	 * @return
	 */
	private String montarCorpoMensagem(Mensagem mensagem, Atividade atividade) {
		logger.debug("InicioComAtrasoRegra.corpoMensagem(atividade)");
		
		Atividade atv = atividadeService.obter(atividade.getId());
		
		String quebraLinha = System.getProperty("line.separator");
		StringBuilder corpoMensagem = new StringBuilder();
		corpoMensagem.append("Mensagem: ");
		corpoMensagem.append(mensagem.getDescricao());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Prevista: ");
		corpoMensagem.append(DataUtil.formataData(
				atividade.getDataInicioPrevisto()));
		corpoMensagem.append(quebraLinha);
		if (atividade.getDataInicioRealizado() != null) {
			corpoMensagem.append("Data/Hora Realizado: ");
			corpoMensagem.append(DataUtil.formataData(
					atividade.getDataInicioRealizado()));
			corpoMensagem.append(quebraLinha);
		}
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Local: ");
		corpoMensagem.append(atv.getChecklist().getEvento().getLocal().getNome());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Evento: ");
		corpoMensagem.append(atv.getChecklist().getEvento().getNome());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Checklist: ");
		corpoMensagem.append(atv.getChecklist().getNome());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Atividade: ");
		corpoMensagem.append(atv.getNumeroItem());
		corpoMensagem.append(" - ");
		corpoMensagem.append(atv.getNome());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Responsável: ");
		corpoMensagem.append(atv.getUsuarioResponsavel().getPessoa().getNome());
		corpoMensagem.append(quebraLinha);
		
		return corpoMensagem.toString();
	}
}
