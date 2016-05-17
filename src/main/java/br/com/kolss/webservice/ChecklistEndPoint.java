package br.com.kolss.webservice;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.kolss.dto.AtividadeChecklistDTO;
import br.com.kolss.dto.CancelamentoCheckListDTO;
import br.com.kolss.dto.ChecklistDTO;
import br.com.kolss.dto.ComentarioAtividadeDTO;
import br.com.kolss.dto.EnvioAtividadeChecklistDTO;
import br.com.kolss.dto.RetornoCheckList;
import br.com.kolss.dto.RetornoDTO;
import br.com.kolss.enums.RetornoEnum;
import br.com.kolss.filtro.ChecklistFiltro;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.relatorio.SalesDAO;
import br.com.kolss.service.AtividadeChecklistService;
import br.com.kolss.service.ChecklistService;
import br.com.kolss.service.OperacaoAtividadeChecklistService;
import br.com.kolss.service.OperacaoChecklistService;
import br.com.kolss.service.UsuarioService;
import br.com.kolss.util.DataUtil;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;


@Controller(value = "checklistMB")
@RequestMapping("/checklist")
public class ChecklistEndPoint {

	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private ChecklistService checklistService;
	
	@Autowired
	private AtividadeChecklistService atividadeChecklistService;
	
	@Autowired
	private OperacaoChecklistService operacaoChecklistService;
	
	@Autowired
	private OperacaoAtividadeChecklistService operacaoAtividadeChecklistService;
	
	@Autowired
	private UsuarioService usuarioService;

	@RequestMapping(value = "/listar/{idUsuario}/{idEvento}/{idPerfil}", method = RequestMethod.GET, produces="application/json")
    public @ResponseBody RetornoCheckList listaChecklist(@PathVariable String idUsuario,@PathVariable String idEvento,
												    	 								@PathVariable String idPerfil) {
														
		logger.debug("ChecklistEndPoint.listaChecklist("+idUsuario+"/"+idEvento+"/"+idPerfil+")");
		
		ChecklistFiltro checklistFiltro = new ChecklistFiltro();
		checklistFiltro.setIdUsuarioContexto(Long.valueOf(idUsuario));
		checklistFiltro.setIdEvento(Long.valueOf(idEvento));
		Date ontemPrimeiraHora = DataUtil.setHoursAndMinutesAndSeconds(DataUtil.addDays(new Date(), -1), 0, 0, 0); 
		Date amanhaUtilmaHora = DataUtil.setHoursAndMinutesAndSeconds(DataUtil.addDays(new Date(), 4), 23, 59, 59);
		checklistFiltro.setDataPrevistaInicio(ontemPrimeiraHora);
		checklistFiltro.setDataPrevistaFim(amanhaUtilmaHora);
		List<Checklist> listaChecklist = checklistService.obterNaoCanceladoPorFiltro(checklistFiltro);
		List<ChecklistDTO> listaChecklistDTO = checklistService.preencherListaChecklistDTO(listaChecklist);
		
    	return new RetornoCheckList(listaChecklistDTO,null); 
	}
	
	
	
	@RequestMapping(value = "/listadeatividades/{idChecklist}/{idUsuario}", method = RequestMethod.GET, produces="application/json")
    @Produces({ MediaType.APPLICATION_JSON })
    public @ResponseBody RetornoCheckList listarAtividadesChecklist(
    		@PathVariable String idChecklist,@PathVariable String idUsuario) {
		
		logger.info("ChecklistEndPoint.listarAtividadesChecklist("+idChecklist+"/"+idUsuario+")");
    	List<Atividade> listaAtividade = atividadeChecklistService.buscarPorCheckListEmAberto(Long.valueOf(idChecklist),Long.valueOf(idUsuario));
    	List<AtividadeChecklistDTO> listaAtividadeDTO = atividadeChecklistService.preencherListaChecklistDTO(listaAtividade);
    	
		return new RetornoCheckList(null,listaAtividadeDTO);
	}

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/atividade/iniciar",method = RequestMethod.POST, produces="application/json")
    public @ResponseBody RetornoDTO iniciarAtividadeChecklist(@RequestBody EnvioAtividadeChecklistDTO envioAtividadeChecklistDTO) {
		logger.info("ChecklistEndPoint.iniciarAtividadeChecklist");
		
		RetornoDTO retornoDTO = new RetornoDTO(RetornoEnum.SUCESSSO);
		try {
			String idAtividadeChecklistStr = String.valueOf(
					atividadeChecklistService.iniciarAtividade(
							Long.valueOf(envioAtividadeChecklistDTO.getIdAtividadeChecklist()),
							envioAtividadeChecklistDTO.getLatitude(),
							envioAtividadeChecklistDTO.getLongitude(), 
							Long.valueOf(envioAtividadeChecklistDTO.getIdUsuario())));
		} catch (Exception e) {
			logger.error("ERRO AO INICIAR ATIVIDADE",e);
			retornoDTO = new RetornoDTO(RetornoEnum.ERRO_NEGOCIO);
		}
		
		return retornoDTO;
	}
	
