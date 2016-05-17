package br.com.kolss.service.alerta;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.AtividadeMensagem;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.ChecklistMensagem;
import br.com.kolss.model.entities.Mensagem;
import br.com.kolss.service.AtividadeChecklistService;
import br.com.kolss.service.ChecklistService;
import br.com.kolss.service.MensagemService;
import br.com.kolss.service.MessageSenderServiceImpl;
import br.com.kolss.util.DataUtil;


/**
 * Regra 12: Sempre que um checklist ou atividade não for iniciado na data/hora
 *  prevista.
 * 
 * 
 * Esta regra é dispara quando:
 * <ul>
 * <li>A) Atributo Ativo for igual a "true"</li>
 * <li>B) O Status diferente de "Em Andamento"</li>
 * <li>C) Não houver nenhuma Mensagem com ID = 12 para esta Atividade/Checklist</li>
 * <li>D) Quanto a "<b>Data de Início Realizada</b>" for igual a <i>null</i></li>
 * <li>Quanto o "<b>Data e Hora Corrente</b>":
 * 	<ul>
 * 		<li>E) For maior que "Data de Início Previsto" + "1 minuto"</li>
 * 		<li>F) For maior que "Data de Início Previsto" + "Tempo de Tolerancia para Início"</li>
 * 	</ul>
 * </li>
 * </ul>
 */
@Service
public class InicioNaoRealizadoRegra {

	private static final Long ID_INICIO_NAO_REALIZADO = Long.valueOf(12);
	private static final int TOLERANCIA_MINIMA_MINUTO = 1; 
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private MessageSenderServiceImpl messageSenderService;
	
	@Autowired
	private MensagemService mensagemService;
	
	@Autowired
	private AtividadeChecklistService atividadeChecklistService;
	
	@Autowired
	private ChecklistService checklistService;
	
	
	@Scheduled(cron="0 */1 * * * ?")
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void executar() {
		logger.debug("InicioNaoRealizadoRegra.executar");
		
		Mensagem mensagem = mensagemService.obter(ID_INICIO_NAO_REALIZADO);
		Date dataEnvioMensagem = new Date();
		
		/* 01) Verifica as Atividades com início não realizado: */
		List<AtividadeMensagem> atvMensagens = 	getAtividadesMensagensComInicioNaoRealizadoSemAlerta(dataEnvioMensagem);
		for (AtividadeMensagem atvMsg : atvMensagens) {
			atvMsg.setDataEnvio(dataEnvioMensagem);
			
			StringBuilder tituloMensagem = new StringBuilder();
			tituloMensagem.append(mensagem.getTipoMensagem().getNome());
			tituloMensagem.append(": ");
			tituloMensagem.append(mensagem.getDescricao());
			tituloMensagem.append(" - ");
			tituloMensagem.append(DataUtil.formataData(dataEnvioMensagem));
			
			String corpoMensagem = montarCorpoMensagem(mensagem,atvMsg.getAtividade());
			boolean result =  messageSenderService.enviarMensagem(atvMsg.getAtividade(),ID_INICIO_NAO_REALIZADO,tituloMensagem.toString(),corpoMensagem);
			
			mensagemService.atualizar(atvMsg);
		}
			
			
		/* 02) Verifica os Checklist com início atrasado: */
		List<ChecklistMensagem> chkMensagens =
				getChecklistsMensagensComInicioNaoRealizadoSemAlerta(
						dataEnvioMensagem);
		for (ChecklistMensagem chkMsg : chkMensagens) {
			chkMsg.setDataEnvio(dataEnvioMensagem);
			
			StringBuilder tituloMensagem = new StringBuilder();
			tituloMensagem.append(mensagem.getTipoMensagem().getNome());
			tituloMensagem.append(": ");
			tituloMensagem.append(mensagem.getDescricao());
			tituloMensagem.append(" - ");
			tituloMensagem.append(DataUtil.formataData(dataEnvioMensagem));
			
			String corpoMensagem = montarCorpoMensagem(mensagem,
					chkMsg.getChecklist());
			messageSenderService.enviarMensagem(chkMsg.getChecklist(),
					ID_INICIO_NAO_REALIZADO,
					tituloMensagem.toString(),
					corpoMensagem);
			
			mensagemService.atualizar(chkMsg);
		}
	}
	
