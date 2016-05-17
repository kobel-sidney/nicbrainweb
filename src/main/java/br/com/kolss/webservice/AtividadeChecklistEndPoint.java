
package br.com.kolss.webservice;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.kolss.dto.AtividadeChecklistDTO;
import br.com.kolss.dto.ChecklistDTO;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.service.AtividadeChecklistService;
import br.com.kolss.service.ChecklistService;


@Controller
@RequestMapping("/atividadechecklist")
public class AtividadeChecklistEndPoint {
	
	@Autowired
	private ChecklistService checklistService;
	
	@Autowired
	private AtividadeChecklistService atividadeChecklistService;

	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Deprecated
	@RequestMapping(value = "/listar/{idPessoa}/{idEvento}", method = RequestMethod.GET, produces="application/json")
    public @ResponseBody List<AtividadeChecklistDTO> listaChecklist(
    		@PathVariable String idPessoa,
    		@PathVariable String idEvento) {
		
		logger.debug("AtividadeChecklistEndPoint.listaChecklist("+idPessoa+"/"+idEvento+")");
		List<Atividade> listaAtividade = new ArrayList<Atividade>();
		listaAtividade = atividadeChecklistService.listarAtividadeChecklist(Long.valueOf(idPessoa),Long.valueOf(idEvento));
		List<AtividadeChecklistDTO> listaChecklistDTO = atividadeChecklistService.preencherListaChecklistDTO(listaAtividade);
		
    	return listaChecklistDTO; 
	}
	
	@RequestMapping(value = "/detalhes", method = RequestMethod.GET, produces="application/json")
    public @ResponseBody ChecklistDTO detalharChecklist() {
		
		logger.debug("AtividadeChecklistEndPoint.detalharChecklist");
		
		// FIXME: Como consigo esse valor aqui?!
		Long idChecklist = Long.valueOf(1);
		
		Checklist checklist = checklistService.obter(idChecklist);
    	ChecklistDTO checklistDTO = checklistService.preencherCheklistDTO(
    			checklist);
		return checklistDTO;
	}
    
}