	@RequestMapping(value = "/atividade/concluir" ,method = RequestMethod.POST, produces="application/json")
    public @ResponseBody RetornoDTO concluirAtividadeChecklist(@RequestBody EnvioAtividadeChecklistDTO envioAtividadeChecklistDTO) {
		RetornoDTO retornoDTO = new RetornoDTO(RetornoEnum.SUCESSSO);
		try {
			logger.info("ChecklistEndPoint.concluirAtividadeChecklist");
			String idAtividadeChecklistStr = String.valueOf(atividadeChecklistService.concluirAtividade(
					Long.valueOf(envioAtividadeChecklistDTO.getIdAtividadeChecklist()),
					envioAtividadeChecklistDTO.getJustificativa(),
					envioAtividadeChecklistDTO.getLatitude(),
					envioAtividadeChecklistDTO.getLongitude(),
					Long.valueOf(envioAtividadeChecklistDTO.getIdUsuario())));
		} catch (Exception e) {
			logger.error("ERRO AO CONCLUIR ATIVIDADE",e);
			retornoDTO = new RetornoDTO(RetornoEnum.ERRO_NEGOCIO);
		}
		
		return retornoDTO;
	}
	
	@RequestMapping(value = "/atividade/cancelar/",method = RequestMethod.POST, produces="application/json")
    public @ResponseBody RetornoDTO cancelarAtividadeChecklist(@RequestBody CancelamentoCheckListDTO cancelamentoCheckListDTO) {
		
		logger.info("ChecklistEndPoint.cancelarAtividadeChecklist");
		RetornoDTO retornoDTO = new RetornoDTO(RetornoEnum.SUCESSSO);
		try {
			atividadeChecklistService.cancelarAtividade(
					Long.valueOf(cancelamentoCheckListDTO.getIdAtividadeChecklist()),
					cancelamentoCheckListDTO.getJustificativa(),
					cancelamentoCheckListDTO.getLatitude(),
					cancelamentoCheckListDTO.getLongitude(),
					false,
					Long.valueOf(cancelamentoCheckListDTO.getIdUsuario()));
			
		} catch (Exception e) {
			logger.error("ERRO AO CANCELAR ATIVIDADE",e);
			retornoDTO = new RetornoDTO(RetornoEnum.ERRO_NEGOCIO);
		}
		
		return retornoDTO;
	}
	
	@RequestMapping(value = "/atividade/comentario/",method = RequestMethod.POST, produces="application/json")
    public @ResponseBody RetornoDTO comentarioChecklist(@RequestBody ComentarioAtividadeDTO envioComentarioAtividadeDTO) {	

		logger.info("ChecklistEndPoint.comentarioChecklist");
		RetornoDTO retornoDTO = new RetornoDTO(RetornoEnum.SUCESSSO);

		try {
			atividadeChecklistService.novoComentario(
					Long.valueOf(envioComentarioAtividadeDTO.getIdAtividadeChecklist()),
					envioComentarioAtividadeDTO.getComentario(),
					Long.valueOf(envioComentarioAtividadeDTO.getIdUsuario()));
		} catch (Exception e) {
			logger.error("ERRO AO GRAVAR COMENTARIO",e);
			retornoDTO = new RetornoDTO(RetornoEnum.ERRO_NEGOCIO);
		}
		
		return retornoDTO;
	}
	
