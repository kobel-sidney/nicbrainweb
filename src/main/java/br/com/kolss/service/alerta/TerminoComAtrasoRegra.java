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
import br.com.kolss.service.AtividadeService;
import br.com.kolss.service.ChecklistService;
import br.com.kolss.service.MensagemService;
import br.com.kolss.service.MessageSenderServiceImpl;
import br.com.kolss.util.DataUtil;


/**
 * Regra 17: Sempre que um checklist ou uma atividade for concluído depois do
 * horário de término previsto.
 * 
 * 
 * Esta regra é dispara quando:
 * <ul>
 * <li>A) Atributo Ativo for igual a "true"</li>
 * <li>B) O Status estiver em "Finalizada"</li>
 * <li>C) Não houver nenhuma Mensagem com ID = 17 para esta Atividade/Checklist</li>
 * <li>Quanto a "<b>Data de Término Realizada</b>":
 * 	<ul>
 * 		<li>D) For diferente de <i>null</i></li>
 * 		<li>E) For maior que "Data de Término Previsto" + "1 minuto"</li>
 * 		<li>F) For maior que "Data de Término Previsto" + "Tempo de Tolerancia para Início"</li>
 * 	</ul>
 * </li>
 * </ul>
 */
@Service
public class TerminoComAtrasoRegra {

	private static final Long ID_TERMINO_COM_ATRASO = Long.valueOf(17);
	private static final int TOLERANCIA_MINIMA_MINUTO = 1; 
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private MessageSenderServiceImpl messageSenderService;
	
	@Autowired
	private MensagemService mensagemService;
	
	@Autowired
	private AtividadeService atividadeService;
	
	@Autowired
	private ChecklistService checklistService;
	
	
	@Scheduled(cron="30 */1 * * * ?")
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void executar() {
		logger.debug("TerminoComAtrasoRegra.executar");
		
		Mensagem mensagem = mensagemService.obter(ID_TERMINO_COM_ATRASO);
		Date dataEnvioMensagem = new Date();
		
		List<AtividadeMensagem> atvMensagens = getAtividadesMensagensComTerminoAtrasadoSemAlerta();
		for (AtividadeMensagem atvMsg : atvMensagens) {
			atvMsg.setDataEnvio(dataEnvioMensagem);
			
			StringBuilder tituloMensagem = new StringBuilder();
			tituloMensagem.append(mensagem.getTipoMensagem().getNome());
			tituloMensagem.append(": ");
			tituloMensagem.append(mensagem.getDescricao());
			tituloMensagem.append(" - ");
			tituloMensagem.append(DataUtil.formataData(dataEnvioMensagem));
			
			String corpoMensagem = montarCorpoMensagem(mensagem,atvMsg.getAtividade());
			messageSenderService.enviarMensagem(atvMsg.getAtividade(),ID_TERMINO_COM_ATRASO,tituloMensagem.toString(),corpoMensagem);
			
			mensagemService.atualizar(atvMsg);
		}
		
		
		/* 02) Verifica os Checklist com início atrasado: */
		List<ChecklistMensagem> chkMensagens =
				getChecklistMensagensComTerminoAtrasadoSemAlerta();
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
					ID_TERMINO_COM_ATRASO,
					tituloMensagem.toString(),
					corpoMensagem);
			
			mensagemService.atualizar(chkMsg);
		}
	}
	
	
	/**
	 * Retorna a(s) Atividade(s) com Término Atrasado que ainda não tem Alertas.
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	private List<AtividadeMensagem> getAtividadesMensagensComTerminoAtrasadoSemAlerta()	throws ServiceException {
		
		logger.debug("TerminoComAtrasoRegra.getAtividadesMensagensComTerminoAtrasadoSemAlerta");
		
		List<AtividadeMensagem> atvMensagens = mensagemService.obterAtividadesMensagensComTerminoAtrasadoSemAlerta();
		List<AtividadeMensagem> atvsAtraso = new ArrayList<AtividadeMensagem>();
		for (AtividadeMensagem atvMsg : atvMensagens) {
			Atividade atv = atvMsg.getAtividade();
			
			/*
			 * Tempo max (em minutos) de tolerancia entre o tempo previsto e o
			 * realizado.
			 */
			final int maxToleranciaMinutos = Math.max(
					TOLERANCIA_MINIMA_MINUTO,
					atv.getTempoToleranciaFim());
			
			// Soma os minutos de tolerancia:
			Calendar calPrevistoComTolerancia = Calendar.getInstance();
			calPrevistoComTolerancia.setTime(atv.getDataFimPrevisto());
			calPrevistoComTolerancia.add(Calendar.MINUTE, maxToleranciaMinutos);
			Date dtPrevistoComTolerancia = calPrevistoComTolerancia.getTime();
			
			/* Regras 'E' e 'F' */
			if (atv.getDataFimRealizado().after(dtPrevistoComTolerancia)) {
				atvsAtraso.add(atvMsg);
			}
		}
		
		return atvsAtraso;
	}

	/**
	 * Retorna o(s) Checklist(s) com Término Atrasado que ainda não tem Alertas.
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	private List<ChecklistMensagem> getChecklistMensagensComTerminoAtrasadoSemAlerta()
			throws ServiceException {
		logger.debug("TerminoComAtrasoRegra.getChecklistMensagensComTerminoAtrasadoSemAlerta");
		
		List<ChecklistMensagem> chkMensagens =
				mensagemService.obterChecklistsMensagensComTerminoAtrasadoSemAlerta();
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
			calPrevistoComTolerancia.setTime(chk.getDataFimPrevisto());
			calPrevistoComTolerancia.add(Calendar.MINUTE, maxToleranciaMinutos);
			Date dtPrevistoComTolerancia = calPrevistoComTolerancia.getTime();
			
			/* Regras 'E' e 'F' */
			if (chk.getDataFimRealizado().after(dtPrevistoComTolerancia)) {
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
		logger.debug("TerminoComAtrasoRegra.corpoMensagem(atividade)");
		
		Atividade atv = atividadeService.obter(atividade.getId());
		
		String quebraLinha = System.getProperty("line.separator");
		StringBuilder corpoMensagem = new StringBuilder();
		corpoMensagem.append("Mensagem: ");
		corpoMensagem.append(mensagem.getDescricao());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Prevista: ");
		corpoMensagem.append(atividade.getDataFimPrevisto());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Realizado: ");
		corpoMensagem.append(atividade.getDataFimRealizado());
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
		logger.debug("TerminoComAtrasoRegra.corpoMensagem(checklist)");
		
		Checklist chk = checklistService.obter(checklist.getId());
		
		String quebraLinha = System.getProperty("line.separator");
		StringBuilder corpoMensagem = new StringBuilder();
		corpoMensagem.append("Mensagem: ");
		corpoMensagem.append(mensagem.getDescricao());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Prevista: ");
		corpoMensagem.append(checklist.getDataFimPrevisto());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Realizado: ");
		corpoMensagem.append(checklist.getDataFimRealizado());
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
