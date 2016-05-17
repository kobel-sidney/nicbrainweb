package br.com.kolss.util;

import javax.faces.application.FacesMessage;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;


@Component
public class PhaseListenerApp implements PhaseListener {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -5853439180751881163L;
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	
	@Override
	public void beforePhase(PhaseEvent fase) {
		logger.debug("Antes da Fase: " + fase.getPhaseId());
		
		// Para evitar que o título e o corpo da mensagem sejam iguais:
		for (FacesMessage message : fase.getFacesContext().getMessageList()) {
			if (message.getSummary() != null
					&& message.getSummary().equals(message.getDetail())) {
				message.setDetail("");
			}
		}
	} 
	
	
	@Override
	public void afterPhase(PhaseEvent fase) {
		logger.debug("Depois da fase: " + fase.getPhaseId());
	}	
	
	@Override
	public PhaseId getPhaseId() {		
		return PhaseId.ANY_PHASE;
	}
	
}