	/**
	 * Realiza a solicitação do Cancelamento de um Checklist.
	 * 
	 * @param idChecklist
	 * @param idUsuario
	 * @param justificativa
	 * @param latitude
	 * @param longitude
	 * @param data
	 * 
	 * @return
	 */
	@RequestMapping(value = "/cancelar",method = RequestMethod.POST,produces="application/json")
	public @ResponseBody RetornoDTO cancelarChecklist(@RequestBody CancelamentoCheckListDTO
    		cancelamentoCheckListDTO) {
		logger.info("ChecklistEndPoint.cancelarChecklist");
		
		RetornoDTO retornoDTO = new RetornoDTO(RetornoEnum.SUCESSSO);
		
		try {
			checklistService.cancelarChecklist(
					Long.valueOf(cancelamentoCheckListDTO.getIdAtividadeChecklist()),
					cancelamentoCheckListDTO.getJustificativa(),
					Long.valueOf(cancelamentoCheckListDTO.getIdUsuario()));
		} catch (Exception e) {
			logger.error("ERRO AO CANCELAR CHECKLIST",e);
			retornoDTO = new RetornoDTO(RetornoEnum.ERRO_NEGOCIO);
		}
		
		return retornoDTO;
	}

	/**
     * Retrieves the download file in XLS format
     * 
     * @return
     */
    @RequestMapping(value = "/ /pdf", method = RequestMethod.GET)
    public ModelAndView doSalesReportPDF(ModelAndView modelAndView) 
		 {
		logger.info("Received request to download PDF report");
		
		// Retrieve our data from a custom data provider
		// Our data comes from a DAO layer
		SalesDAO dataprovider = new SalesDAO();
		
		// Assign the datasource to an instance of JRDataSource
		// JRDataSource is the datasource that Jasper understands
		// This is basically a wrapper to Java's collection classes
		JRDataSource datasource  = dataprovider.getDataSource();
		
		// In order to use Spring's built-in Jasper support, 
		// we are required to pass our datasource as a map parameter
		
		// parameterMap is the Model of our application
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		
		// We pass two datasources here:
		// "datasource" is used by the main report. 
		// This is declared in the /WEB-INF/jasper-views.xml
		
		// "JasperCustomSubReportDatasource" is used by the sub-report
		// This is declared  in the master report named tree-template.jrxml 
		// It is also declared in the /WEB-INF/jasper-views.xml
		
		// Both datasources use the same datasource
		// You can provide different datasources
		parameterMap.put("datasource", datasource);
		parameterMap.put("JasperCustomSubReportDatasource", datasource);
		
		
		/**
		 * K
		 */
		
		try {
			JasperReport report = JasperCompileManager .compileReport("/Users/eduardodeabreu/EDX/KOLSS/Workspace/REPOSITORIO/PROJETO-NICBRAIN_GITHUB/nicBrain/WebContent/resources/checklist.jrxml");
			JasperPrint print = JasperFillManager.fillReport(report, null, new JRBeanCollectionDataSource(new ArrayList<>()));
			JasperExportManager.exportReportToPdfFile(print,
					"/Users/eduardodeabreu/EDX/KOLSS/Workspace/REPOSITORIO/PROJETO-NICBRAIN_GITHUB/nicBrain/WebContent/resources/checklist.pdf");
		} catch (JRException e) {
			e.printStackTrace();
		}  
		// preenchimento do relatorio, note que o metodo recebe 3 parametros: // 1 - o relatorio // // 2 - um Map, com parametros que sao passados ao relatorio // no momento do preenchimento. No nosso caso eh null, pois nao // estamos usando nenhum parametro // // 3 - o data source. Note que nao devemos passar a lista diretamente, // e sim "transformar" em um data source utilizando a classe // 
		
		
		// pdfReport is the View of our application
		// This is declared inside the /WEB-INF/jasper-views.xml
		modelAndView = new ModelAndView("htmlReport", parameterMap);
		
		// Return the View and the Model combined
		return modelAndView;
	}
    
    @RequestMapping(value = "/download", method = RequestMethod.GET)
    public String getDownloadPage() {
    	logger.debug("Received request to show download page");
    
    	// Do your work here. Whatever you like
    	// i.e call a custom service to do your business
    	// Prepare a model to be used by the JSP page
    	
    	// This will resolve to /WEB-INF/jsp/downloadpage.jsp
    	return "downloadpage";
	}
    
    
	
}
