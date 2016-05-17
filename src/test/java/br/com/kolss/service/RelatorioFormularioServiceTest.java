package br.com.kolss.service;

import static org.mockito.Mockito.verify;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

import com.google.gson.Gson;

import br.com.kolss.dto.ComentarioAtividadeDTO;
import br.com.kolss.dto.RelatorioDTO;
import br.com.kolss.dto.RelatorioFormularioDTO;
import br.com.kolss.dto.SubRespostaQuestaoDTO;
import br.com.kolss.enums.TipoExportRelatorioEnum;
import br.com.kolss.model.dao.PerfilFormularioDao;
import br.com.kolss.model.entities.GrupoQuestao;
import br.com.kolss.model.entities.PerfilFormulario;
import br.com.kolss.model.entities.Questao;
import br.com.kolss.model.entities.Resposta;
import br.com.kolss.model.entities.RespostaQuestao;
import br.com.kolss.model.entities.SubRespostaQuestao;
import br.com.kolss.model.repository.GrupoQuestaoRepository;
import br.com.kolss.model.repository.QuestaoRepository;
import br.com.kolss.model.repository.RespostaQuestaoRepository;
import br.com.kolss.model.repository.RespostaRespository;
import br.com.kolss.model.repository.SubRespostaQuestaoRepository;

public class RelatorioFormularioServiceTest {
	
	@Mock
	private PerfilFormularioDao perfilFormularioDao;
	
	@Mock
	private RespostaQuestaoRepository respostaQuestaoRepository;
	
	@Mock
	private GrupoQuestaoRepository grupoQuestaoRepository;
	
	@Mock
	private QuestaoRepository questaoRepository;
	
	@Mock
	private RespostaRespository respostaRepository;
	
	@Mock
	private SubRespostaQuestaoRepository subRespostaQuestaoRepository;

	
	private RelatorioFormularioServiceImpl relatorioFormularioServiceImpl;
	private RelatorioServiceImpl relatorioServiceImpl;
	private String realPath = "/Users/hamseshenrique/Documents/workspace/nicbrain/nicBrain/src/main/webapp/relatorios";
	
	@Before
	public void init(){
		MockitoAnnotations.initMocks(this);
		relatorioFormularioServiceImpl = new RelatorioFormularioServiceImpl();
		relatorioServiceImpl = new RelatorioServiceImpl();
		
		relatorioFormularioServiceImpl.setRespostaQuestaoRepository(respostaQuestaoRepository);
		relatorioFormularioServiceImpl.setPerfilFormularioDao(perfilFormularioDao);
		relatorioFormularioServiceImpl.setGrupoQuestaoRepository(grupoQuestaoRepository);
		relatorioFormularioServiceImpl.setQuestaoRepository(questaoRepository);
		relatorioFormularioServiceImpl.setRespostaRespository(respostaRepository);
		relatorioFormularioServiceImpl.setSubRespostaQuestaoRepository(subRespostaQuestaoRepository);
	}
	
	@Test
	public void teste(){
		ComentarioAtividadeDTO comentarioAtividadeDTO = new ComentarioAtividadeDTO();
		comentarioAtividadeDTO.setComentario("teste");
		comentarioAtividadeDTO.setData("22/01/2015");
		comentarioAtividadeDTO.setIdAtividadeChecklist("1");
		comentarioAtividadeDTO.setIdUsuario("1");
		comentarioAtividadeDTO.setLatitude("0");
		comentarioAtividadeDTO.setLongitude("0");
		
		Gson gson = new Gson();
		System.out.println(gson.toJson(comentarioAtividadeDTO));
	}
	
