package br.com.kolss.regras;

import java.io.Serializable;

import org.apache.log4j.Logger;
import org.hibernate.event.internal.DefaultSaveOrUpdateEventListener;
import org.hibernate.event.spi.SaveOrUpdateEvent;

import br.com.kolss.model.entities.Atividade;


public class EngineRegraAvisoListener extends DefaultSaveOrUpdateEventListener {
	
	private static final long serialVersionUID = 1L;
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Override
	protected Serializable performSaveOrUpdate(SaveOrUpdateEvent event) {
		
		logger.info("Inicio - EngineRegraAlertaListener.performSaveOrUpdate");
		
		/* Inicio das regras de alerta por mudança de status: */
		
		
		// Atividade:
		/*
		// FIXME: REFACTORING - Transformar este trecho em um componente separado
		/*
		 * Portugol:
		 * 
		 * 01) Verificar se o objeto é do tipo "Atividade";
		 * 02) Se positivo, verificar se o "StatusAtividade" foi alterado;
		 * 03) Se positivo, verificar se o novo "StatusAtividade" é "INICIADO"
		 * 04) Se positivo, verificar se o antigo "StatusAtividade" é "AGUARDANDO"
		 * 05) Se positivo, disparar um alerta;
		 */
		boolean enviaAlerta = false;
		if (event.getEntity() instanceof Atividade) {
			Atividade atividade = (Atividade) event.getEntity();
			
			// FIXME: MANTER COMENTADO PARA ESTUDOS FUTUROS (APÓS V10):
//			final Integer idNoAguardo = Integer.valueOf(1);
//			final Integer idEmAndamento = Integer.valueOf(2);
//			StatusAtividade novoStatus = atividade.getStatusAtividade();
//			if (idEmAndamento.equals(novoStatus.getIdStatusAtividade())) {
//				
//				InterfaceDAO<StatusAtividade> dao = 
//						new HibernateDAO<StatusAtividade>(StatusAtividade.class,
//								FacesContextUtil.getRequestSession());
//				final Integer idAtividade = atividade.getId().getIdAtividade();
//				StatusAtividade antigoStatus = dao.getEntityByHQLQuery(
//						"SELECT atv.statusAtividade FROM Atividade atv WHERE atv.id.idAtividade = " + idAtividade);
//				
//				if (idNoAguardo.equals(antigoStatus.getIdStatusAtividade())) {
//					enviaAlerta = true;
//				}
//			}
		}
		
		
		Serializable entityId =  super.performSaveOrUpdate(event);
		
		
		if (enviaAlerta) {
			// enviar o alerta;
		}
		
		logger.info("Fim - EngineRegraAlertaListener.performSaveOrUpdate");
		return entityId;
	}
	
	@Override
	public void onSaveOrUpdate(SaveOrUpdateEvent event) {
		
		logger.info("Inicio - EngineRegraAlertaListener.onSaveOrUpdate");
		super.onSaveOrUpdate(event);
		logger.info("Fim - EngineRegraAlertaListener.onSaveOrUpdate");
	}
}
