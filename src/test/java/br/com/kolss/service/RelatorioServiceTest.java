package br.com.kolss.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import br.com.kolss.dto.RelatorioDTO;
import br.com.kolss.enums.TipoExportRelatorioEnum;
import br.com.kolss.wrapper.ComentarioWrapper;
import br.com.kolss.wrapper.RelatorioAtividadeChecklistWrapper;

public class RelatorioServiceTest {
	
	private RelatorioServiceImpl relatorioServiceImpl;
	private String realPath = "/Users/hamseshenrique/Documents/workspace/nicbrain/nicBrain/src/main/webapp/relatorios";
	
	@Before
	public void init(){
		relatorioServiceImpl = new RelatorioServiceImpl();
	}
	
//	@Test
	public void criarRelatorio(){
		
		final RelatorioDTO relatorioDTO = new RelatorioDTO();
		
		String destino = "/Users/hamseshenrique/Documents/atividade_do_checklist_1.pdf";
		
		HashMap<String, Object> params = new HashMap<String, Object>(); 
		params.put("SUBREPORT_DIR", realPath); 
		params.put("NOME_CHECKLIST","TESTE HMS"); 
		params.put("LOCAL","TESTE HMS"); 
		params.put("EVENTO","TESTE HMS"); 
		params.put("DATA_EVENTO","01/01/2015"); 
		params.put("LOGOTIPO", realPath + "/logo_nic_brain_relatorio.png");
		params.put("LEGENDA", realPath + "/legenda.png");
		
		relatorioDTO.setDestino(destino);
		relatorioDTO.setRealPath(realPath+"/atividadeChecklistTemplate.jasper");
		relatorioDTO.setParametros(params);
		relatorioDTO.setTipoExportRelatorioEnum(TipoExportRelatorioEnum.PDF);
		
		relatorioDTO.setConteudo(criarConteudo());
		
		
		final Boolean isRelatorio = relatorioServiceImpl.criarRelatorio(relatorioDTO);
		Assert.assertEquals(isRelatorio,Boolean.TRUE);
	}
	
	private List<RelatorioAtividadeChecklistWrapper> criarConteudo(){
		final List<RelatorioAtividadeChecklistWrapper> lista = new ArrayList<RelatorioAtividadeChecklistWrapper>();
		
		final RelatorioAtividadeChecklistWrapper atividadeChecklistWraper = new RelatorioAtividadeChecklistWrapper();
		atividadeChecklistWraper.setNumeroItem("1");
		atividadeChecklistWraper.setNomeAtividade("HMS");
		atividadeChecklistWraper.setNomeStatus("AGENDADO");
		atividadeChecklistWraper.setDataInicioPrevisto("01/01/2015");
		atividadeChecklistWraper.setDataFimPrevisto("01/01/2015");
		atividadeChecklistWraper.setDataInicioRealizado("");
		atividadeChecklistWraper.setDataFimRealizado("");
		atividadeChecklistWraper.setNomeOperador("HMS");
		atividadeChecklistWraper.setObservacao("");
//		atividadeChecklistWraper.setNomeImagem("/Users/hamseshenrique/Documents/workspace/nicbrain/nicBrain/src/main"
//				+ "/webapp/imagens/icones/icon_amarelo.png");

		final List<ComentarioWrapper> listaComentarioWrapper = new ArrayList<ComentarioWrapper>();
		
		final ComentarioWrapper comentario = new ComentarioWrapper();
		comentario.setComentario("HMS TESTE");
		comentario.setNomeResponsavel("HMS TESTE");
		comentario.setDataComentario("01/01/2015");
		listaComentarioWrapper.add(comentario);
		
		atividadeChecklistWraper.setListaComentarios(listaComentarioWrapper);
		
		
		lista.add(atividadeChecklistWraper);
		
		return lista;
	}
}
