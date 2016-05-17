package br.com.kolss.service;

import static org.junit.Assert.fail;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import static org.mockito.Mockito.verify; 

import br.com.kolss.dto.ChecklistDTO;
import br.com.kolss.filtro.ChecklistFiltro;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.ChecklistMensagem;
import br.com.kolss.model.entities.Status;
import br.com.kolss.model.entities.StatusEnum;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.enuns.SituacaoEnum;
import br.com.kolss.model.repository.AtividadeRepository;
import br.com.kolss.model.repository.ChecklistRepository;
import br.com.kolss.model.repository.StatusRepository;
import br.com.kolss.model.repository.UsuarioRepository;
import br.com.kolss.service.regras.PermissaoPerfilServiceImpl;

public class CheckListServiceTest {

	@Mock
	private ChecklistRepository checklistRepository;

	@Mock
	private UsuarioRepository usuarioRepository;

	@Mock
	private StatusRepository statusRepository;

	@Mock
	private OperacaoChecklistRepository operacaoChecklistRepository;

	@Mock
	private AtividadeRepository atividadeRepository;

	private ChecklistServiceImpl checklistService;

	private SituacaoServiceImpl situacaoService;

	private PermissaoPerfilServiceImpl permissaoPerfilService;

	private UsuarioServiceImpl usuarioService;

	private OperacaoChecklistServiceImpl operacaoChecklistService;

	private AtividadeChecklistServiceImpl atividadeChecklistService;

	@Before
	public void init() {

		MockitoAnnotations.initMocks(this);

		situacaoService = new SituacaoServiceImpl();
		situacaoService.setChecklistRepository(checklistRepository);

		usuarioService = new UsuarioServiceImpl();
		usuarioService.setUsuarioRepository(usuarioRepository);

		checklistService = new ChecklistServiceImpl();
		checklistService.setChecklistRepository(checklistRepository);
		checklistService.setSituacaoService(situacaoService);

		permissaoPerfilService = new PermissaoPerfilServiceImpl();
		permissaoPerfilService.setChecklistService(checklistService);
		permissaoPerfilService.setUsuarioService(usuarioService);

		checklistService.setPermissaoPerfilService(permissaoPerfilService);

		operacaoChecklistService = new OperacaoChecklistServiceImpl();
		operacaoChecklistService.setRepositorioDeOperacoesDoChecklist(operacaoChecklistRepository);

		atividadeChecklistService = new AtividadeChecklistServiceImpl();
		atividadeChecklistService.setAtividadeRepository(atividadeRepository);
		atividadeChecklistService.setUsuarioService(usuarioService);

	}

	@Test
	public void obterCheckList() {

		final Long id = 54L;

		Mockito.when(checklistRepository.obter(id)).thenReturn(criarChecklist());
		Checklist checklist = checklistService.obter(id);

		Assert.assertNotNull(checklist);
		Assert.assertNotNull(checklist.getSituacao());

	}

	@Test
	public void getChecklistsMensagens() {

		final Long id = 65456L;

		Mockito.when(checklistRepository.obter(id)).thenReturn(criarChecklist());
		List<ChecklistMensagem> checklistMensagens = checklistService.obterChecklistMensagensPorId(id);

		Assert.assertNotNull(checklistMensagens);

	}

	@Test
	public void obterEmAbertoPorFiltro() {

		Mockito.when(checklistRepository.obterEmAbertoPorFiltro(criarFiltroChecklist())).thenReturn(criarChecklists());
		Mockito.when(situacaoService.obterPorChecklist(criarChecklist())).thenReturn(SituacaoEnum.AGENDADO);
		List<Checklist> checklists = checklistService.obterEmAbertoPorFiltro(criarFiltroChecklist());

		Assert.assertNotNull(checklists);
		Assert.assertNotNull(checklists.get(0).getSituacao());

	}

	@Test
	public void obterNaoCanceladoPorFiltro() {

		Mockito.when(checklistRepository.obterNaoCanceladoPorFiltro(criarFiltroChecklist())).thenReturn(criarChecklists());
		List<Checklist> checklists = checklistService.obterNaoCanceladoPorFiltro(criarFiltroChecklist());

		Assert.assertNotNull(checklists);

	}

	@Test
	public void obterPorFiltro() {

		ChecklistFiltro checklistFiltros = criarFiltroChecklist();
		Mockito.when(checklistRepository.obterPorFiltro(checklistFiltros)).thenReturn(criarChecklists());
		List<Checklist> checklists = checklistService.obterPorFiltro(checklistFiltros);

		Assert.assertNotNull(checklists);
		Assert.assertNotNull(checklists.get(0).getSituacao());

	}

	@Test
	public final void testPreencherListaChecklistDTO() {

		List<Checklist> checklists = criarChecklists();
		List<ChecklistDTO> checklistDTOMok = criarCheckListDTOs();
		Mockito.when(checklistService.preencherListaChecklistDTO(checklists)).thenReturn(checklistDTOMok);
		List<ChecklistDTO> checklistDTO = checklistService.preencherListaChecklistDTO(checklists); 
		Assert.assertNotNull(checklistDTO);

	}
	
	@Test
	public final void testPreencherCheklistDTO() {
		
		Checklist checklist = criarChecklist();
		ChecklistDTO checklistDTOMok = criarCheckListDTO();
		Mockito.when(checklistService.preencherCheklistDTO(checklist)).thenReturn(checklistDTOMok);
		ChecklistDTO cheklistDTO = checklistService.preencherCheklistDTO(checklist);
		Assert.assertNotNull(cheklistDTO);
	
	}

