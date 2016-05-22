package br.com.kolss.service;

import java.io.Serializable;
import java.util.*;

import br.com.kolss.model.entities.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.dto.AtividadeChecklistDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.dao.AtividadeChecklistDao;
import br.com.kolss.model.enuns.SituacaoEnum;
import br.com.kolss.model.repository.AtividadeRepository;
import br.com.kolss.model.repository.MensagemRepository;
import br.com.kolss.model.repository.StatusRepository;
import br.com.kolss.service.regras.AtividadeRondaRegraService;
import br.com.kolss.service.regras.ConcluirChecklistRegra;
import br.com.kolss.service.regras.IniciarChecklistRegraService;
import br.com.kolss.service.regras.PermissaoPerfilService;
import br.com.kolss.util.DataUtil;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class AtividadeChecklistServiceImpl implements AtividadeChecklistService {

	private Logger logger = Logger.getLogger(this.getClass());

	private static final Long ID_ATIVIDADE_CANCELADA = Long.valueOf(34);

	@Autowired
	private AtividadeChecklistDao atividadeChecklistDao;

	@Autowired
	protected SituacaoService situacaoService;

	@Autowired
	protected AtividadeRepository atividadeRepository;

	@Autowired
	protected MensagemRepository mensagemRepository;

	@Autowired
	protected MessageSenderServiceImpl messageSenderService;

	@Autowired
	protected OperacaoAtividadeChecklistService operacaoAtividadeService;

	@Autowired
	protected IniciarChecklistRegraService iniciarChecklistRegraService;

	@Autowired
	protected ConcluirChecklistRegra concluirChecklistRegra;

	@Autowired
	protected AtividadeRondaRegraService atividadeRondaRegraService;

	@Autowired
	protected StatusRepository statusRepository;

	@Autowired
	protected UsuarioService usuarioService;

	@Autowired
	protected PermissaoPerfilService permissaoPerfilService;

	@Override
	public Atividade obter(Serializable idAtividade) throws ServiceException {
		logger.debug("AtividadeChecklistServiceImpl.getAtividaede");

		if (idAtividade == null) {
			throw new ServiceException("ID do Atividade Inválida");
		}

		Atividade atv = atividadeRepository.obter(idAtividade);
		SituacaoEnum situacao = situacaoService.obterSituacaoPorAtividade(atv);
		atv.setSituacao(situacao);

		return atv;
	}

	@Override
	public List<Atividade> listarAtividadeChecklist(Long idChecklist, Long idEvento) throws ServiceException {
		return atividadeChecklistDao.listarAtividadeChecklist(idChecklist, idEvento);
	}

	@Override
	public List<AtividadeChecklistDTO> preencherListaChecklistDTO(List<Atividade> listaAtividadeChecklist)
			throws ServiceException {
		// TODO Auto-generated method stub
		List<AtividadeChecklistDTO> listAtividadeChecklistDTO = new ArrayList<AtividadeChecklistDTO>();

		// SinalizadorCorServiceImpl sinalizadorCorService = new
		// SinalizadorCorServiceImpl();
		// sinalizadorCorService.setSessionFactory(HibernateUtil.getSessionFactory());
		// SinalizadorCorEnum cor =
		// sinalizadorCorService.getSinalizadorCor(atividade.getId());
		//

		if (!listaAtividadeChecklist.isEmpty()) {

			for (Atividade atividade : listaAtividadeChecklist) {

				AtividadeChecklistDTO atividadeChecklistDTO = new AtividadeChecklistDTO();

				atividadeChecklistDTO.setIdAtividadeChecklist(String.valueOf(atividade.getId()));

				atividadeChecklistDTO.setNomeAtividadeCheckList(String.valueOf(atividade.getNome()));
				atividadeChecklistDTO.setDataPrevistaInicio(DataUtil.formataData(atividade.getDataInicioPrevisto()));
				atividadeChecklistDTO.setNomeStatus(String.valueOf(atividade.getStatus().getNome()));
				atividadeChecklistDTO
						.setNomeResponsavel(String.valueOf(atividade.getUsuarioResponsavel().getPessoa().getNome()));
				atividadeChecklistDTO.setNrItem(String.valueOf(atividade.getNumeroItem()));
				atividadeChecklistDTO.setQtdAlerta(String.valueOf(atividade.getQuantidadeMensagemAlerta()));
				atividadeChecklistDTO.setIdPerfilFormulario(atividade.getIdPerfilFormulario());
				atividadeChecklistDTO.setAtivo(atividade.isAtivo());
				atividadeChecklistDTO.setCampoCheck(atividade.isCampoCheck());

				// FIXME: Parametrizar isso em um próximo refactoring
				String nomeCor = "";
				switch (atividade.getSituacao()) {
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
				atividadeChecklistDTO.setCorSituacao(nomeCor);

				listAtividadeChecklistDTO.add(atividadeChecklistDTO);

			}
		}
		return listAtividadeChecklistDTO;
	}

	@Override
	public List<Atividade> getAtividadesEmAberto(Serializable idChecklist, Serializable filtroIdUsuarioResponsavel,
			Serializable filtroIdStatus, Serializable filtroIdFormulario, Date filtroDataHoraInicio,
			Serializable idUsuarioContexto) throws ServiceException {
		logger.debug("AtividadeServiceImpl.getAtividadesEmAberto");

		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário inválido!");
		}

		try {

			List<Atividade> lst = atividadeRepository.getAtividadesEmAberto(idChecklist, filtroIdUsuarioResponsavel,
					filtroIdStatus, filtroIdFormulario, filtroDataHoraInicio, idUsuarioContexto);

			for (Atividade atv : lst) {
				SituacaoEnum situacao = situacaoService.obterSituacaoPorAtividade(atv);
				atv.setSituacao(situacao);
			}

			return lst;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new ServiceException("Erro ao listar as Atividades!");
		}

	}

	@Override
	public List<Atividade> getAtividades(Serializable idChecklist, Serializable filtroIdUsuarioResponsavel,
			Serializable filtroIdStatus, Serializable filtroIdFormulario, Date filtroDataHoraInicio,
			Serializable idUsuarioContexto) throws ServiceException {

		logger.debug("AtividadeServiceImpl.getAtividades");

		try {

			List<Atividade> lst = atividadeRepository.getAtividades(idChecklist, filtroIdUsuarioResponsavel,
					filtroIdStatus, filtroIdFormulario, filtroDataHoraInicio, idUsuarioContexto);

			for (Atividade atv : lst) {
				SituacaoEnum situacao = situacaoService.obterSituacaoPorAtividade(atv);
				atv.setSituacao(situacao);
			}

			return lst;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new ServiceException("Erro ao listar as Atividades!");
		}

	}

	@Deprecated
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public boolean iniciarAtividade(Serializable idAtividade, String latitude, String longitude,
			Serializable idUsuarioContexto) throws ServiceException {

		return this.iniciarAtividade(idAtividade, null, latitude, longitude, idUsuarioContexto);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public boolean iniciarAtividade(Serializable idAtividade, String observacao, String latitude, String longitude,
			Serializable idUsuarioContexto) throws ServiceException {

		logger.debug("AtividadeServiceImpl.iniciarAtividade");

		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário inválido!");
		}

		Atividade atividade = atividadeRepository.obter(idAtividade);

		// Valida a permissão:
		permissaoPerfilService.validarPermissaoOperacaoPorPerfil(idUsuarioContexto, atividade);

		/*
		 * FIXME: Implementação 'just-in-time' gambiarra da regra para evitar
		 * iniciar atividades antes da data prevista com soma de tolerancia
		 * antecipada. Implementação feita para apresentação do dia
		 * 03/março/2015.
		 * 
		 * TODO: Criar uma classe para regra específica
		 */
		// if (atividade.getTempoToleranciaAntecipado() != null) {
		// Calendar calInicioPrevistoAntecipado = Calendar.getInstance();
		// calInicioPrevistoAntecipado.setTime(atividade.getDataInicioPrevisto());
		// int toleranciaAntecipado =
		// atividade.getTempoToleranciaAntecipado().intValue();
		// calInicioPrevistoAntecipado.add(Calendar.MINUTE,
		// (toleranciaAntecipado * -1));
		// Date dtInicioPrevistoAntecipado =
		// calInicioPrevistoAntecipado.getTime();
		//
		// Date dtAtual = new Date();
		// if (dtAtual.before(dtInicioPrevistoAntecipado)) {
		// throw new ServiceException("Ainda não é possível iniciar esta
		// Atividade!");
		// }
		// }

		boolean statusAlterado = false;

		if (atividade.isAtivo() && StatusEnum.AGENDADO.getId().equals(atividade.getStatus().getId())) {

			atividade.setObservacao(observacao);
			atividade.setDataInicioRealizado(new Date());

			/*
			 * Regra para novo Status:
			 * 
			 * - Status Em Andamento: atividade.isCampoCheck == false - Status
			 * Finalizada: atividade.isCampoCheck == true
			 */
			Serializable idNovoStatus = StatusEnum.EM_ANDAMENTO.getId();
			if (atividade.isCampoCheck()) {
				idNovoStatus = StatusEnum.FINALIZADA.getId();
				atividade.setDataFimRealizado(atividade.getDataInicioRealizado());
			}
			Status novoStatus = statusRepository.obter(idNovoStatus);
			atividade.setStatus(novoStatus);

			this.alterarAtividade(atividade, idNovoStatus, latitude, longitude, idUsuarioContexto);

			statusAlterado = true;
		}

		return statusAlterado;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public boolean concluirAtividade(Serializable idAtividade, String observacao, String latitude, String longitude,
			Serializable idUsuarioContexto) throws ServiceException {
		logger.debug("AtividadeServiceImpl.concluirAtividade");

		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário inválido!");
		}

		Atividade atividade = atividadeRepository.obter(idAtividade);

		// Valida a permissão:
		permissaoPerfilService.validarPermissaoOperacaoPorPerfil(idUsuarioContexto, atividade);

		boolean statusAlterado = false;
		if (atividade.isAtivo() && StatusEnum.EM_ANDAMENTO.getId().equals(atividade.getStatus().getId())) {

			Status novoStatus = statusRepository.obter(StatusEnum.FINALIZADA.getId());
			atividade.setStatus(novoStatus);
			atividade.setObservacao(observacao);
			atividade.setDataFimRealizado(new Date());

			this.alterarAtividade(atividade, StatusEnum.FINALIZADA.getId(), latitude, longitude, idUsuarioContexto);

			statusAlterado = true;
		}

		return statusAlterado;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public boolean cancelarAtividade(Serializable idAtividade, String observacao, String latitude, String longitude,
			boolean atividadeAuxiliar, Serializable idUsuarioContexto) throws ServiceException {
		logger.debug("AtividadeServiceImpl.cancelarAtividade");

		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário inválido!");
		}

		Atividade atividade = atividadeRepository.obter(idAtividade);

		// Valida a permissão:
		permissaoPerfilService.validarPermissaoOperacaoPorPerfil(idUsuarioContexto, atividade);

		boolean statusAlterado = false;
		if (atividade.isAtivo() && !StatusEnum.CANCELADA.getId().equals(atividade.getStatus().getId())
				&& !StatusEnum.FINALIZADA.getId().equals(atividade.getStatus().getId())) {

			Status novoStatus = statusRepository.obter(StatusEnum.CANCELADA.getId());
			atividade.setStatus(novoStatus);
			atividade.setObservacao(observacao);
			atividade.setDataFimRealizado(new Date());

			this.alterarAtividade(atividade, StatusEnum.FINALIZADA.getId(), latitude, longitude, idUsuarioContexto);

			statusAlterado = true;
		}

		return statusAlterado;
	}

	/**
	 * Realiza a atualização da Atividade e executa as regras associadas a
	 * Atividade.
	 * 
	 * @param atividade
	 * @param idNovoStatus
	 * @param latitude
	 * @param longitude
	 * @param idUsuarioContexto
	 * 
	 * @throws ServiceException
	 */
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	private void alterarAtividade(Atividade atividade, Serializable idNovoStatus, String latitude, String longitude,
			Serializable idUsuarioContexto) throws ServiceException {
		logger.debug("AtividadeServiceImpl.alterarAtividade");

		atividadeRepository.atualizar(atividade);

		// TODO: REFACTORING - Colocar no padrão de listener!!!
		iniciarChecklistRegraService.statusAtividadeAlterado(atividade.getId(), idUsuarioContexto);

		// TODO: REFACTORING - Colocar no padrão de listener!!!
		concluirChecklistRegra.statusAtividadeAlterado(atividade.getId(), idUsuarioContexto);

		// TODO: REFACTORING - Colocar no padrão de listener!!!
		atividadeRondaRegraService.validarDistanciaLimite(atividade.getId(), latitude, longitude, idUsuarioContexto);

		// TODO: REFACTORING - Colocar no padrão de listener!!!
		operacaoAtividadeService.executarOperacao(atividade.getId(), usuarioService.obter(idUsuarioContexto),
				atividade.getStatus(), latitude, longitude, new Date());
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public boolean novoComentario(Serializable idAtividade, String comentario, Serializable idUsuarioContexto)
			throws ServiceException {
		logger.debug("AtividadeChecklistServiceImpl.novoComentario");

		boolean salvo = false;
		Atividade atividade = atividadeRepository.obter(idAtividade);

		// Valida a permissão:
		permissaoPerfilService.validarPermissaoOperacaoPorPerfil(idUsuarioContexto, atividade);

		try {

			AtividadeComentario atvComentario = new AtividadeComentario(null, comentario, new Date(),
					usuarioService.obter(idUsuarioContexto), atividade);
			atividade.getAtividadesComentarios().add(atvComentario);

			atividadeRepository.salvar(atvComentario);
			atividadeRepository.atualizar(atividade);
			salvo = true;
		} catch (Exception e) {
			logger.debug("Erro ao tentar gravar novo comentario: " + e.getMessage());
			throw new ServiceException("Erro ao tentar gravar novo comentario");
		}

		return salvo;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void atualizarUsuarioResponsavel(Collection<Atividade> atividades, Serializable idUsuarioResponsavel)
			throws ServiceException {
		logger.debug("AtividadeChecklistServiceImpl.atualizarUsuarioReponsavel");

		Usuario usuarioResponsavel = usuarioService.obter(idUsuarioResponsavel);
		for (Atividade atv : atividades) {
			atv.setUsuarioResponsavel(usuarioResponsavel);
			atividadeRepository.atualizar(atv);
		}

	}

	@Override
	public List<AtividadeComentario> getAtividadesComentarios(Serializable idAtividade) throws ServiceException {
		logger.debug("AtividadeChecklistServiceImpl.getAtividadesComentarios");

		if (idAtividade == null) {
			throw new ServiceException("Atividade inválida!");
		}

		return atividadeRepository.getAtividadesComentarios(idAtividade);
	}

	@Override
	public List<AtividadeMensagem> getAtividadesMensagens(Serializable idAtividade) throws ServiceException {
		logger.debug("AtividadeChecklistServiceImpl.getAtividadesMensagens");

		if (idAtividade == null) {
			throw new ServiceException("Atividade inválida!");
		}

		return atividadeRepository.getAtividadesMensagens(idAtividade);
	}

	/**
	 * 
	 * FIXME: Deve ser codificado em outra camada
	 */
	@SuppressWarnings("unused")
	@Deprecated
	private void enviarAlerta(Atividade atv) {
		Mensagem mensagem = mensagemRepository.obter(ID_ATIVIDADE_CANCELADA);

		StringBuilder tituloMensagem = new StringBuilder();
		tituloMensagem.append(mensagem.getTipoMensagem().getNome());
		tituloMensagem.append(": ");
		tituloMensagem.append(mensagem.getDescricao());
		tituloMensagem.append(" - ");
		tituloMensagem.append(DataUtil.formataData(new Date()));

		String corpoMensagem = montarCorpoMensagem(mensagem, atv);

		// envia mensagem:
		Date dataEnvio = new Date();
		messageSenderService.enviarMensagem(atv, ID_ATIVIDADE_CANCELADA, tituloMensagem.toString(), corpoMensagem);

		AtividadeMensagem atvMsg = mensagemRepository.obterAtividadeMensagem(mensagem.getId(), atv);
		atvMsg.setDataEnvio(dataEnvio);
		mensagemRepository.atualizar(atvMsg);
	}

	/**
	 * Monta o corpo da Mensagem a ser enviada.
	 * 
	 * @param mensagem
	 * @param atividade
	 * 
	 * @return
	 * 
	 * 		FIXME: Deve ser codificado em outra camada
	 */
	private String montarCorpoMensagem(Mensagem mensagem, Atividade atividade) {
		logger.debug("AtividadeChecklistServiceImpl.montarCorpoMensagem)");

		Atividade atv = atividadeRepository.obter(atividade.getId());

		String quebraLinha = System.getProperty("line.separator");
		StringBuilder corpoMensagem = new StringBuilder();
		corpoMensagem.append("Mensagem: ");
		corpoMensagem.append(mensagem.getDescricao());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Prevista: ");
		corpoMensagem.append(DataUtil.formataData(atividade.getDataInicioPrevisto()));
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora Cancelada: ");
		corpoMensagem.append(DataUtil.formataData(atividade.getDataFimRealizado()));
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Local: ");
		corpoMensagem.append(atv.getChecklist().getEvento().getLocal().getNome());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Evento: ");
		corpoMensagem.append(atv.getChecklist().getEvento().getNome());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Checklist: ");
		corpoMensagem.append(atv.getChecklist().getNome());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Atividade: ");
		corpoMensagem.append(atv.getNumeroItem());
		corpoMensagem.append(" - ");
		corpoMensagem.append(atv.getNome());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Responsável: ");
		corpoMensagem.append(atv.getUsuarioResponsavel().getPessoa().getNome());
		corpoMensagem.append(quebraLinha);

		Set<TelefonePessoa> telefones = atv.getUsuarioResponsavel().getPessoa().getTelefonesPessoais();
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

	@Override
	public List<Atividade> getAtividadesPrevistasPorCheckList(Checklist checklist) {
		return atividadeRepository.getAtividadesPrevistasPorCheckList(checklist);
	}

	@Deprecated
	@Override
	public Integer iniciarAtividadeMobile(Long idAtividade, Long idUsuario, String latitude, String longitude)
			throws ServiceException {
		logger.debug("AtividadeServiceImpl.iniciarAtividadeMobile");

		throw new ServiceException("Usar o método iniciarAtividade(Serializable, Serializable)");
	}

	@Deprecated
	@Override
	public boolean concluirAtividadeMobile(Long idAtividade, Long idUsuario, String observacao)
			throws ServiceException {
		logger.debug("AtividadeChecklistServiceImpl.concluirAtividadeMobile");

		throw new ServiceException("Usar o método iniciarAtividade(Serializable, String, Serializable)");
	}

	@Deprecated
	@Override
	public boolean cancelarAtividadeMobile(Long idAtividade, String observacao, boolean atividadeAuxiliar)
			throws ServiceException {
		logger.debug("AtividadeChecklistServiceImpl.cancelarAtividadeMobile");

		throw new ServiceException("Usar o método cancelarChecklist(Serializable, String, Date, Serializable)");
	}

	public void setAtividadeRepository(AtividadeRepository atividadeRepository) {
		this.atividadeRepository = atividadeRepository;
	}

	public void setUsuarioService(UsuarioService usuarioService) {
		this.usuarioService = usuarioService;
	}

	@Override
	public boolean hasAtividadeFormularioComQuestao(Long idAtividade) {
		if (idAtividade == null || idAtividade.equals(0L)) {
			throw new ServiceException("ID Atividade inválido");
		}
		return atividadeRepository.hasAtividadeFormularioComQuestao(idAtividade);
	}

	@Override
	public List<Atividade> buscarPorCheckListEmAberto(Long idCheckList, Long idUser) {

		logger.debug("AtividadeChecklistServiceImpl.buscarPorCheckListEmAberto()");

		if (idUser == null || idUser.equals(0L)) {
			throw new ServiceException("Usuário inválido!");
		}

		try {

			List<Atividade> lst = atividadeRepository.buscarPorCheckListEmAberto(idCheckList, idUser);

			for (Atividade atv : lst) {
				SituacaoEnum situacao = situacaoService.obterSituacaoPorAtividade(atv);
				atv.setSituacao(situacao);
			}

			return lst;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new ServiceException("Erro ao listar as Atividades!");
		}
	}

}
