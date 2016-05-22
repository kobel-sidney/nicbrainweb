package br.com.kolss.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import br.com.kolss.model.entities.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.dto.ChecklistDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.filtro.ChecklistFiltro;
import br.com.kolss.model.enuns.SituacaoEnum;
import br.com.kolss.model.repository.ChecklistRepository;
import br.com.kolss.model.repository.MensagemRepository;
import br.com.kolss.model.repository.StatusRepository;
import br.com.kolss.service.regras.PermissaoPerfilService;
import br.com.kolss.util.DataUtil;


@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class ChecklistServiceImpl implements ChecklistService {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	private static final Long ID_CHECKLIST_CANCELADA = Long.valueOf(19);

	@Autowired
	private ChecklistRepository checklistRepository;
	
	@Autowired
	private SituacaoService situacaoService;
	
	@Autowired
	private MessageSenderServiceImpl messageSenderService;
	
	@Autowired
	private MensagemRepository mensagemRepository;
	
	@Autowired
	private StatusRepository statusRepository;
	
	@Autowired
	private OperacaoChecklistService operacaoChecklistService;
	
	@Autowired
	private AtividadeChecklistService atividadeChecklistService;
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private PermissaoPerfilService permissaoPerfilService;
	
	public ChecklistServiceImpl() {
		
	}
	
	@Override
	public Checklist obter(Serializable idChecklist)	throws ServiceException {
		
		logger.debug("ChecklistServiceImpl.getChecklist");
		
		if (idChecklist == null) {
			throw new ServiceException("Checklist inválido!");
		}
		
		Checklist chk = checklistRepository.obter(idChecklist);
		
		SituacaoEnum situacao = situacaoService.obterPorChecklist(chk);
		chk.setSituacao(situacao);
		
		return chk;
	}
	
	@Override
	public List<ChecklistMensagem> obterChecklistMensagensPorId(Serializable idChecklist) throws ServiceException {
		
		logger.debug("ChecklistServiceImpl.getChecklistsMensagens");
		
		if (idChecklist == null) {
			throw new ServiceException("Checklist inválido!");
		}
		
		return checklistRepository.getChecklistsMensagens(idChecklist);
	}
	
	@Override
	public List<Checklist> obterEmAbertoPorFiltro(ChecklistFiltro checklistFiltro)	throws ServiceException {
		
		logger.debug("ChecklistServiceImpl.getChecklistsEmAberto");
		
		if (checklistFiltro.getIdUsuarioContexto() == null) {
			throw new ServiceException("Usuário Contexto inválido!");
		}
		
		List<Checklist> lst = checklistRepository.obterEmAbertoPorFiltro(checklistFiltro);
		
		for (Checklist chk : lst) {
			SituacaoEnum situacao = situacaoService.obterPorChecklist(chk); 
			chk.setSituacao(situacao);
		}
		
		return lst;
	}
	
	@Override
	public List<Checklist> obterNaoCanceladoPorFiltro(ChecklistFiltro checklistFiltro) throws ServiceException {
		
		logger.debug("ChecklistServiceImpl.getChecklists");
		
		List<Checklist> lst = checklistRepository.obterNaoCanceladoPorFiltro(checklistFiltro);
		
		for (Checklist chk : lst) {
			SituacaoEnum situacao = situacaoService.obterPorChecklist(chk); 
			chk.setSituacao(situacao);
		}
		
		return lst;
	}
	
	@Override
	public List<Checklist> obterPorFiltro(ChecklistFiltro checklistFiltro) throws ServiceException {
		
		logger.debug("ChecklistServiceImpl.obterPorFiltro");
		
		List<Checklist> checklists = checklistRepository.obterPorFiltro(checklistFiltro);
		
		for (Checklist checklist : checklists) {
			SituacaoEnum situacao = situacaoService.obterPorChecklist(checklist); 
			checklist.setSituacao(situacao);
		}
		
		return checklists;
	}
	
	@Override
	public List<ChecklistDTO> preencherListaChecklistDTO(List<Checklist> listChecklist) throws ServiceException {
		
		List<ChecklistDTO> listChecklistDTO = new ArrayList<ChecklistDTO>();
		
		for (Checklist checklist : listChecklist) {
			
			ChecklistDTO checklistDTO = new ChecklistDTO();
			
			checklistDTO.setIdChecklist(String.valueOf(checklist.getId()));
			checklistDTO.setIdEvento(String.valueOf(checklist.getEvento().getId()));
			checklistDTO.setIdLocal(String.valueOf(checklist.getEvento().getLocal().getId()));
			checklistDTO.setIdCliente(String.valueOf(checklist.getEvento().getLocal().getCliente().getId()));
			checklistDTO.setNomeCheckList(String.valueOf(checklist.getNome()));
			
			if(checklist.getDataInicioPrevisto() != null){
				checklistDTO.setDataPrevistaInicio(DataUtil.formataData(checklist.getDataInicioPrevisto()));
			}
			
			checklistDTO.setNomeStatus(String.valueOf(checklist.getStatus().getNome()));
			checklistDTO.setNomeResponsavel(String.valueOf(checklist.getUsuarioResponsavel().getPessoa().getNome()));
			checklistDTO.setQtdAlerta(String.valueOf(checklist.getQuantidadeMensagemAlerta()));
			
			String nomeCor = corPorSituacao(checklist);
			checklistDTO.setCorSituacao(nomeCor);
			listChecklistDTO.add(checklistDTO);
		}
		
		return listChecklistDTO;
	}

	private String corPorSituacao(Checklist checklist) {
		
		String nomeCor = "";
		
		switch (checklist.getSituacao()) {
		
		case SEM_INDICADOR:
			nomeCor = "sem_cor";
			break;

		case CANCELADA:
			nomeCor = "roxo";
			break;
			
		case AGENDADO:
			nomeCor = "branco";
			break;
			
		case SEM_ALERTA:
			nomeCor = "verde";
			break;
			
		case ALERTA_OCORRIDO:
			nomeCor = "amarelo";
			break;
			
		case ALERTA_VIGENTE:
			nomeCor = "vermelho";
			break;
		default:
			break;
		}
		return nomeCor;
	}
	
	@Override
	public ChecklistDTO preencherCheklistDTO(Checklist checklist)throws ServiceException {
		
		ChecklistDTO checklistDTO = new ChecklistDTO();
		/**
		 * Valores para a montagem da chave
		 */
		checklistDTO.setIdChecklist(String.valueOf(checklist.getId()));
		checklistDTO.setNomeCheckList(String.valueOf(checklist.getNome()));
		checklistDTO.setDataPrevistaInicio(String.valueOf(checklist.getDataInicioPrevisto()));
		checklistDTO.setNomeStatus(String.valueOf(checklist.getStatus().getNome()));
		checklistDTO.setNomeResponsavel(String.valueOf(checklist.getUsuarioResponsavel().getPessoa().getNome()));
		
		return checklistDTO;
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public boolean iniciarChecklist(Checklist checklist,Serializable idUsuario) throws ServiceException {
		
		logger.debug("ChecklistServiceImpl.iniciarChecklist");
		
		// Valida a permissão:
		permissaoPerfilService.validarPermissaoOperacaoPorPerfil(idUsuario, checklist);
		
		boolean statusAlterado = false;
		
		if (checklist.isAtivo() && StatusEnum.AGENDADO.getId().equals(checklist.getStatus().getId())) {
			
			Status statusEmAndamento = statusRepository.obter(StatusEnum.EM_ANDAMENTO.getId());
			checklist.setStatus(statusEmAndamento);
			checklist.setDataInicioRealizado(new Date());
			
			try {
				
				/*
				 * Se o Checklist for do tipo 'RondaChecklist', o novo
				 * 'Usuário Responsável' deve ser o Usuário que iniciou a
				 * primeira atividade.
				 */
				if (checklist.isChecklistRonda()) {
					Usuario novoUsuarioResponsavel = usuarioService.obter(idUsuario);
					checklist.setUsuarioResponsavel(novoUsuarioResponsavel);
					atividadeChecklistService.atualizarUsuarioResponsavel(checklist.getAtividades(), idUsuario);
				}
				
				checklistRepository.atualizar(checklist);
				statusAlterado = true;
				
				operacaoChecklistService.executarOperacao(
						checklist.getId(),
						usuarioService.obter(idUsuario),
						statusEmAndamento,
						null,
						null,
						new Date());
			} catch (Exception e) {
				logger.debug("Erro ao tentar iniciar o Checklist: "
						+ e.getMessage());
				throw new ServiceException("Erro ao tentar iniciar o Checklist");
			}
			
		}
		
		return statusAlterado;
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public boolean concluirChecklist(Serializable idChecklist,Serializable idUsuario) throws ServiceException {
		
		logger.debug("ChecklistServiceImpl.concluirChecklist");
		
		Checklist chk = checklistRepository.obter(idChecklist);
		
		// Valida a permissão:
		permissaoPerfilService.validarPermissaoOperacaoPorPerfil(idUsuario, chk);
		
		boolean statusAlterado = false;
		Date dtConcluido = new Date();
		if (chk.isAtivo()&& StatusEnum.EM_ANDAMENTO.getId().equals(chk.getStatus().getId())) {
			
			Status novoStatus = statusRepository.obter(StatusEnum.FINALIZADA.getId());
			chk.setStatus(novoStatus);
			chk.setDataFimRealizado(dtConcluido);
			
			try {
				checklistRepository.atualizar(chk);
				statusAlterado = true;
				
				operacaoChecklistService.executarOperacao(
						chk.getId(),
						usuarioService.obter(idUsuario),
						novoStatus,
						null,
						null,
						new Date());
			} catch (Exception e) {
				logger.debug("Erro ao tentar concluir o Checklist: "
						+ e.getMessage());
				throw new ServiceException("Erro ao tentar concluir o Checklist");
			}
			
		}
		
		return statusAlterado;
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public boolean cancelarChecklist(Serializable idChecklist,String observacao, Serializable idUsuario) throws ServiceException {
		
		logger.debug("ChecklistServiceImpl.cancelarChecklist");
		
		Checklist chk = checklistRepository.obter(idChecklist);
		
		// Valida a permissão:
		permissaoPerfilService.validarPermissaoOperacaoPorPerfil(idUsuario, chk);
		
		boolean statusAlterado = false;
		Date dtCancelado = new Date();
		if (chk.isAtivo()
				&& !StatusEnum.CANCELADA.getId().equals(chk.getStatus().getId())
				&& !StatusEnum.FINALIZADA.getId().equals(chk.getStatus().getId())) {
			
			Status novoStatus = statusRepository.obter(StatusEnum.CANCELADA.getId());
			chk.setStatus(novoStatus);
			chk.setObservacao(observacao);
			chk.setDataFimRealizado(dtCancelado);
			
			try {
				checklistRepository.atualizar(chk);
				
				operacaoChecklistService.executarOperacao(
						chk.getId(),
						usuarioService.obter(idUsuario),
						novoStatus,
						null,
						null,
						new Date());
				
				// Cancela todas as atividades possiveis:
				if (chk.getAtividades().size() > 0) {
					for (Atividade atv : chk.getAtividades()) {
						atividadeChecklistService.cancelarAtividade(
								atv.getId(),
								observacao,
								null,
								null,
								false,
								idUsuario);
					}
				}
				
				this.enviarAlerta(chk.getId());
				
				statusAlterado = true;
				
			} catch (Exception e) {
				logger.debug("Erro ao tentar cancelar o Checklist: "+ e.getMessage());
				throw new ServiceException("Erro ao tentar cancelar o Checklist");
			}
			
		}
		
		return statusAlterado;
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public boolean novoComentario(Serializable idChecklist, String comentario,
			Date datahoraComentario, Serializable idUsuario)
					throws ServiceException {
		logger.debug("ChecklistServiceImpl.novoComentario");
		
		Checklist chk = checklistRepository.obter(idChecklist);
		
		// Valida a permissão:
		permissaoPerfilService.validarPermissaoOperacaoPorPerfil(idUsuario, chk);
		
		Usuario usuarioResponsavel = usuarioService.obter(
				idUsuario);
		ChecklistComentario chkComentario = new ChecklistComentario(
				null,
				comentario,
				datahoraComentario != null ? datahoraComentario : new Date(),
				usuarioResponsavel,
				chk);
		
		chk.getChecklistsComentarios().add(chkComentario);
		boolean salvo = false;
		try {
			checklistRepository.salvar(chkComentario);
			checklistRepository.atualizar(chk);
			salvo = true;
		} catch (Exception e) {
			logger.debug("Erro ao tentar gravar novo comentario: "
					+ e.getMessage());
			throw new ServiceException("Erro ao tentar gravar novo comentario");
		}

		return salvo;
	}
	
	/**
	 * 
	 * FIXME: Deve ser codificado em outra camada
	 */
	@Deprecated
	private void enviarAlerta(Serializable idChecklist) {
		
		Mensagem mensagem = mensagemRepository.obter(ID_CHECKLIST_CANCELADA);
		
		StringBuilder tituloMensagem = new StringBuilder();
		tituloMensagem.append(mensagem.getTipoMensagem().getNome());
		tituloMensagem.append(": ");
		tituloMensagem.append(mensagem.getDescricao());
		tituloMensagem.append(" - ");
		tituloMensagem.append(DataUtil.formataData(new Date()));
		
		Checklist checklist = checklistRepository.obter(idChecklist);
		String corpoMensagem = montarCorpoMensagem(mensagem, checklist);
		
		// envia mensagem:
		messageSenderService.enviarMensagem(checklist,
				ID_CHECKLIST_CANCELADA,
				tituloMensagem.toString(),
				corpoMensagem);
	}
	
	
	/**
	 * Monta o corpo da Mensagem a ser enviada.
	 * 
	 * @param mensagem
	 * @param checklist
	 * 
	 * @return
	 */
	private String montarCorpoMensagem(Mensagem mensagem, Checklist checklist) {
		logger.debug("InicioComAtrasoRegra.montarCorpoMensagem(checklist)");
		
		Checklist chk = checklistRepository.obter(checklist.getId());
		
		String quebraLinha = System.getProperty("line.separator");
		StringBuilder corpoMensagem = new StringBuilder();
		corpoMensagem.append("Mensagem: ");
		corpoMensagem.append(mensagem.getDescricao());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Prevista: ");
		corpoMensagem.append(checklist.getDataInicioPrevisto());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Cancelado: ");
		corpoMensagem.append(checklist.getDataFimPrevisto());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Local: ");
		corpoMensagem.append(chk.getEvento().getLocal().getNome());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Evento: ");
		corpoMensagem.append(chk.getEvento().getNome());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Checklist: ");
		corpoMensagem.append(chk.getNome());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Responsável: ");
		corpoMensagem.append(chk.getUsuarioResponsavel().getPessoa().getNome());
		corpoMensagem.append(quebraLinha);

		Set<TelefonePessoa> telefones = chk.getUsuarioResponsavel().getPessoa().getTelefonesPessoais();
		if (telefones != null && !telefones.isEmpty()) {

			corpoMensagem.append("Números para contato: ");
			for (TelefonePessoa telefone : telefones) {
				corpoMensagem.append(quebraLinha);
				corpoMensagem.append(telefone.getTipoTelefone().getNome() + ": " + telefone.getNumero());
			}
		} else {
			corpoMensagem.append("Nenhum número para contato disponível");
		}
		
		return corpoMensagem.toString();
	}	

	@Deprecated
	@Override
	public boolean iniciarChecklistMobile(Integer idChecklist, Integer idEvento,
			Integer idLocal) throws ServiceException {
		logger.debug("ChecklistServiceImpl.iniciarChecklistMobile");
		
		throw new ServiceException(
				"Ussar o método iniciarChecklist(Serializable, Serializable)");
	}

	@Deprecated
	@Override
	public boolean concluirChecklistMobile(Integer idChecklist, Integer idEvento,
			Integer idLocal) throws ServiceException {
		logger.debug("ChecklistServiceImpl.concluirChecklistMobile");
		
		throw new ServiceException(
				"Ussar o método concluirChecklist(Serializable)");
	}
	
	@Deprecated
	@Override
	public boolean cancelarChecklistMobile(Integer idChecklist, Integer idEvento, 
			Integer idLocal, String observacao) throws ServiceException {
		logger.debug("ChecklistServiceImpl.cancelarChecklistMobile");
		
		throw new ServiceException(
				"Ussar o método cancelarChecklist(Serializable, String, Date, Serializable)");
	}

//	@Override
//	public StatusPorLocalDTO getQuantidadeDeChecklistPorStatus(Integer idLocal)
//			throws ServiceException {
//		logger.debug("ChecklistServiceImpl.getQuantidadeDeChecklistPorStatus");
//		
//		try {
//			return checklistRepository.getQuantidadeDeChecklistPorStatus(idLocal);
//		} catch (Exception e) {
//			throw new ServiceException(e);
//		}
//	}
	
	@Override
	public List<ChecklistComentario> obterChecklistsComentarios(Serializable idChecklist) throws ServiceException {
		logger.debug("ChecklistServiceImpl.getChecklistsComentarios");
		
		if (idChecklist == null) {
			throw new ServiceException("Checklist inválido!");
		}
		
		return checklistRepository.obterComentariosChecklists(idChecklist);
	}

	public void setSituacaoService(SituacaoService situacaoService) {
		this.situacaoService = situacaoService;
	}

	public void setPermissaoPerfilService(PermissaoPerfilService permissaoPerfilService) {
		this.permissaoPerfilService = permissaoPerfilService;
	}
	
	public void setChecklistRepository(ChecklistRepository checklistRepository) {
		this.checklistRepository = checklistRepository;
	}

	@Override
	public void salvar(Checklist checklist) {
		checklistRepository.salvar(checklist);
	}

	@Override
	public void atualizar(Checklist checklist) {
		checklistRepository.atualizar(checklist);
	}

	@Override
	public void remover(Checklist checklist) {
		checklistRepository.remover(checklist);
	}

	@Override
	public Checklist buscar(Long id) {
		// TODO Auto-generated method stub
		return null;
	}


	
	
}
