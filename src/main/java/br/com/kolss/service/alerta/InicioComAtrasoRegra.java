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
 * Regra 13: Sempre que um checklist ou atividade for iniciado após a data/hora
 *  prevista.
 * 
 * 
 * Esta regra é dispara quando:
 * <ul>
 * <li>A) Atributo Ativo for igual a "true"</li>
 * <li>B) O Status estiver em "Em Andamento"</li>
 * <li>C) Não houver nenhuma Mensagem com ID = 13 para esta Atividade/Checklist</li>
 * <li>Quanto a "<b>Data de Início Realizada</b>":
 * 	<ul>
 * 		<li>D) For diferente de <i>null</i></li>
 * 		<li>E) For maior que "Data de Início Previsto" + "1 minuto"</li>
 * 		<li>F) For maior que "Data de Início Previsto" + "Tempo de Tolerancia para Início"</li>
 * 	</ul>
 * </li>
 * </ul>
 */
@Service
public class InicioComAtrasoRegra {
	
	private static final Long ID_INICIO_COM_ATRASO = Long.valueOf(13);
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
	
	
	@Scheduled(cron="10 */1 * * * ?")
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void executar() {
		
		logger.debug("InicioComAtrasoRegra.executar");
		
		Mensagem mensagem = mensagemService.obter(ID_INICIO_COM_ATRASO);
		Date dataEnvioMensagem = new Date();
		
		/* 01) Verifica as Atividades com início atrasado: */
		List<AtividadeMensagem> atvMensagens =
				getAtividadesMensagensComInicioAtrasadoSemAlerta();
		for (AtividadeMensagem atvMsg : atvMensagens) {
			atvMsg.setDataEnvio(dataEnvioMensagem);
			
			StringBuilder tituloMensagem = new StringBuilder();
			tituloMensagem.append(mensagem.getTipoMensagem().getNome());
			tituloMensagem.append(": ");
			tituloMensagem.append(mensagem.getDescricao());
			tituloMensagem.append(" - ");
			tituloMensagem.append(DataUtil.formataData(dataEnvioMensagem));
			
			String corpoMensagem = montarCorpoMensagem(mensagem,
													   atvMsg.getAtividade());
			
			messageSenderService.enviarMensagem(atvMsg.getAtividade(),
												ID_INICIO_COM_ATRASO,
												tituloMensagem.toString(),
												corpoMensagem);
			
			mensagemService.atualizar(atvMsg);
		}
		
		
		/* 02) Verifica os Checklist com início atrasado: */
		List<ChecklistMensagem> chkMensagens =
				getChecklistMensagensComInicioAtrasadoSemAlerta();
		
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
												ID_INICIO_COM_ATRASO,
												tituloMensagem.toString(),
												corpoMensagem);
			
			mensagemService.atualizar(chkMsg);
		}
	}
	
	
	/**
	 * Retorna a(s) Atividade(s) com Início Atrasado que ainda não tem Alertas.
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	private List<AtividadeMensagem> getAtividadesMensagensComInicioAtrasadoSemAlerta()
			throws ServiceException {
		logger.debug("InicioComAtrasoRegra.getAtividadesComInicioAtrasadoSemAlerta");
		
		List<AtividadeMensagem> atvMensagens =
				mensagemService.obterAtividadesMensagensComInicioAtrasadoSemAlerta();
		List<AtividadeMensagem> atvsAtraso = new ArrayList<AtividadeMensagem>();
		for (AtividadeMensagem atvMsg : atvMensagens) {
			Atividade atv = atvMsg.getAtividade();
			
			/*
			 * Tempo max (em minutos) de tolerancia entre o tempo previsto e o
			 * realizado.
			 */
			final int maxToleranciaMinutos = Math.max(
					TOLERANCIA_MINIMA_MINUTO,
					atv.getTempoToleranciaInicio());
			
			// Soma os minutos de tolerancia:
			Calendar calPrevistoComTolerancia = Calendar.getInstance();
			calPrevistoComTolerancia.setTime(atv.getDataInicioPrevisto());
			calPrevistoComTolerancia.add(Calendar.MINUTE, maxToleranciaMinutos);
			Date dtPrevistoComTolerancia = calPrevistoComTolerancia.getTime();
			
			/* Regras 'E' e 'F' */
			if (atv.getDataInicioRealizado().after(dtPrevistoComTolerancia)) {
				atvsAtraso.add(atvMsg);
			}
		}
		
		return atvsAtraso;
	}

	/**
	 * Retorna o(s) Checklist(s) com Início Atrasado que ainda não tem Alertas.
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	private List<ChecklistMensagem> getChecklistMensagensComInicioAtrasadoSemAlerta()
			throws ServiceException {
		logger.debug("InicioComAtrasoRegra.getChecklistMensagensComInicioAtrasadoSemAlerta");
		
		List<ChecklistMensagem> chkMensagens =
				mensagemService.obterChecklistsMensagensComInicioAtrasadoSemAlerta();
		
		List<ChecklistMensagem> chkAtraso = new ArrayList<ChecklistMensagem>();
		for (ChecklistMensagem chkMsg : chkMensagens) {
			Checklist chk =  chkMsg.getChecklist();
			
			/*
			 * Tempo max (em minutos) de tolerancia entre o tempo previsto e o
			 * realizado.
			 */
			final int maxToleranciaMinutos = Math.max(TOLERANCIA_MINIMA_MINUTO,
					chk.getTempoToleranciaInicio());
			
			// Soma os minutos de tolerancia:
			Calendar calPrevistoComTolerancia = Calendar.getInstance();
			calPrevistoComTolerancia.setTime(chk.getDataInicioPrevisto());
			calPrevistoComTolerancia.add(Calendar.MINUTE, maxToleranciaMinutos);
			Date dtPrevistoComTolerancia = calPrevistoComTolerancia.getTime();
			
			/* Regras 'E' e 'F' */
			if (chk.getDataInicioRealizado().after(dtPrevistoComTolerancia)) {
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
		logger.debug("InicioComAtrasoRegra.corpoMensagem(atividade)");
		
		Atividade atv = atividadeService.obter(atividade.getId());
		
		String quebraLinha = System.getProperty("line.separator");
		StringBuilder corpoMensagem = new StringBuilder();
		corpoMensagem.append("Mensagem: ");
		corpoMensagem.append(mensagem.getDescricao());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Prevista: ");
		corpoMensagem.append(atividade.getDataInicioPrevisto());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Realizado: ");
		corpoMensagem.append(atividade.getDataInicioRealizado());
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
		logger.debug("InicioComAtrasoRegra.corpoMensagem(checklist)");
		
		Checklist chk = checklistService.obter(checklist.getId());
		
		String quebraLinha = System.getProperty("line.separator");
		StringBuilder corpoMensagem = new StringBuilder();
		corpoMensagem.append("Mensagem: ");
		corpoMensagem.append(mensagem.getDescricao());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Prevista: ");
		corpoMensagem.append(checklist.getDataInicioPrevisto());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Realizado: ");
		corpoMensagem.append(checklist.getDataInicioRealizado());
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
