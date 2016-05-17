package br.com.kolss.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.dto.AtividadeOcorrenciaDTO;
import br.com.kolss.dto.ClassificacaoOcorrenciaRondaDTO;
import br.com.kolss.dto.OcorrenciaDTO;
import br.com.kolss.dto.OcorrenciaRondaDTO;
import br.com.kolss.dto.RetornoAberturaOcorrenciaDTO;
import br.com.kolss.dto.TipoClassificacaoOcorrenciaDTO;
import br.com.kolss.enums.RetornoEnum;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.AtividadeOcorrencia;
import br.com.kolss.model.entities.ClassificacaoOcorrencia;
import br.com.kolss.model.entities.ClassificacaoProcedimento;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.GravidadeOcorrencia;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Mensagem;
import br.com.kolss.model.entities.Ocorrencia;
import br.com.kolss.model.entities.Procedimento;
import br.com.kolss.model.entities.Status;
import br.com.kolss.model.entities.StatusEnum;
import br.com.kolss.model.entities.TipoClassificacao;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.repository.OcorrenciaRepository;
import br.com.kolss.model.repository.TipoClassificacaoRepository;
import br.com.kolss.util.DataUtil;

@Service
public class OcorrenciaServiceImpl implements OcorrenciaService {

	private Logger logger = Logger.getLogger(this.getClass());

	private final static Long ID_OCORRENCIA_GERADA = Long.valueOf(33);

	@Autowired
	private UsuarioService usuarioService;

	@Autowired
	private EventoService eventoService;

	@Autowired
	private AtividadeChecklistService atividadeChecklistService;

	@Autowired
	private TipoClassificacaoService tipoClassificacaoService;

	@Autowired
	private ClassificacaoOcorrenciaService classificacaoOcorrenciaService;

	@Autowired
	private GravidadeOcorrenciaService gravidadeOcorrenciaService;

	@Autowired
	private StatusService statusService;

	@Autowired
	private MensagemService mensagemService;

	@Autowired
	private MessageSenderServiceImpl messageSenderService;

	@Autowired
	private OcorrenciaRepository ocorrenciaRepository;

	@Autowired
	private OperacaoAtividadeOcorrenciaService operacaoAtividadeOcorrenciaService;

	@Autowired
	private TipoClassificacaoRepository tipoClassificacaoRepository;