	@Test
	public final void testIniciarChecklist() {
		
		Long idUsuario = 123213L;
		Atividade atividade = criarAtividade();
		List<Atividade> atividades = criarAtividades();
		Usuario novoUsuarioResponsavel = criarUsuario();
		Status statusEmAndamento = criarStatus();
		Mockito.when(statusRepository.obter(StatusEnum.EM_ANDAMENTO.getId())).thenReturn(statusEmAndamento);
		Mockito.when(usuarioService.obter(idUsuario)).thenReturn(novoUsuarioResponsavel);
		verify(permissaoPerfilService).validarPermissaoOperacaoPorPerfil(idUsuario, atividade);
		verify(atividadeChecklistService).atualizarUsuarioResponsavel(atividades, idUsuario);
		
	}


	@Test
	public final void testConcluirChecklist() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public final void testCancelarChecklist() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public final void testNovoComentario() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public final void testObterChecklistsComentarios() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public final void testSetSituacaoService() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public final void testSetPermissaoPerfilService() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public final void testSetChecklistRepository() {
		fail("Not yet implemented"); // TODO
	}
	
	private List<Atividade> criarAtividades() {
		List<Atividade> atividades = new ArrayList<Atividade>();
		atividades.add(criarAtividade());
		return atividades ;
	}

	private ChecklistFiltro criarFiltroChecklist() {

		final Long filtroIdEvento = 172389L;
		final Long filtroIdLocal = 289137L;
		final Long filtroIdUsuarioResponsavel = 981273L;
		final Long filtroIdStatus = 192873L;
		final Long idUsuarioContexto = 8237L;
		final Date filtroDataHoraInicio = new Date();

		return new ChecklistFiltro(filtroIdEvento, filtroIdLocal,
				filtroIdUsuarioResponsavel, filtroIdStatus,
				filtroDataHoraInicio, idUsuarioContexto);
	}

	// @Test
	// public void iniciarChecklist() {
	//
	// final Long idChecklist = 6554L;
	// final Long idUsuario = 3748L;
	// final Long idStatus = 6546l;
	// final Checklist criarChecklist = criarChecklist();
	// final Atividade atividade = criarAtividade();
	//
	// Mockito.when(checklistRepository.find(idChecklist)).thenReturn(criarChecklist());
	// Mockito.when(checklistService.getChecklist(idChecklist)).thenReturn(criarChecklist);
	// Mockito.when(usuarioRepository.find(idUsuario)).thenReturn(criarUsuario());
	// Mockito.when(statusRepository.find(idStatus)).thenReturn(criarStatus());
	// Mockito.when(checklistService.iniciarChecklist(criarChecklist,
	// idUsuario)).thenReturn(false);
	// verify(checklistRepository).atualizar(criarChecklist);
	// verify(permissaoPerfilService).validarPermissaoOperacaoPorPerfil(idUsuario,
	// atividade);
	//
	// Usuario usuario = usuarioService.getUsuario(idUsuario);
	// Status status = statusRepository.find(idStatus);
	// Boolean iniciarCheckList =
	// checklistService.iniciarChecklist(criarChecklist, idUsuario);
	// Checklist checklist = checklistRepository.find(idChecklist);
	// Checklist chk = checklistService.getChecklist(checklist.getId());
	//
	// Assert.assertNotNull(chk);
	// Assert.assertNotNull(usuario);
	// Assert.assertNotNull(checklist);
	// Assert.assertNotNull(status);
	// Assert.assertFalse(iniciarCheckList);
	//
	// }

	private Atividade criarAtividade() {

		Atividade atividade = new Atividade();
		atividade.setId(2837L);

		return atividade;
	}

	private Status criarStatus() {
		Status status = new Status();
		status.setId(StatusEnum.AGENDADO.getId());
		return status;
	}

	private Usuario criarUsuario() {
		final Usuario usuario = new Usuario();
		usuario.setId(12893L);
		usuario.setNome("Fulando da Silva");
		return usuario;
	}

	private List<Checklist> criarChecklists() {

		List<Checklist> checklists = new ArrayList<Checklist>();
		checklists.add(criarChecklistComSituacaoAgendado());
		return checklists;
	}

	private Checklist criarChecklistComSituacaoAgendado() {

		final Checklist checklist = new Checklist();
		checklist.setId(1L);
		Status status = new Status(1l, "Status 1");
		checklist.setStatus(status);
		checklist.setSituacao(SituacaoEnum.AGENDADO);

		return checklist;
	}
	
	
	private List<ChecklistDTO> criarCheckListDTOs() {
		
		List<ChecklistDTO> returnList = new ArrayList<ChecklistDTO>();
		final ChecklistDTO dto = criarCheckListDTO();
		returnList.add(dto);
		return returnList;
	}

	private ChecklistDTO criarCheckListDTO() {
		return new ChecklistDTO("idChecklist","nomeChecklist", 
								"dataPrevistaInicio", "nomeStatus",
								"nomeResponsavel", "corSituacao");
	}


	private Checklist criarChecklist() {

		final Checklist checklist = new Checklist();
		checklist.setId(1L);
		Status status = new Status(1l, "Status 1");
		checklist.setStatus(status);

		return checklist;
	}

}
