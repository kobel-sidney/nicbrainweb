package br.com.kolss.service;


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.AtividadeMensagem;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.Mensagem;
import br.com.kolss.model.entities.Status;
import br.com.kolss.model.entities.StatusEnum;
import br.com.kolss.model.enuns.SituacaoEnum;
import br.com.kolss.model.repository.AtividadeRepositoryImpl;
import br.com.kolss.model.repository.ChecklistRepositoryImpl;
import br.com.kolss.model.repository.EventoRepository;
import br.com.kolss.model.repository.LocalRepository;

public class SituacaoServiceTest {
	
	private SituacaoServiceImpl situacaoServiceImpl;
	
	@Mock
	protected AtividadeRepositoryImpl atividadeRepository;
	
	@Mock
	protected ChecklistRepositoryImpl checklistRepository;
	
	@Mock
	protected EventoRepository eventoRepository;
	
	@Mock
	protected LocalRepository localRepository;
	
	@Before
	public void init() {
		MockitoAnnotations.initMocks(this);
		situacaoServiceImpl = new SituacaoServiceImpl();
		situacaoServiceImpl.setChecklistRepository(checklistRepository);
		situacaoServiceImpl.setEventoRepository(eventoRepository);
		situacaoServiceImpl.setLocalRepository(localRepository);
		situacaoServiceImpl.setAtividadeRepository(atividadeRepository);
	}

	/**
	 * 
	 * 
	 * Inicio teste getSituacao(Atividade)
	 * 
	 * 
	 */
	@Test
	public void testGetSituacaoAtividadeAgendado() {
		
		Long id = 1L;

		Mockito.when(atividadeRepository.obter(id)).thenReturn(criarAtividadeStatusAguardando());
		SituacaoEnum situacaoEnum = situacaoServiceImpl.obterSituacaoPorAtividade(criarAtividadeStatusAguardando());
		Assert.assertNotNull(situacaoEnum);
		Assert.assertEquals(SituacaoEnum.AGENDADO, situacaoEnum);		
	}
	
	@Test
	public void testGetSituacaoAtividadeAlertaVigencia() {
		
		Long id = 1L;

		Mockito.when(atividadeRepository.obter(id)).thenReturn(criarAtividadeStatusAguardandoComMsg());
		SituacaoEnum situacaoEnumComMsg = situacaoServiceImpl.obterSituacaoPorAtividade(criarAtividadeStatusAguardandoComMsg());
		Assert.assertNotNull(situacaoEnumComMsg);
		Assert.assertEquals(SituacaoEnum.ALERTA_VIGENTE, situacaoEnumComMsg);
		
	}
	
	@Test
	public void testGetSituacaoAtividadeSemAlerta() {
		
		Long id = 1L;

		Mockito.when(atividadeRepository.obter(id)).thenReturn(criarAtividadeStatusEmAndamento());
		SituacaoEnum situacaoEnumComMsg = situacaoServiceImpl.obterSituacaoPorAtividade(criarAtividadeStatusEmAndamento());
		Assert.assertNotNull(situacaoEnumComMsg);
		Assert.assertEquals(SituacaoEnum.SEM_ALERTA, situacaoEnumComMsg);
		
		
		Mockito.when(atividadeRepository.obter(id)).thenReturn(criarAtividadeStatusFinalizada());
		SituacaoEnum situacaoEnumComMsg1 = situacaoServiceImpl.obterSituacaoPorAtividade(criarAtividadeStatusFinalizada());
		Assert.assertNotNull(situacaoEnumComMsg1);
		Assert.assertEquals(SituacaoEnum.SEM_ALERTA, situacaoEnumComMsg1);
		
	}
	
	
	//@Test
	public void testGetSituacaoAtividadeAlertaOcorrido() {
		
		Long id = 1L;

		Mockito.when(atividadeRepository.obter(id)).thenReturn(criarAtividadeStatusEmAndamentoComMsg());
		SituacaoEnum situacaoEnumComMsg = situacaoServiceImpl.obterSituacaoPorAtividade(criarAtividadeStatusEmAndamentoComMsg());
		Assert.assertNotNull(situacaoEnumComMsg);
		Assert.assertEquals(SituacaoEnum.ALERTA_OCORRIDO, situacaoEnumComMsg);
		
		Mockito.when(atividadeRepository.obter(id)).thenReturn(criarAtividadeStatusFinalizadaComMsg());
		SituacaoEnum situacaoEnumComMsg1 = situacaoServiceImpl.obterSituacaoPorAtividade(criarAtividadeStatusFinalizadaComMsg());
		Assert.assertNotNull(situacaoEnumComMsg1);
		Assert.assertEquals(SituacaoEnum.ALERTA_OCORRIDO, situacaoEnumComMsg1);
		
	}
	