	@Override
	public Ocorrencia getOcorrencia(Serializable idOcorrencia) throws ServiceException {
		logger.debug("OcorrenciaServiceImpl.getOcorrencia");
		return ocorrenciaRepository.find(idOcorrencia);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvarImagem(Serializable idOcorrencia, String byteArrayImagem) throws ServiceException {
		logger.debug("OcorrenciaServiceImpl.salvarImagem");

		if (idOcorrencia == null) {
			throw new ServiceException("Ocorrência Inválida!");
		}

		ocorrenciaRepository.salvarImagem(idOcorrencia, byteArrayImagem);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public RetornoAberturaOcorrenciaDTO abrirNovaOcorrencia(OcorrenciaDTO ocorrenciaDTO) throws ServiceException {

		logger.debug("OcorrenciaServiceImpl.abrirNovaOcorrencia()");
		RetornoAberturaOcorrenciaDTO retorno = new RetornoAberturaOcorrenciaDTO(RetornoEnum.SUCESSSO);

		try {

			validarOcorrenciaDto(ocorrenciaDTO);
			Ocorrencia novaOcorrencia = converterOcorrencia(ocorrenciaDTO);
			novaOcorrencia.setDataInicio(new Date());
			novaOcorrencia.setDataUltimaAtualizacao(new Date());
			ocorrenciaRepository.salvar(novaOcorrencia);
			this.gerarAtividadesOcorrencia(novaOcorrencia);
			enviarAlerta(novaOcorrencia);
			retorno.setIdOcorrencia(String.valueOf(novaOcorrencia.getId()));

		} catch (Exception e) {
			retorno.setRetornoEnum(RetornoEnum.ERRO_NEGOCIO);
			e.printStackTrace();
		}

		return retorno;
	}

	private Ocorrencia converterOcorrencia(OcorrenciaDTO dto) {

		Ocorrencia o = new Ocorrencia();

		if (dto.getIdAtividade() != null) {
			Atividade atividade = atividadeChecklistService.obter(dto.getIdAtividade());
			o.setAtividade(atividade);
		}

		ClassificacaoOcorrencia classificacaoOcorrencia = classificacaoOcorrenciaService
				.obter(Long.valueOf(dto.getIdClassificacaoOcorrencia()));
		o.setClassificacaoOcorrencia(classificacaoOcorrencia);

		Usuario usuarioResponsavel = usuarioService.obter(Long.valueOf(dto.getIdUsuario()));
		o.setUsuarioResponsavel(usuarioResponsavel);

		GravidadeOcorrencia gravidadeOcorrencia = gravidadeOcorrenciaService
				.obter(Long.valueOf(dto.getIdGravidadeOcorrencia()));
		o.setGravidadeOcorrencia(gravidadeOcorrencia);

		TipoClassificacao tipoClassificacao = tipoClassificacaoService
				.obter(Long.valueOf(dto.getIdTipoClassificacaoOcorrencia()));
		o.setTipoClassificacao(tipoClassificacao);

		Status statusEmAndamento = statusService.obter(StatusEnum.EM_ANDAMENTO.getId());
		o.setStatus(statusEmAndamento);

		Evento evento = eventoService.obter(Long.valueOf(dto.getIdEvento()));
		o.setEvento(evento);

		o.setLongitude(dto.getLongitude());
		o.setLatitude(dto.getLatitude());
		o.setDescricaoOcorrencia(dto.getDescricaoOcorrencia());

		if (dto.getPhotoUpload() != null) {
			o.setFoto(dto.getPhotoUpload().getBytes());
		}

		return o;
	}

	private void validarOcorrenciaDto(OcorrenciaDTO ocorrenciaDTO) {

		if (ocorrenciaDTO == null) {
			throw new ServiceException("Ocorrencia Inválida!");
		}

		if (ocorrenciaDTO.getIdUsuario() == null || Long.parseLong(ocorrenciaDTO.getIdUsuario()) == 0L) {
			throw new ServiceException("Usuário Inválido!");
		}

		if (ocorrenciaDTO.getIdAtividade() != null && Long.parseLong(ocorrenciaDTO.getIdAtividade()) == 0L) {
			throw new ServiceException("Atividade Inválida!");
		}

		if (ocorrenciaDTO.getIdGravidadeOcorrencia() == null
				|| Long.parseLong(ocorrenciaDTO.getIdGravidadeOcorrencia()) == 0L) {
			throw new ServiceException("Classificação Ocorrencia Inválida!");
		}

		if (ocorrenciaDTO.getIdClassificacaoOcorrencia() == null
				|| Long.parseLong(ocorrenciaDTO.getIdClassificacaoOcorrencia()) == 0L) {
			throw new ServiceException("Gravidade Ocorrencia Inválida!");
		}

		if (ocorrenciaDTO.getIdTipoClassificacaoOcorrencia() == null
				|| Long.parseLong(ocorrenciaDTO.getIdTipoClassificacaoOcorrencia()) == 0L) {
			throw new ServiceException("Tipo Ocorrencia Inválida!");
		}

	}

	/**
	 * Envia o(s) Alerta(s) ao se criar uma nova Ocorrência.
	 *
	 * @param ocorrencia
	 */
	/*
	 * FIXME: Criar um serviço separado. Definir uma Interface para os entities
	 * que precisam enviar alerta;
	 */
	@Deprecated
	private void enviarAlerta(Ocorrencia ocorrencia) {
		logger.debug("OcorrenciaServiceImpl.enviarAlerta");

		Mensagem mensagem = mensagemService.obter(ID_OCORRENCIA_GERADA);

		StringBuilder tituloMensagem = new StringBuilder();
		tituloMensagem.append(mensagem.getTipoMensagem().getNome());
		tituloMensagem.append(": ");
		tituloMensagem.append(mensagem.getDescricao());
		tituloMensagem.append(" - ");
		tituloMensagem.append(DataUtil.formataData(new Date()));

		// Verificar se extrai em outro método:
		// String corpoMensagem = montarCorpoMensagem(mensagem, ocorrencia);
		String quebraLinha = System.getProperty("line.separator");
		StringBuilder corpoMensagem = new StringBuilder();
		corpoMensagem.append("Mensagem: ");
		corpoMensagem.append(mensagem.getDescricao());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Data/Hora da Ocorrência: ");
		corpoMensagem.append(ocorrencia.getDataInicio());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Classificacao Ocorrência: ");
		corpoMensagem.append(ocorrencia.getClassificacaoOcorrencia().getNome());
		if (ocorrencia.getTipoClassificacao() != null) {
			corpoMensagem.append(quebraLinha);
			corpoMensagem.append("Tipo Ocorrência: ");
			corpoMensagem.append(ocorrencia.getTipoClassificacao().getNome());
		}
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Gravidade: ");
		corpoMensagem.append(ocorrencia.getGravidadeOcorrencia().getNome());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Local: ");
		corpoMensagem.append(ocorrencia.getEvento().getLocal().getNome());
		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Evento: ");
		corpoMensagem.append(ocorrencia.getEvento().getNome());

		if (ocorrencia.getLatitude() != null && ocorrencia.getLongitude() != null) {
			corpoMensagem.append(quebraLinha);
			corpoMensagem.append("Latitude: ");
			corpoMensagem.append(ocorrencia.getLatitude());
			corpoMensagem.append(quebraLinha);
			corpoMensagem.append("Longitude: ");
			corpoMensagem.append(ocorrencia.getLongitude());
		}
		Usuario usuario = usuarioService.obter(ocorrencia.getUsuarioResponsavel().getId());

		corpoMensagem.append(quebraLinha);
		corpoMensagem.append("Responsável: ");
		corpoMensagem.append(usuario.getNome());

		messageSenderService.enviarMensagem(ocorrencia, mensagem.getId(), tituloMensagem.toString(),
				corpoMensagem.toString());

		// FIXME: ADEQUAR AS ENTITIES V12
		// // obtem os funcionarios diretamente relacionados:
		// List<FuncionarioId> idFuncionariosObrigatorios =
		// new ArrayList<FuncionarioId>();
		// Funcionario fnc = funcionarioService.find(
		// ocorrencia.getContexto().getIdPessoa(),
		// ocorrencia.getContexto().getIdContratante());
		// fnc.toString();
		// if (fnc != null) {
		// idFuncionariosObrigatorios.add(fnc.getId());
		// }
		// if (fnc.getFuncionarioSuperior() != null) {
		// idFuncionariosObrigatorios.add(fnc.getFuncionarioSuperior().getId());
		// }
		//
		// messageSenderService.enviarMensagem(
		// ocorrencia.getContexto().getIdContratante(),
		// ID_OCORRENCIA_GERADA,
		// tituloMensagem.toString(),
		// corpoMensagem.toString(),
		// idFuncionariosObrigatorios);
	}

	/**
	 * Lista todas as Atividades Ocorrência (princiapis e auxiliares) com o
	 * status <b>EM ANDAMENTO</b> de uma Ocorrência.
	 *
	 * @param idOcorrencia
	 * @return
	 */
	// TODO: não utilizado! Verificar necessidade!!!
	public List<AtividadeOcorrencia> listarAtividadeOcorrenciaEmAndamento(Integer idOcorrencia) {

		// TODO: Implementar!!!
		return Collections.<AtividadeOcorrencia> emptyList();
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public boolean concluirAtividadeOcorrencia(Serializable idAtividadeOcorrencia, String latitude, String longitude,
			String observacao, Serializable idUsuarioResponsavel) throws ServiceException {
		logger.debug("OcorrenciaServiceImpl.concluirAtividadeOcorrencia");

		if (idUsuarioResponsavel == null) {
			throw new ServiceException("Usuário inválido!");
		}

		return this.alterarStatusAtividadeOcorrencia(idAtividadeOcorrencia, StatusEnum.FINALIZADA.getId(), latitude,
				longitude, observacao, idUsuarioResponsavel);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public boolean cancelarAtividadeOcorrencia(Serializable idAtividadeOcorrencia, String latitude, String longitude,
			String observacao, Serializable idUsuarioResponsavel) throws ServiceException {
		logger.debug("OcorrenciaServiceImpl.cancelarAtividadeOcorrencia");

		if (idUsuarioResponsavel == null) {
			throw new ServiceException("Usuário inválido!");
		}

		return this.alterarStatusAtividadeOcorrencia(idAtividadeOcorrencia, StatusEnum.CANCELADA.getId(), latitude,
				longitude, observacao, idUsuarioResponsavel);

		/*
		 * FIXME: REATIVAR A CRIAÇÃO DA ATIVIDADE AUXILIAR APÓS A APRESENTAÇÃO
		 * DO 06/05/2014
		 * 
		 * //Criar nova Atividade Ocorrencia Auxiliar: // Obter o procedimento
		 * Auxiliar: if (cancelado) {
		 * 
		 * InterfaceDAO<AtividadeOcorrencia> dao = new
		 * HibernateDAO<AtividadeOcorrencia>( AtividadeOcorrencia.class,
		 * FacesContextUtil.getRequestSession());
		 * 
		 * Criteria criteria = dao.getCriteria();
		 * criteria.add(Restrictions.eq("id.idAtividadeOcorrencia",
		 * idAtividadeOcorrencia));
		 * 
		 * AtividadeOcorrencia atvOcorrencia = (AtividadeOcorrencia)
		 * criteria.uniqueResult(); Procedimento procedimentoPai = atvOcorrencia
		 * .getChecklistProcedimentoOcorrencia().getProcedimento(); Procedimento
		 * procedimentoAuxiliar = procedimentoPai.getProcedimentoAuxiliar();
		 * 
		 * if (procedimentoAuxiliar != null) {
		 * 
		 * // TODO: contador FAKE para exibir em ordem 1.x e 1.y // TODO:
		 * REMOVER APOS A APRESENTACAO: int nrItemFantasia = 0; // if
		 * (atvOcorrencia.getId().getNrItem() >= 1000) { // nrItemFantasia =
		 * atvOcorrencia.getId().getNrItem() + 100; // } else { //
		 * nrItemFantasia = (1000 * atvOcorrencia.getId().getNrItem()) // + 100;
		 * // }
		 * 
		 * // TODO: Apenas para gerar um novo número: nrItemFantasia =
		 * atvOcorrencia.getId().getNrItem().intValue();
		 * 
		 * 
		 * // Obter/Criar o checklistProcedimentoOcorrencia:
		 * ChecklistProcedimentoOcorrenciaId checklistProcedimentoOcorrenciaId =
		 * new ChecklistProcedimentoOcorrenciaId(
		 * atvOcorrencia.getId().getIdCheckListOcorrencia(),
		 * atvOcorrencia.getId().getIdClassificacaoOcorrencia(),
		 * procedimentoAuxiliar.getIdProcedimento(), nrItemFantasia);
		 * 
		 * ChecklistProcedimentoOcorrencia chkProc = new
		 * ChecklistProcedimentoOcorrencia( checklistProcedimentoOcorrenciaId,
		 * atvOcorrencia .getChecklistProcedimentoOcorrencia()
		 * .getChecklistOcorrencia(), procedimentoAuxiliar);
		 * 
		 * FacesContextUtil.getRequestSession().save(chkProc);
		 * 
		 * // Obter/Criar a atividade ocorrencia: // TODO: Extrair para método!
		 * AtividadeOcorrenciaId id = new AtividadeOcorrenciaId(null,
		 * atvOcorrencia.getOcorrencia().getIdOcorrencia(),
		 * atvOcorrencia.getChecklistProcedimentoOcorrencia().getId()
		 * .getIdCheckListOcorrencia(), atvOcorrencia
		 * .getChecklistProcedimentoOcorrencia().getId()
		 * .getIdClassificacaoOcorrencia(), chkProc
		 * .getProcedimento().getIdProcedimento(), chkProc
		 * .getId().getNrItem());
		 * 
		 * AtividadeOcorrencia atvOcorr = new AtividadeOcorrencia();
		 * atvOcorr.setId(id);
		 * atvOcorr.setOcorrencia(atvOcorrencia.getOcorrencia());
		 * atvOcorr.setChecklistProcedimentoOcorrencia(chkProc);
		 * atvOcorr.setDtInicioAtividade(new Date()); atvOcorr.setStatus(new
		 * Status(Status.ID_STATUS_EM_ANDAMENTO, "Em Andamento"));
		 * atvOcorr.setRealizado(false);
		 * 
		 * FacesContextUtil.getRequestSession().save(atvOcorr); }
		 * 
		 * }
		 * 
		 * return cancelado;
		 */
	}

	/**
	 * Altera o status de uma Atividade Ocorrência
	 *
	 * @param idAtividadeOcorrencia
	 * @param idPessoaResponsavel
	 * @param idStatus
	 * @param observacao
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	private boolean alterarStatusAtividadeOcorrencia(Serializable idAtividadeOcorrencia, Serializable idStatus,
			String latitude, String longitude, String observacao, Serializable idUsuarioResponsavel)
					throws ServiceException {
		logger.debug("OcorrenciaServiceImpl.alterarStatusAtividadeOcorrencia");

		// 01) Obtem a Atividade Status:
		AtividadeOcorrencia atividadeOcorrencia = ocorrenciaRepository.getAtividadeOcorrencia(idAtividadeOcorrencia);

		// 02) Verifica se a Atividade Ocorrencia ja foi realizada
		// (em caso positivo, nao faz nada):
		boolean alterado = false;
		if (!StatusEnum.FINALIZADA.getId().equals(atividadeOcorrencia.getStatus().getId())
				&& !StatusEnum.CANCELADA.getId().equals(atividadeOcorrencia.getStatus().getId())) {

			// 03) Inclui as novas informacoes:
			Status novoStatus = statusService.obter(idStatus);
			atividadeOcorrencia.setStatus(novoStatus);
			Date dataAtual = new Date();
			atividadeOcorrencia.setDataFim(dataAtual);
			atividadeOcorrencia.setObservacao(observacao);

			// 04) Atualiza com o novo Status:
			ocorrenciaRepository.atualizar(atividadeOcorrencia);

			// 05) Marca que a alteracao ocorreu com sucesso
			alterado = true;

			// 06) Grava a Operação:
			Usuario usuarioResponUsuario = usuarioService.obter(idUsuarioResponsavel);
			operacaoAtividadeOcorrenciaService.executarOperacao(idAtividadeOcorrencia, usuarioResponUsuario, novoStatus,
					latitude, longitude, dataAtual);

			// TODO: 07) Verifica se todas as Atividades Ocorrencia de uma
			// Ocorrencia tiveram seus Status alterados.
			// Em caso positivo, enviar alerta para uma Ocorrencia
			atualizarStatusOcorrencia(atividadeOcorrencia.getOcorrencia().getId());

			// 08) Altera o Status da Ocorrência caso não haja mais
			Ocorrencia oc = atividadeOcorrencia.getOcorrencia();
			Integer qtd = ocorrenciaRepository
					.getQuantidadeAtividadesOcorrenciaEmAndamento(atividadeOcorrencia.getOcorrencia());
			if (qtd.intValue() == 0) {
				Status status = statusService.obter(StatusEnum.FINALIZADA.getId());
				oc.setStatus(status);
				oc.setDataFim(dataAtual);
				ocorrenciaRepository.atualizar(oc);
			}
		}

		return alterado;
	}

	/**
	 * Realiza a atualização do <i>Status</i> de uma Ocorrência após a alteração
	 * do <i>Status</i> de uma Atividade Ocorrência.
	 *
	 * TODO: REFACTORING Posteriormente implementar a execução desta regra via
	 * "disparo de evento".
	 *
	 * @param idOcorrencia
	 */
	private void atualizarStatusOcorrencia(Serializable idOcorrencia) {

		// TODO: Implementar!!!
	}

	@Override
	public List<Ocorrencia> getOcorrenciasEmAndamento(Serializable filtroIdEvento, Serializable filtroIdLocal,
			Serializable filtroIdClassificacao, Serializable filtroIdTipoClassificacao, Serializable filtroIdStatus,
			Serializable filtroIdResponsavel, Serializable filtroIdSuperior, Date filtroDataInicio,
			Serializable idUsuarioContexto) throws ServiceException {
		logger.debug("OcorrenciaServiceImpl.getOcorrenciasEmAndamento");

		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário inválido");
		}

		return ocorrenciaRepository.getOcorrenciasEmAndamento(filtroIdEvento, filtroIdLocal, filtroIdClassificacao,
				filtroIdTipoClassificacao, filtroIdStatus, filtroIdResponsavel, filtroIdSuperior, filtroDataInicio,
				idUsuarioContexto);
	}

	// @Transactional
	// public List<ChecklistOcorrencia>
	// listarChecklistOcorrencia(ClassificacaoOcorrencia
	// classificacaoOcorrencia)
	// throws ServiceException {
	// //salvar occorencia
	// try {
	// ChecklistDaoImpl checklistDaoImpl = new ChecklistDaoImpl();
	// checklistDaoImpl.listarChecklistOcorrencia(classificacaoOcorrencia);
	//
	// return
	// checklistDaoImpl.listarChecklistOcorrencia(classificacaoOcorrencia);
	//
	// } catch (Exception e) {
	// logger.error(e.getMessage(), e);
	// throw new ServiceException(e);
	// }
	//
	// //salvar atividade ocorrencia
	//
	// }

	// public boolean inserirProcedimentosEmChecklistProcedimentoOcorrencia(
	// List<Procedimento1> listarProcedimentos) throws ServiceException {
	// // TODO Auto-generated method stub
	// return false;
	// }

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void concluirOcorrencia(Serializable idOcorrencia, String latitude, String longitude, String observacao,
			Serializable idUsuarioResponsavel) throws ServiceException {
		logger.debug("OcorrenciaServiceImpl.concluirOcorrencia");

		if (idUsuarioResponsavel == null) {
			throw new ServiceException("Usuário Inválido");
		}

		this.alterarStatusOcorrencia(idOcorrencia, StatusEnum.FINALIZADA.getId(), latitude, longitude, observacao,
				idUsuarioResponsavel);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void falharOcorrencia(Serializable idOcorrencia, String latitude, String longitude, String observacao,
			Serializable idUsuarioResponsavel) throws ServiceException {
		logger.debug("OcorrenciaServiceImpl.falharOcorrencia");

		if (idUsuarioResponsavel == null) {
			throw new ServiceException("Usuário Inválido");
		}

		this.alterarStatusOcorrencia(idOcorrencia, StatusEnum.CANCELADA.getId(), latitude, longitude, observacao,
				idUsuarioResponsavel);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	private void alterarStatusOcorrencia(Serializable idOcorrencia, Serializable idStatus, String latitude,
			String longitude, String observacao, Serializable idUsuarioResponsavel) throws ServiceException {
		logger.debug("OcorrenciaServiceImpl.alterarStatusOcorrencia");

		Ocorrencia ocorrencia = ocorrenciaRepository.find(idOcorrencia);

		// 01) Verifica se a Ocorrencia ja foi realizada
		// (em caso positivo, nao faz nada):
		if (!StatusEnum.FINALIZADA.getId().equals(ocorrencia.getStatus().getId())
				&& !StatusEnum.CANCELADA.getId().equals(ocorrencia.getStatus().getId())) {

			// 02) Inclui as novas informacoes:
			Status novoStatus = statusService.obter(idStatus);
			ocorrencia.setStatus(novoStatus);
			Date dataAtual = new Date();
			ocorrencia.setDataFim(dataAtual);

			// 04) Atualiza a Ocorrência:
			ocorrenciaRepository.atualizar(ocorrencia);

			// 05) Finaliza todas as Atividades Ocorrências em Aberto:
			for (AtividadeOcorrencia atvOc : ocorrencia.getAtividadesOcorrencias()) {
				if (!StatusEnum.FINALIZADA.getId().equals(atvOc.getStatus().getId())
						&& StatusEnum.CANCELADA.getId().equals(atvOc.getStatus().getId())) {

					this.alterarStatusAtividadeOcorrencia(atvOc.getId(), idStatus, latitude, longitude, observacao,
							idUsuarioResponsavel);
				}
			}
		}
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	private void gerarAtividadesOcorrencia(Ocorrencia ocorrencia) throws ServiceException {
		logger.debug("OcorrenciaServiceImpl.gerarAtividadesOcorrencia");

		Status status = statusService.obter(StatusEnum.EM_ANDAMENTO.getId());
		Usuario usuario = usuarioService.obter(ocorrencia.getUsuarioResponsavel().getId());
		ClassificacaoOcorrencia classificacaoOcorrencia = classificacaoOcorrenciaService
				.obter(ocorrencia.getClassificacaoOcorrencia().getId());

		for (ClassificacaoProcedimento classificacaoProcedimento : classificacaoOcorrencia
				.getClassificacoesProcedimentos()) {

			Procedimento procedimento = classificacaoProcedimento.getProcedimento();
			AtividadeOcorrencia atvOc = new AtividadeOcorrencia(null, procedimento.getNome(),
					procedimento.getDescricao(), classificacaoProcedimento.getNumeroItem(),
					procedimento.getTempoExecucaoEstimado(), procedimento.getTempoToleranciaInicio(),
					procedimento.getTempoToleranciaFim(), ocorrencia.getDataInicio(), null, null, status, ocorrencia,
					usuario);

			ocorrenciaRepository.salvar(atvOc);
			ocorrencia.getAtividadesOcorrencias().add(atvOc);
		}

		// FIXME: ADEQUAR AS ENTITIES V12
		// List<ChecklistProcedimentoOcorrencia> lst =
		// ocorrenciaRepository.getChecklistsProcedimentosOcorrencias(
		// ocorrencia.getClassificacaoOcorrencia().getIdClassificacaoOcorrencia());
		//
		// // Status
		// Status status = statusService.find(Status.ID_STATUS_EM_ANDAMENTO);
		// for (ChecklistProcedimentoOcorrencia chk : lst) {
		//
		// AtividadeOcorrenciaId id = new AtividadeOcorrenciaId(null,
		// ocorrencia.getIdOcorrencia(),
		// chk.getId().getIdCheckListOcorrencia(),
		// chk.getId().getIdClassificacaoOcorrencia(),
		// chk.getAtividade().getIdProcedimento(),
		// chk.getId().getNrItem());
		//
		// AtividadeOcorrencia atvOc = new AtividadeOcorrencia(
		// id,
		// ocorrencia,
		// chk,
		// status,
		// ocorrencia.getDtInicioOcorrencia(),
		// null,
		// null,
		// false);
		//
		// ocorrenciaRepository.salvar(atvOc);
		// }
	}

	@Override
	// TODO: não utilizado! Verificar necessidade!!!
	public List<Ocorrencia> getOcorrenciasEmAndamentoPorLocalPorContexto(Serializable filtroIdLocal,
			Serializable filtroIdCliente, Serializable filtroIdContratante, Serializable idUsuario)
					throws ServiceException {
		logger.debug("OcorrenciaServiceImpl.getOcorrenciasEmAndamentoPorLocalPorContexto");

		return ocorrenciaRepository.getOcorrenciasEmAndamentoPorEvento(null, filtroIdContratante, filtroIdCliente,
				filtroIdLocal, usuarioService.obter(idUsuario));
	}

	@Deprecated
	@Override
	// TODO: não utilizado! Verificar necessidade!!!
	public List<Ocorrencia> getOcorrenciasEmAndamentoPorLocalPorContexto(Local local, Serializable idUsuario) {
		logger.debug("OcorrenciaServiceImpl.getOcorrenciasEmAndamentoPorLocalPorContexto");

		// FIXME: ADEQUAR AS ENTITIES V12
		return new ArrayList<Ocorrencia>();
		// return ocorrenciaRepository.getOcorrenciasEmAndamentoPorEvento(
		// null,
		// local.getIdContratante(),
		// local.getIdCliente(),
		// local.getIdLocal(),
		// usuarioService.getUsuario(idUsuario));
		// return
		// ocorrenciaRepository.getOcorrenciasEmAndamentoPorLocalPorContexto(
		// local,
		// usuarioService.getUsuarioPorId(idUsuario));
	}

	@Deprecated
	@Override
	// TODO: não utilizado! Verificar necessidade!!!
	public List<Ocorrencia> getOcorrenciasEmAbertoPorContexto(Integer filtroIdLocal, Integer filtroIdCliente,
			Integer filtroIdContratante, Serializable idUsuario) throws ServiceException {
		logger.debug("OcorrenciaServiceImpl.getOcorrenciasEmAbertoPorContexto");

		return ocorrenciaRepository.getOcorrenciasEmAndamentoPorEvento(null, filtroIdContratante, filtroIdCliente,
				filtroIdLocal, usuarioService.obter(idUsuario));
		// return ocorrenciaRepository.getOcorrenciasEmAberto(filtroIdLocal,
		// filtroIdCliente,
		// filtroIdContratante,
		// usuarioService.getUsuarioPorId(idUsuario));
	}

	@Override
	// TODO: não utilizado! Verificar necessidade!!!
	public List<Ocorrencia> getOcorrenciasEmAndamentoPorEventoPorContexto(Integer filtroIdEvento)
			throws ServiceException {
		logger.debug("OcorrenciaServiceImpl.getOcorrenciasEmAndamentoPorEventoPorContexto");

		return ocorrenciaRepository.getOcorrenciasEmAndamentoPorEvento(filtroIdEvento, null, null, null, null);
	}

	@Override
	public List<AtividadeOcorrencia> getAtividadesOcorrencias(Serializable idOcorrencia) {
		logger.debug("OcorrenciaServiceImpl.getAtividadesOcorrencias");

		return ocorrenciaRepository.obterAtividadesPorOcorrencia(idOcorrencia);
	}

	@Override
	public void atualizar(Ocorrencia ocorrencia) throws ServiceException {
		logger.debug("OcorrenciaServiceImpl.atualizar(Ocorrencia)");

		ocorrenciaRepository.atualizar(ocorrencia);
	}

	@Override
	public void atualizar(AtividadeOcorrencia atividadeOcorrencia) throws ServiceException {
		logger.debug("OcorrenciaServiceImpl.atualizar(AtividadeOcorrencia)");

		ocorrenciaRepository.atualizar(atividadeOcorrencia);
	}

	@Override
	public AtividadeOcorrencia getAtividadeOcorrencia(Serializable idAtividadeOcorrencia) throws ServiceException {
		logger.debug("OcorrenciaServiceImpl.getAtividadeOcorrencia");

		return ocorrenciaRepository.getAtividadeOcorrencia(idAtividadeOcorrencia);
	}

	@Override
	public List<OcorrenciaRondaDTO> listarOcorrenciasEmEspera(Usuario usuario) throws ServiceException {
		Status status = new Status();
		status.setId(3L);

		Status s = statusService.obter(status.getId());

		List<Ocorrencia> ocorrencias = null;
		List<OcorrenciaRondaDTO> ocorrenciaRondaDTOs = null;
		if (s != null) {
			ocorrencias = ocorrenciaRepository.listarOcorrenciaPorStatus(s, usuario);
		}

		if (ocorrencias != null) {
			ocorrenciaRondaDTOs = new ArrayList<>();

			for (Ocorrencia ocorrencia : ocorrencias) {
				OcorrenciaRondaDTO o = new OcorrenciaRondaDTO();
				o.setIdOcorrencia(ocorrencia.getId());
				o.setDescricaoOcorrencia(ocorrencia.getDescricaoOcorrencia());
				o.setLatitude(ocorrencia.getLatitude());
				o.setLongitude(ocorrencia.getLongitude());
				o.setClassificacao(new ClassificacaoOcorrenciaRondaDTO(ocorrencia.getClassificacaoOcorrencia()));
				o.setTipoClassificacao(new TipoClassificacaoOcorrenciaDTO(ocorrencia.getTipoClassificacao()));
				o.setDataInicio(DataUtil.getSomenteData(ocorrencia.getDataInicio()));
				o.setHoraInicio(DataUtil.getSomenteHora(ocorrencia.getDataInicio()));
				ocorrenciaRondaDTOs.add(o);
			}
		}

		return ocorrenciaRondaDTOs;
	}

	@Override
	public List<OcorrenciaRondaDTO> obterOcorrenciasEmEsperaPorUsuario(Usuario usuario) throws ServiceException {
		List<Ocorrencia> ocorrencias = ocorrenciaRepository.obterOcorrenciasEmEsperaPorUsuario(usuario);

		List<OcorrenciaRondaDTO> ocorrenciaRondaDTOs = null;
		if (ocorrencias != null) {
			ocorrenciaRondaDTOs = new ArrayList<>();

			for (Ocorrencia ocorrencia : ocorrencias) {
				OcorrenciaRondaDTO o = new OcorrenciaRondaDTO();
				o.setIdOcorrencia(ocorrencia.getId());
				o.setDescricaoOcorrencia(ocorrencia.getDescricaoOcorrencia());
				o.setLatitude(ocorrencia.getLatitude());
				o.setLongitude(ocorrencia.getLongitude());
				o.setClassificacao(new ClassificacaoOcorrenciaRondaDTO(ocorrencia.getClassificacaoOcorrencia()));
				o.setTipoClassificacao(new TipoClassificacaoOcorrenciaDTO(ocorrencia.getTipoClassificacao()));
				o.setDataInicio(DataUtil.getSomenteData(ocorrencia.getDataInicio()));
				o.setHoraInicio(DataUtil.getSomenteHora(ocorrencia.getDataInicio()));
				ocorrenciaRondaDTOs.add(o);
			}
		}

		return ocorrenciaRondaDTOs;
	}

	@Override
	public List<AtividadeOcorrenciaDTO> obterAtividadeOcorrenciaPorIdOcorrencia(Long idOcorrencia) {

		if (idOcorrencia == null || idOcorrencia.compareTo(0l) == 0) {
			throw new ServiceException("Id ocorrencia inválido");
		}

		List<AtividadeOcorrencia> atvsOcs = ocorrenciaRepository.obterAtividadesPorOcorrencia(idOcorrencia);

		List<AtividadeOcorrenciaDTO> lst = new ArrayList<AtividadeOcorrenciaDTO>();
		for (AtividadeOcorrencia atividadeOcorrencia : atvsOcs) {
			AtividadeOcorrenciaDTO atividadeOcorrenciaDTO = new AtividadeOcorrenciaDTO();
			atividadeOcorrenciaDTO.setIdAtividadeOcorrencia(Long.toString(atividadeOcorrencia.getId()));
			atividadeOcorrenciaDTO.setDescricaoProcedimentoOcorrencia(atividadeOcorrencia.getDescricao());
			atividadeOcorrenciaDTO.setDescricaoStatus(atividadeOcorrencia.getStatus().getNome());
			atividadeOcorrenciaDTO.setDtFimExecucaoAtividade(DataUtil.formataData(atividadeOcorrencia.getDataFim()));
			atividadeOcorrenciaDTO.setDtInicioAtividade(DataUtil.formataData(atividadeOcorrencia.getDataInicio()));
			atividadeOcorrenciaDTO.setObservacao(atividadeOcorrencia.getObservacao());
			lst.add(atividadeOcorrenciaDTO);
		}
		return lst;
	}

	@Override
	public List<OcorrenciaRondaDTO> obterOcorrenciasFinalizadasPorUsuario(Usuario usuario) throws ServiceException {

		Date fim = new Date();
		Date inicio;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(Calendar.SECOND, -10);
		inicio = calendar.getTime();
		List<Ocorrencia> ocorrenciasFinalizadas = ocorrenciaRepository.obterOcorrenciasFinalizadasPorUsuario(usuario,
				inicio, fim);

		List<OcorrenciaRondaDTO> ocorrenciasFinalizadasDTO = null;

		if (ocorrenciasFinalizadas != null) {
			ocorrenciasFinalizadasDTO = new ArrayList<>();

			for (Ocorrencia ocorrencia : ocorrenciasFinalizadas) {
				OcorrenciaRondaDTO o = new OcorrenciaRondaDTO();
				o.setIdOcorrencia(ocorrencia.getId());
				o.setDescricaoOcorrencia(ocorrencia.getDescricaoOcorrencia());
				o.setLatitude(ocorrencia.getLatitude());
				o.setLongitude(ocorrencia.getLongitude());
				o.setClassificacao(new ClassificacaoOcorrenciaRondaDTO(ocorrencia.getClassificacaoOcorrencia()));
				o.setTipoClassificacao(new TipoClassificacaoOcorrenciaDTO(ocorrencia.getTipoClassificacao()));
				o.setDataInicio(DataUtil.getSomenteData(ocorrencia.getDataInicio()));
				o.setHoraInicio(DataUtil.getSomenteHora(ocorrencia.getDataInicio()));
				ocorrenciasFinalizadasDTO.add(o);
			}
		}

		return ocorrenciasFinalizadasDTO;
	}

	@Override
	public void alterarResponsavel(OcorrenciaRondaDTO ocorrenciaRondaDTO) throws ServiceException {
		Usuario usuario = usuarioService.obter(ocorrenciaRondaDTO.getIdResponsavel());
		if (usuario == null) {
			throw new ServiceException("Não é possível alterar o responsável pela ocorrencia com usuário nulo.");
		}

		Ocorrencia ocorrencia = ocorrenciaRepository.find(ocorrenciaRondaDTO.getIdOcorrencia());
		if (ocorrencia == null) {
			throw new ServiceException("Não é possível alterar o responsável pela ocorrência com ocorrência nula.");
		}

		ocorrencia.setUsuarioResponsavel(usuario);
		ocorrenciaRepository.atualizar(ocorrencia);
	}

	@Override
	public List<OcorrenciaRondaDTO> obterOcorrenciasEmEsperaPorResponsavel(Long userID) throws ServiceException {
		Usuario usuario = usuarioService.obter(userID);
		if (usuario == null) {
			throw new ServiceException("Não é possível buscar ocorrências pelo responsável. Usuário nulo.");
		}

		List<Ocorrencia> ocorrencias = ocorrenciaRepository.obterOcorrenciasEmEsperaPorResponsavel(usuario);
		List<OcorrenciaRondaDTO> ocorrenciasDTO = null;

		if (ocorrencias != null) {
			ocorrenciasDTO = new ArrayList<>(0);

			for (Ocorrencia ocorrencia : ocorrencias) {
				OcorrenciaRondaDTO o = new OcorrenciaRondaDTO();
				o.setIdOcorrencia(ocorrencia.getId());
				o.setDescricaoOcorrencia(ocorrencia.getDescricaoOcorrencia());
				o.setLatitude(ocorrencia.getLatitude());
				o.setLongitude(ocorrencia.getLongitude());
				o.setClassificacao(new ClassificacaoOcorrenciaRondaDTO(ocorrencia.getClassificacaoOcorrencia()));
				o.setTipoClassificacao(new TipoClassificacaoOcorrenciaDTO(ocorrencia.getTipoClassificacao()));
				o.setDataInicio(DataUtil.getSomenteData(ocorrencia.getDataInicio()));
				o.setHoraInicio(DataUtil.getSomenteHora(ocorrencia.getDataInicio()));
				ocorrenciasDTO.add(o);
			}
		}

		return ocorrenciasDTO;
	}

	@Override
	public OcorrenciaRondaDTO getOccurrenceByIDDTO(Long occurrenceID) throws ServiceException {
		if (occurrenceID == null) {
			throw new ServiceException("Não é possível obter ocorrêcia com o ID nulo.");
		}

		Ocorrencia occurrence = ocorrenciaRepository.find(occurrenceID);
		if (occurrence == null) {
			throw new ServiceException("Não existe ocorrência com esse ID.");
		}

		return new OcorrenciaRondaDTO(occurrence);
	}

	@Override
	public List<TipoClassificacaoOcorrenciaDTO> getTypeByClassificationDTO(Long classificationID)
			throws ServiceException {
		if (classificationID == null) {
			throw new ServiceException("Não é possível obter ocorrêcia com o ID nulo.");
		}

		ClassificacaoOcorrencia classification = classificacaoOcorrenciaService.obter(classificationID);
		if (classification == null) {
			throw new ServiceException("Não existe classificação com esse ID.");
		}

		List<TipoClassificacao> tipos = tipoClassificacaoRepository.getByClassification(classification);

		List<TipoClassificacaoOcorrenciaDTO> tiposDTO = new ArrayList<>(0);
		for (TipoClassificacao tipoClassificacao : tipos) {
			tiposDTO.add(new TipoClassificacaoOcorrenciaDTO(tipoClassificacao));
		}

		return tiposDTO;
	}

	@Override
	public List<AtividadeOcorrenciaDTO> listarAtividadeOcorrenciaPorUsuario(String idUsuario) {
		
		if(idUsuario == null || idUsuario.equals("0")){
			throw new ServiceException("ID Usuário inválido");
		}
		
		Long id = Long.parseLong(idUsuario);
		List<AtividadeOcorrencia> list = ocorrenciaRepository.listarAtividadeOcorrenciaPorUsuario(id);
		List<AtividadeOcorrenciaDTO> atividadeOcorrenciaDTOs = new ArrayList<AtividadeOcorrenciaDTO>();
		
		for (AtividadeOcorrencia atividadeOcorrencia : list) {
			AtividadeOcorrenciaDTO atividadeOcorrenciaDTO = new AtividadeOcorrenciaDTO();
			atividadeOcorrenciaDTO.setIdAtividadeOcorrencia(Long.toString(atividadeOcorrencia.getId()));
			atividadeOcorrenciaDTO.setDescricaoProcedimentoOcorrencia(atividadeOcorrencia.getDescricao());
			atividadeOcorrenciaDTO.setDescricaoStatus(atividadeOcorrencia.getStatus().getNome());
			atividadeOcorrenciaDTO.setDtFimExecucaoAtividade(DataUtil.formataData(atividadeOcorrencia.getDataFim()));
			atividadeOcorrenciaDTO.setDtInicioAtividade(DataUtil.formataData(atividadeOcorrencia.getDataInicio()));
			atividadeOcorrenciaDTO.setObservacao(atividadeOcorrencia.getObservacao());
			atividadeOcorrenciaDTOs.add(atividadeOcorrenciaDTO);
		}
		
		
		return atividadeOcorrenciaDTOs;
	}

}