	//@Test
	public void criarRelatorio() throws IOException{
		final Long idAtividade = new Long(11650L);
		final Long idPerfil = 1L;
		final Long idGrupo = 2L;
		final Long idQuestao = 4L;
		final Long idResposta = 10L;
		
		final List<RespostaQuestao> listResposta = criarRespostaQuestao(idAtividade);
		final SubRespostaQuestaoDTO subRespostaQuestaoDTO = new SubRespostaQuestaoDTO();
		
		subRespostaQuestaoDTO.setIdAtividade(idAtividade);
		subRespostaQuestaoDTO.setIdPerfil(idPerfil);
		subRespostaQuestaoDTO.setIdGrupo(idGrupo);
		subRespostaQuestaoDTO.setIdQuestao(idQuestao);
		subRespostaQuestaoDTO.setIdResposta(idResposta);
		
		Mockito.when(respostaQuestaoRepository.obterRespostaQuestaoPorAtividade(idAtividade)).thenReturn(listResposta);
		Mockito.when(perfilFormularioDao.findById(idPerfil)).thenReturn(criarPerfilFormulario());
		
		Mockito.when(grupoQuestaoRepository.obter(1L)).thenReturn(criarGrupoQuestao(1L,"A - DADOS CADASTRAIS"));
		Mockito.when(grupoQuestaoRepository.obter(2L)).thenReturn(criarGrupoQuestao(idGrupo,"B - PARECER DE NOSSO SUPERVISOR OU INSPETOR"));
		
		Mockito.when(questaoRepository.find(1L)).thenReturn(criarQuestao(1L,"NOME CLIENTE"));
		Mockito.when(questaoRepository.find(2L)).thenReturn(criarQuestao(2L,"DATA"));
		Mockito.when(questaoRepository.find(36L)).thenReturn(criarQuestao(3L,"1 - Apresentação pessoal de nossos profissionais"));
		Mockito.when(questaoRepository.find(3L)).thenReturn(criarQuestao(3L,"2 - Visto"));
		Mockito.when(questaoRepository.find(4L)).thenReturn(criarQuestao(4L,"3 - Arma"));
		
		Mockito.when(respostaRepository.obter(1L)).thenReturn(criarResposta(1L,"MUITO BOM"));
		Mockito.when(respostaRepository.obter(10L)).thenReturn(criarResposta(10L,"Numero"));
		
		final List<SubRespostaQuestao> listSubRespostaQuestao = new ArrayList<SubRespostaQuestao>();
		final SubRespostaQuestao subRespostaQuestao = new SubRespostaQuestao();
		
		subRespostaQuestao.setIdAtividade(idAtividade);
		subRespostaQuestao.setIdPerfilFormulario(idPerfil);
		subRespostaQuestao.setIdGrupoQuestao(idGrupo);
		subRespostaQuestao.setIdQuestao(idQuestao);
		subRespostaQuestao.setIdResposta(idResposta);
		subRespostaQuestao.setIdSubQuestao(10L);
//		subRespostaQuestao.setIdSubResposta(1L);
		subRespostaQuestao.setComentario("3050");
		
		listSubRespostaQuestao.add(subRespostaQuestao);
		
		Mockito.when(subRespostaQuestaoRepository.obter(subRespostaQuestaoDTO)).thenReturn(listSubRespostaQuestao);
		Mockito.when(questaoRepository.obterDescricao(10L)).thenReturn("Numero");
		
		final RelatorioFormularioDTO relatorioFormularioDTO = relatorioFormularioServiceImpl.gerarRelatorio(idAtividade);
		
		Assert.assertNotNull(relatorioFormularioDTO);
		Assert.assertTrue(!relatorioFormularioDTO.getGrupo().isEmpty());
		Assert.assertTrue(relatorioFormularioDTO.getGrupo().size() == 2);
		
		verify(grupoQuestaoRepository).obter(1L);
		verify(grupoQuestaoRepository).obter(2L);
		
		verify(questaoRepository).find(1L);
		verify(questaoRepository).find(2L);
		verify(questaoRepository).find(36L);
		verify(questaoRepository).find(3L);
		
		verify(respostaRepository).obter(1L);
		verify(subRespostaQuestaoRepository).obter(subRespostaQuestaoDTO);
		
		final RelatorioDTO relatorioDTO = new RelatorioDTO();
		
		String destino = "/Users/hamseshenrique/Documents/formulario.pdf";
		
		HashMap<String, Object> params = new HashMap<String, Object>(); 
		relatorioFormularioDTO.setLogo(realPath + "/logo_nic_brain_relatorio.png");
		params.put("SUBREPORT_DIR", realPath+"/"); 
		
		relatorioDTO.setDestino(destino);
		relatorioDTO.setRealPath(realPath+"/formulario.jasper");
		relatorioDTO.setParametros(params);
		relatorioDTO.setTipoExportRelatorioEnum(TipoExportRelatorioEnum.PDF);
		
		final List<RelatorioFormularioDTO> list = new ArrayList<RelatorioFormularioDTO>();
		list.add(relatorioFormularioDTO);
		
		relatorioDTO.setConteudo(list);
		
		
		final Boolean isRelatorio = relatorioServiceImpl.criarRelatorio(relatorioDTO);
		Assert.assertEquals(isRelatorio,Boolean.TRUE);
	}