	/**
	 * Obtém as Atividades com início não realizado.
	 * 
	 * @param dataReferencia
	 * 
	 * @return
	 */
	private List<AtividadeMensagem> getAtividadesMensagensComInicioNaoRealizadoSemAlerta(
			Date dataReferencia) throws ServiceException {
		logger.debug("InicioNaoRealizadoRegra.getAtividadesMensagensComInicioNaoRealizadoSemAlerta");
		
		List<AtividadeMensagem> atvMensagens = mensagemService.obterAtividadesMensagensComInicioNaoRealizadoSemAlerta(dataReferencia);
		List<AtividadeMensagem> atvsAtraso = new ArrayList<AtividadeMensagem>();
		for (AtividadeMensagem atvMsg : atvMensagens) {
			Atividade atv = atvMsg.getAtividade();
			
			/*
			 * Tempo max (em minutos) de tolerancia entre o tempo previsto e o
			 * realizado.
			 */
			final int maxToleranciaMinutos = Math.max(TOLERANCIA_MINIMA_MINUTO,
					atv.getTempoToleranciaInicio());
			
			// Soma os minutos de tolerancia:
			Calendar calPrevistoComTolerancia = Calendar.getInstance();
			calPrevistoComTolerancia.setTime(atv.getDataInicioPrevisto());
			calPrevistoComTolerancia.add(Calendar.MINUTE, maxToleranciaMinutos);
			Date dtPrevistoComTolerancia = calPrevistoComTolerancia.getTime();
			
			/* Regras 'E' e 'F' */
			if (dataReferencia.after(dtPrevistoComTolerancia)) {
				atvsAtraso.add(atvMsg);
			}
		}
		
		return atvsAtraso;
	}
	
	/**
	 * Obtém os Checklist com início não realizado.
	 * 
	 * @param dtAtual
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	private List<ChecklistMensagem> getChecklistsMensagensComInicioNaoRealizadoSemAlerta(
			Date dtAtual) throws ServiceException {
		logger.debug("InicioNaoRealizadoRegra.getChecklistMensagensComInicioNaoRealizadoSemAlerta");
		
		List<ChecklistMensagem> chkMensagens =
				mensagemService.obterChecklistsMensagensComInicioNaoRealizadoSemAlerta(
						dtAtual);
		List<ChecklistMensagem> chkAtraso = new ArrayList<ChecklistMensagem>();
		for (ChecklistMensagem chkMsg : chkMensagens) {
			Checklist chk =  chkMsg.getChecklist();
			
			/*
			 * Tempo max (em minutos) de tolerancia entre o tempo previsto e o
			 * realizado.
			 */
			final int maxToleranciaMinutos = Math.max(
					TOLERANCIA_MINIMA_MINUTO,
					chk.getTempoToleranciaFim());
			
			// Soma os minutos de tolerancia:
			Calendar calPrevistoComTolerancia = Calendar.getInstance();
			calPrevistoComTolerancia.setTime(chk.getDataInicioPrevisto());
			calPrevistoComTolerancia.add(Calendar.MINUTE, maxToleranciaMinutos);
			Date dtPrevistoComTolerancia = calPrevistoComTolerancia.getTime();
			
			/* Regras 'E' e 'F' */
			if (dtAtual.after(dtPrevistoComTolerancia)) {
				chkAtraso.add(chkMsg);
			}
		}
		
		return chkAtraso;
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
		logger.debug("InicioNaoRealizadoRegra.corpoMensagem(atividade)");
		
		Atividade atv = atividadeChecklistService.obter(atividade.getId());
		
		String quebraLinha = System.getProperty("line.separator");
		StringBuilder corpoMensagem = new StringBuilder();
		corpoMensagem.append("Mensagem: ");
		corpoMensagem.append(mensagem.getDescricao());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Prevista: ");
		corpoMensagem.append(atividade.getDataInicioPrevisto());
		corpoMensagem.append(quebraLinha);
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
	
	/**
	 * Monta o corpo da Mensagem a ser enviada.
	 * 
	 * @param mensagem
	 * @param checklist
	 * 
	 * @return
	 */
	private String montarCorpoMensagem(Mensagem mensagem, Checklist checklist) {
		
		logger.debug("InicioNaoRealizadoRegra.corpoMensagem(checklist)");
		
		Checklist chk = checklistService.obter(checklist.getId());
		
		String quebraLinha = System.getProperty("line.separator");
		StringBuilder corpoMensagem = new StringBuilder();
		corpoMensagem.append("Mensagem: ");
		corpoMensagem.append(mensagem.getDescricao());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Prevista: ");
		corpoMensagem.append(checklist.getDataInicioPrevisto());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Local: ");
		corpoMensagem.append(chk.getEvento().getLocal().getNome());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Evento: ");
		corpoMensagem.append(chk.getEvento().getNome());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Checklist: ");
		corpoMensagem.append(chk.getNome());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Responsável: ");
		corpoMensagem.append(chk.getUsuarioResponsavel().getPessoa().getNome());
		corpoMensagem.append(quebraLinha);
		
		return corpoMensagem.toString();
	}
	
}