	//@Test
	public void testGetSituacaoAtividadeAlertaVigente() {
		
		Long id = 1L;

		Mockito.when(atividadeRepository.obter(id)).thenReturn(criarAtividadeStatusEmAndamentoComMsgId15());
		SituacaoEnum situacaoEnumComMsg = situacaoServiceImpl.obterSituacaoPorAtividade(criarAtividadeStatusEmAndamentoComMsgId15());
		Assert.assertNotNull(situacaoEnumComMsg);
		Assert.assertEquals(SituacaoEnum.ALERTA_VIGENTE, situacaoEnumComMsg);
		
	}
	
	@Test
	public void testGetSituacaoAtividadeCancelado() {
		
		Long id = 1L;

		Mockito.when(atividadeRepository.obter(id)).thenReturn(criarAtividadeStatusCancelado());
		SituacaoEnum situacaoEnumComMsg = situacaoServiceImpl.obterSituacaoPorAtividade(criarAtividadeStatusCancelado());
		Assert.assertNotNull(situacaoEnumComMsg);
		Assert.assertEquals(SituacaoEnum.CANCELADA, situacaoEnumComMsg);
		
	}
	/**
	 * 
	 * 
	 * Fim teste getSituacao(Atividade)
	 * 
	 * 
	 */
	
	
	private Atividade criarAtividadeStatusAguardandoComMsg() {
		
		final Atividade atividade = new Atividade();
		Status status = new Status();
		status.setId(StatusEnum.AGUARDANDO.getId());
		atividade.setId(1L);
		atividade.setStatus(status);
		atividade.setAtividadesMensagens(criarListaAtividadeMensagem());
		return atividade ;
	}
	
	private Atividade criarAtividadeStatusEmAndamento() {
		
		final Atividade atividade = new Atividade();
		Status status = new Status();
		status.setId(StatusEnum.EM_ANDAMENTO.getId());
		atividade.setId(1L);
		atividade.setStatus(status);
		return atividade ;
	}
	
	private Atividade criarAtividadeStatusFinalizada() {
		
		final Atividade atividade = new Atividade();
		Status status = new Status();
		status.setId(StatusEnum.FINALIZADA.getId());
		atividade.setId(1L);
		atividade.setStatus(status);
		return atividade ;
	}
	
	
	private Atividade criarAtividadeStatusFinalizadaComMsg() {
		
		final Atividade atividade = new Atividade();
		Status status = new Status();
		status.setId(StatusEnum.FINALIZADA.getId());
		atividade.setId(1L);
		atividade.setStatus(status);
		atividade.setAtividadesMensagens(criarListaAtividadeMensagem());
		return atividade ;
	}
	
	private Atividade criarAtividadeStatusEmAndamentoComMsg() {
		
		final Atividade atividade = new Atividade();
		Status status = new Status();
		status.setId(StatusEnum.EM_ANDAMENTO.getId());
		atividade.setId(1L);
		atividade.setStatus(status);
		atividade.setAtividadesMensagens(criarListaAtividadeMensagem());
		return atividade ;
	}
	
	
	private Atividade criarAtividadeStatusEmAndamentoComMsgId15() {
		
		final Atividade atividade = new Atividade();
		Status status = new Status();
		status.setId(StatusEnum.EM_ANDAMENTO.getId());
		atividade.setId(1L);
		atividade.setStatus(status);
		atividade.setAtividadesMensagens(criarListaAtividadeMensagemId15());
		return atividade ;
	}


