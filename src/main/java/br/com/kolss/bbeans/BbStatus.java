package br.com.kolss.bbeans;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Status;
import br.com.kolss.service.StatusService;


@Controller(value = "bbStatus")
@Scope("request")
public class BbStatus {
	
	protected Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	protected StatusService service;
	
	
	/**
	 * Retorna todos os status que podem ser alterados dentro de uma Atividade
	 * ou AtividadeOcorrencia.
	 * 
	 * @return
	 */
	public List<Status> getStatusAlteraveis() {
		logger.debug("BbStatus.getStatusAlteraveis");
		
		return service.getStatusAlteraveis();
	}

	/**
	 * Retorna todos os status que podem ser consultados dentro Checklist
	 * 
	 * @return
	 */
	public List<Status> getAllChecklistStatus() {
		logger.debug("BbStatus.getAllChecklistStatus");
		
		return service.getAllChecklistStatus();
	}
	
}
