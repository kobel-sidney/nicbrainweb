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
import br.com.kolss.model.repository.AtividadeRepository;
import br.com.kolss.model.repository.AtividadeRepositoryImpl;
import br.com.kolss.model.repository.ChecklistRepository;
import br.com.kolss.model.repository.ChecklistRepositoryImpl;
import br.com.kolss.model.repository.MensagemRepository;
import br.com.kolss.model.repository.MensagemRepositoryImpl;
import br.com.kolss.service.MessageSenderServiceImpl;
import br.com.kolss.util.DataUtil;


/**
 * Regra 15: Sempre que um checklist ou atividade não for finalizado na
 * data/hora prevista.
 * 
 * 
 * Esta regra é dispara quando:
 * <ul>
 * <li>A) Atributo Ativo for igual a "true"</li>
 * <li>B) O Status for diferente de "Concluído"</li>
 * <li>C) Não houver nenhuma Mensagem com ID = 15 para esta Atividade/Checklist</li>
 * <li>D) Quanto a "<b>Data de Término Realizada</b>" for igual a <i>null</i></li>
 * <li>Quanto o "<b>Data e Hora Corrente</b>":
 * 	<ul>
 * 		<li>E) For maior que "Data de Término Previsto" + "1 minuto"</li>
 * 		<li>F) For maior que "Data de Término Previsto" + "Tempo de Tolerancia para Término"</li>
 * 	</ul>
 * </li>
 * </ul>
 */
@Service
public class TerminoNaoRealizadoRegra {

	private static final Long ID_TERMINO_NAO_REALIZADO = Long.valueOf(15);
	private static final int TOLERANCIA_MINIMA_MINUTO = 1; 
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private MessageSenderServiceImpl messageSenderService;
	
	@Autowired
	private MensagemRepository mensagemRepository;
	
	@Autowired
	private AtividadeRepository atividadeRepository;
	
	@Autowired
	private ChecklistRepository checklistRepository;
		
	
	@Scheduled(cron="20 */1 * * * ?")
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void executar() {
		
		logger.debug("TerminoNaoRealizadoRegra.executar");
		
		Mensagem mensagem = mensagemRepository.obter(ID_TERMINO_NAO_REALIZADO);
		Date dataEnvioMensagem = new Date();
		
		/* 01) Verifica as Atividades com término não realizado: */
		List<AtividadeMensagem> atvMensagens =
				getAtividadesMensagensComTerminoNaoRealizadoSemAlerta(
						dataEnvioMensagem);
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
												ID_TERMINO_NAO_REALIZADO,
												tituloMensagem.toString(),
												corpoMensagem);
										
			mensagemRepository.atualizar(atvMsg);
		}		
		
		
		/* 02) Verifica os Checklist com início atrasado: */
		List<ChecklistMensagem> chkMensagens =
				getChecklistMensagensComTerminoNaoRealizadoSemAlerta(
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
					ID_TERMINO_NAO_REALIZADO,
					tituloMensagem.toString(),
					corpoMensagem);
			
			mensagemRepository.atualizar(chkMsg);
		}
		
	}
	
	/**
	 * Obtém as Atividades com término não realizado.
	 * 
	 * @param dataReferencia
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	private List<AtividadeMensagem> getAtividadesMensagensComTerminoNaoRealizadoSemAlerta(
			Date dataReferencia) throws ServiceException {
		logger.debug("TerminoNaoRealizadoRegra.getAtividadesMensagensComTerminoNaoRealizadoSemAlerta");
		
		List<AtividadeMensagem> atvMensagens =
				mensagemRepository.obterAtividadesMensagensComTerminoNaoRealizadoSemAlerta(
						dataReferencia);
		List<AtividadeMensagem> atvsAtraso = new ArrayList<AtividadeMensagem>();
		for (AtividadeMensagem atvMgs : atvMensagens) {
			Atividade atv = atvMgs.getAtividade();
			
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
			
			/* Regras 'D' e 'E' */
			if (dataReferencia.after(dtPrevistoComTolerancia)) {
				atvsAtraso.add(atvMgs);
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
	private List<ChecklistMensagem> getChecklistMensagensComTerminoNaoRealizadoSemAlerta(
			Date dtAtual) throws ServiceException {
		logger.debug("TerminoNaoRealizadoRegra.getChecklistsMensagensComTerminoNaoRealizadoSemAlerta");
		
		List<ChecklistMensagem> chkMensagens =
				mensagemRepository.obterChecklistComTerminoNaoRealizadoSemAlerta(
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
			calPrevistoComTolerancia.setTime(chk.getDataFimPrevisto());
			calPrevistoComTolerancia.add(Calendar.MINUTE, maxToleranciaMinutos);
			Date dtPrevistoComTolerancia = calPrevistoComTolerancia.getTime();
			
			/* Regras 'D' e 'E' */
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
		logger.debug("TerminoNaoRealizadoRegra.corpoMensagem(atividade)");
		
		Atividade atv = atividadeRepository.obter(atividade.getId());
		
		String quebraLinha = System.getProperty("line.separator");
		StringBuilder corpoMensagem = new StringBuilder();
		corpoMensagem.append("Mensagem: ");
		corpoMensagem.append(mensagem.getDescricao());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Prevista: ");
		corpoMensagem.append(atividade.getDataFimPrevisto());
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
		logger.debug("TerminoNaoRealizadoRegra.corpoMensagem(checklist)");
		
		Checklist chk = checklistRepository.obter(checklist.getId());
		
		String quebraLinha = System.getProperty("line.separator");
		StringBuilder corpoMensagem = new StringBuilder();
		corpoMensagem.append("Mensagem: ");
		corpoMensagem.append(mensagem.getDescricao());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Prevista: ");
		corpoMensagem.append(checklist.getDataFimPrevisto());
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
	
	public void setService(MessageSenderServiceImpl service) {
		this.messageSenderService = service;
	}

	public void setMensagemRepository(MensagemRepositoryImpl mensagemRepository) {
		this.mensagemRepository = mensagemRepository;
	}
	
	public void setAtividadeRepository(AtividadeRepositoryImpl atividadeRepository) {
		this.atividadeRepository = atividadeRepository;
	}

	public void setChecklistRepository(ChecklistRepositoryImpl checklistRepository) {
		this.checklistRepository = checklistRepository;
	}
	
}