	private Atividade criarAtividadeStatusCancelado() {
		
		final Atividade atividade = new Atividade();
		Status status = new Status();
		status.setId(StatusEnum.CANCELADA.getId());
		atividade.setId(1L);
		atividade.setStatus(status);
		atividade.setAtividadesMensagens(criarListaAtividadeMensagem());
		return atividade ;
	}

	private Atividade criarAtividadeStatusAguardando() {
		
		final Atividade atividade = new Atividade();
		Status status = new Status();
		status.setId(StatusEnum.AGUARDANDO.getId());
		atividade.setId(1L);
		atividade.setStatus(status);
		
		return atividade ;
	}
	
	private Set<AtividadeMensagem> criarListaAtividadeMensagem() {
		
		Set<AtividadeMensagem> atividadeMensagens = new HashSet<AtividadeMensagem>();
		
		AtividadeMensagem atividadeMensagem = new AtividadeMensagem();
		atividadeMensagem.setId(1L);
		atividadeMensagem.setDataEnvio(new Date());
		
		AtividadeMensagem atividadeMensagem1 = new AtividadeMensagem();
		atividadeMensagem1.setId(2L);
		atividadeMensagem1.setDataEnvio(new Date());
		
		atividadeMensagens.add(atividadeMensagem);
		atividadeMensagens.add(atividadeMensagem1);
		
		return atividadeMensagens;
	}
	
	private Set<AtividadeMensagem> criarListaAtividadeMensagemId15() {
		
		Set<AtividadeMensagem> atividadeMensagens = new HashSet<AtividadeMensagem>();
		
		AtividadeMensagem atividadeMensagem1 = new AtividadeMensagem();
		atividadeMensagem1.setId(1L);
		atividadeMensagem1.setDataEnvio(new Date());
		Mensagem mensagem = new Mensagem();
		mensagem.setId(15L);
		atividadeMensagem1.setMensagem(mensagem );
		atividadeMensagens.add(atividadeMensagem1);

		return atividadeMensagens;
	}

	
	/**
	 * 
	 * 
	 * Inicio teste getSituacao(checklist)
	 * 
	 * 
	 */
	@Test
	public void testGetSituacaoCheckListCancelado() {
		Long id =1L;
		Mockito.when(checklistRepository.obter(id)).thenReturn(criarChecklistStatusCancelado());
		SituacaoEnum situacaoEnum = situacaoServiceImpl.obterPorChecklist(criarChecklistStatusCancelado());
		Assert.assertNotNull(situacaoEnum);
		Assert.assertEquals(SituacaoEnum.CANCELADA, situacaoEnum);		
		
	}
	
	
	private Checklist criarChecklistStatusCancelado() {
		Checklist checklist = new Checklist();
		checklist.setId(1L);
		checklist.setDescricao("List top 10");
		Status status = new Status();
		status.setId(StatusEnum.CANCELADA.getId());
		checklist.setStatus(status );
		return checklist ;
	}

	private Checklist criarChecklistStatusAgendada() {
		Checklist checklist = new Checklist();
		checklist.setId(1L);
		checklist.setDescricao("List top 10");
		Status status = new Status();
		status.setId(StatusEnum.AGENDADO.getId());
		checklist.setStatus(status );
		return checklist ;
	}

	/**
	 * 
	 * 
	 * 
	 * 
	 * 
	 * Fim teste getSituacao(checklist)
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 */

	@Test
	public void testGetSituacaoLocal() {
//		fail("Not yet implemented");
	}

	@Test
	public void testGetSituacaoOcorrencia() {
//		fail("Not yet implemented");
	}

}