	private PerfilFormulario criarPerfilFormulario() {
		PerfilFormulario perfilFormulario = new PerfilFormulario();
		perfilFormulario.setDescricao("Relatório da Qualidade Operacional Belfort Segurança");
		
		return perfilFormulario;
	}

	private List<RespostaQuestao> criarRespostaQuestao(final Long idAtividade) throws IOException {
		final List<RespostaQuestao> listResposta = new ArrayList<RespostaQuestao>();
		
		RespostaQuestao respostaQuestao = new RespostaQuestao();
		respostaQuestao.setId(1L);
		respostaQuestao.setComentario("hms tesre");
		respostaQuestao.setIdAtividade(idAtividade);
		respostaQuestao.setIdGrupoQuestao(1L);
		respostaQuestao.setIdPerfilFormulario(1L);
		respostaQuestao.setIdQuestao(1L);
		respostaQuestao.setIdResposta(0L);
		
		listResposta.add(respostaQuestao);
		
		respostaQuestao = new RespostaQuestao();
		respostaQuestao.setId(2L);
		respostaQuestao.setComentario("03/07/2015");
		respostaQuestao.setIdAtividade(idAtividade);
		respostaQuestao.setIdGrupoQuestao(1L);
		respostaQuestao.setIdPerfilFormulario(1L);
		respostaQuestao.setIdQuestao(2L);
		respostaQuestao.setIdResposta(null);
		
		listResposta.add(respostaQuestao);
		
		respostaQuestao = new RespostaQuestao();
		respostaQuestao.setId(3L);
		respostaQuestao.setComentario(null);
		respostaQuestao.setIdAtividade(idAtividade);
		respostaQuestao.setIdGrupoQuestao(2L);
		respostaQuestao.setIdPerfilFormulario(1L);
		respostaQuestao.setIdQuestao(36L);
		respostaQuestao.setIdResposta(1L);
		
		listResposta.add(respostaQuestao);
		
		respostaQuestao = new RespostaQuestao();
		respostaQuestao.setId(3L);
		respostaQuestao.setComentario(null);
		respostaQuestao.setIdAtividade(idAtividade);
		respostaQuestao.setIdGrupoQuestao(2L);
		respostaQuestao.setIdPerfilFormulario(1L);
		respostaQuestao.setIdQuestao(3L);
		respostaQuestao.setIdResposta(null);
		
		final File file = new File("/Users/hamseshenrique/Documents/evidencia1.png");
		byte[] bFile = new byte[(int) file.length()];
		
		InputStream inputStream = new FileInputStream(file);
		inputStream.read(bFile);
		inputStream.close();
		
		respostaQuestao.setAssinatura(bFile);
		
		listResposta.add(respostaQuestao);
		
		respostaQuestao = new RespostaQuestao();
		respostaQuestao.setId(3L);
		respostaQuestao.setComentario(null);
		respostaQuestao.setIdAtividade(idAtividade);
		respostaQuestao.setIdGrupoQuestao(2L);
		respostaQuestao.setIdPerfilFormulario(1L);
		respostaQuestao.setIdQuestao(4L);
		respostaQuestao.setIdResposta(10L);
		
		listResposta.add(respostaQuestao);
		return listResposta;
	}
	
	/**
	 * 
	 * @param id
	 * @param nome
	 * @return
	 */
	private GrupoQuestao criarGrupoQuestao(final Long id,final String nome){
		
		final GrupoQuestao grupoQuestao = new GrupoQuestao(id);
		grupoQuestao.setNome(nome);
		
		return grupoQuestao;  
	}
	
	/**
	 * 
	 * @param id
	 * @param descricao
	 * @return
	 */
	private Questao criarQuestao(final Long id,final String descricao){
		final Questao questao = new Questao();
		questao.setId(id);
		questao.setDescricao(descricao);
		
		return questao;
	}
	
	/**
	 * 
	 * @param id
	 * @param descricao
	 * @return
	 */
	private Resposta criarResposta(final Long id,final String descricao){
		final Resposta resposta = new Resposta();
		
		resposta.setId(id);
		resposta.setDescricao(descricao);
		
		return resposta;
	}

}
