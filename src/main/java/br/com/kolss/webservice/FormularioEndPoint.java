package br.com.kolss.webservice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.dto.FormularioDTO;
import br.com.kolss.dto.PerguntaDTO;
import br.com.kolss.dto.RelatorioDTO;
import br.com.kolss.dto.RelatorioFormularioDTO;
import br.com.kolss.dto.RetornoDTO;
import br.com.kolss.dto.TopicoDTO;
import br.com.kolss.enums.RetornoEnum;
import br.com.kolss.enums.TipoExportRelatorioEnum;
import br.com.kolss.service.FormularioService;
import br.com.kolss.service.RelatorioFormularioService;
import br.com.kolss.service.RelatorioService;


@Controller(value = "formulario")
@RequestMapping("/formulario")
public class FormularioEndPoint {
 
	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	FormularioService formularioService;
	
	@Autowired
	private RelatorioFormularioService relatorioFormularioService;
	
	@Autowired
	private RelatorioService relatorioService;
	
	private BbUsuarioLogado usuarioLogado;
	
	
	@RequestMapping(value = "/nome", method = RequestMethod.POST, produces="application/json")
    public @ResponseBody FormularioDTO buscarFormularioPorId(
    		@RequestParam String idFormulario) {
		
		logger.info("FormularioEndPoint.buscarFormularioPorId");
		
		return formularioService.buscarFormulario(Long.valueOf(idFormulario));
	}
	
	
	@RequestMapping(value = "/topicos", method = RequestMethod.POST, produces="application/json")
    public @ResponseBody 
    	List<TopicoDTO> buscarFormularioTopicos(String idFormulario) {
		
		logger.info("FormularioEndPoint.buscarFormularioTopicos");
		
		FormularioDTO formularioDTO = formularioService.buscarFormulario(Long.valueOf(idFormulario));
		
		return formularioDTO.getListaDeTopicosDTO();
		
	}
	//TODO mudar no tablet a chamada
	@RequestMapping(value = "/listar_topicos/{idFormulario}/{dataUltimaAtualizacao}", method = RequestMethod.POST, produces="application/json")
    public @ResponseBody List<TopicoDTO> ListarTopicos(
    		@RequestParam String idFormulario) {
		
		logger.info("FormularioEndPoint.buscarFormularioTopicos");
		FormularioDTO formularioDTO = formularioService.buscarFormulario(Long.valueOf(idFormulario));
		
		return formularioDTO.getListaDeTopicosDTO();
		
	}
	
	
	@RequestMapping(value = "/listar_perguntas/{idTopico}/{idFormulario}/{dataUltimaAtualizacao}", method = RequestMethod.POST, produces="application/json")
    public @ResponseBody List<PerguntaDTO> ListarPerguntas(
    		@RequestParam String idTopico,
    		@RequestParam String idFormulario) {
		
		logger.info("FormularioEndPoint.buscarFormularioTopicos");
		PerguntaDTO perguntaDTO = new PerguntaDTO();
		
		//TODO Fazer a busca das perguntas 
		
		//TODO Fazer o preenchimento do DTO de perguntas
		
		//TODO
		
		
		return null;
		
	}
	
	@RequestMapping(value = "/teste", method = RequestMethod.GET, produces="application/json")
    public @ResponseBody RetornoDTO teste(@RequestParam Long idAtividade,
    		HttpServletRequest request) {
		
		final String realPath=request.getRealPath("/relatorios/");//FacesContext.getCurrentInstance().getExternalContext().getRealPath("/relatorios/");
		final String destino = "/home/adansbento/Área de Trabalho/formulario.pdf";
		final RelatorioFormularioDTO relatorioFormularioDTO = relatorioFormularioService.gerarRelatorio(idAtividade);
		final HashMap<String, Object> params = new HashMap<String, Object>(); 
		
		relatorioFormularioDTO.setLogo(realPath + "/logo_nic_brain_relatorio.png");
		params.put("SUBREPORT_DIR", realPath+"/"); 
		
		final List<RelatorioFormularioDTO> list = new ArrayList<RelatorioFormularioDTO>();
		list.add(relatorioFormularioDTO);
		
		final RelatorioDTO relatorioDTO = new RelatorioDTO();
		relatorioDTO.setRealPath(realPath+"/formulario.jasper");
		relatorioDTO.setParametros(params);
		relatorioDTO.setDestino(destino);
		relatorioDTO.setConteudo(list);
		relatorioDTO.setTipoExportRelatorioEnum(TipoExportRelatorioEnum.PDF);
		
		relatorioService.criarRelatorio(relatorioDTO);
		
		
		return new RetornoDTO(RetornoEnum.SUCESSSO);
	
	}
}