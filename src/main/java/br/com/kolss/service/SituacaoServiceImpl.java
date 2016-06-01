package br.com.kolss.service;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.*;
import br.com.kolss.model.enuns.SituacaoEnum;
import br.com.kolss.model.enuns.SituacaoOcorrenciaEnum;
import br.com.kolss.model.repository.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.*;


@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class SituacaoServiceImpl implements SituacaoService {

    private Logger logger = Logger.getLogger(getClass());

    @Autowired
    private OcorrenciaService ocorrenciaService;

    @Autowired
    private AtividadeRepository atividadeRepository;

    @Autowired
    private ChecklistRepository checklistRepository;

    @Autowired
    private EventoRepository eventoRepository;

    @Autowired
    private LocalRepository localRepository;

    @Override
    public SituacaoEnum obterSituacaoPorAtividade(Atividade atividade) {

        logger.debug("SituacaoServiceImpl.getSituacao(Atividade)");
        Atividade atv = atividade;

        if (atividade.getStatus() == null) {
            atv = atividadeRepository.obter(atividade.getId());
        }

        Set<IMensagemAssociada> iMsgAssociadas = new HashSet<IMensagemAssociada>(atv.getAtividadesMensagens());
        Status statusAtual = atv.getStatus();

        return obterSituacaoPorMensagensAsssociadas(statusAtual.getId().intValue(), iMsgAssociadas);
    }

    @Override
    public SituacaoEnum obterPorChecklist(Checklist checklist) throws ServiceException {

        logger.debug("SituacaoServiceImpl.getSituacao(Checklist)");

        Checklist chk = checklist;

        if (checklist.getStatus() == null) {
            chk = checklistRepository.obter(checklist.getId());
        }

        SituacaoEnum indicador = SituacaoEnum.SEM_INDICADOR;

        Status statusAtual = chk.getStatus();

        if (StatusEnum.CANCELADA.getId().equals(statusAtual.getId())) {

            indicador = SituacaoEnum.CANCELADA;

        } else {

            // Obtém a Situação do Checklist:
            Long idStatus = statusAtual.getId();

            Set<IMensagemAssociada> iMsgAssociadas = new HashSet<IMensagemAssociada>(chk.getChecklistsMensagens());
            SituacaoEnum situacaoChecklist = obterSituacaoPorMensagensAsssociadas(statusAtual.getId().intValue(), iMsgAssociadas);

            // Agrupa as Situações das Atividades e inclui a Situação do Checklist:
            Map<Serializable, Set<SituacaoEnum>> mapSituacoesPorStatus = agruparSituacoesPorStatus(chk.getAtividades());

            if (!mapSituacoesPorStatus.containsKey(idStatus)) {
                mapSituacoesPorStatus.put(idStatus, new HashSet<SituacaoEnum>());
            }
            mapSituacoesPorStatus.get(idStatus).add(situacaoChecklist);

            // Itera as Situações pela prioridade de Status:
            for (StatusEnum statusEnum : StatusEnum.values()) {
                if (mapSituacoesPorStatus.containsKey(statusEnum.getId())) {
                    Set<SituacaoEnum> situacoes = mapSituacoesPorStatus.get(statusEnum.getId());
                    indicador = getSituacaoMaiorPrioridade(situacoes);
                    break;
                }
            }
        }

        return indicador;
    }

    @Override
    public SituacaoEnum obterSituacaoPorEvento(Evento evento) throws ServiceException {

        logger.debug("SituacaoServiceImpl.getSituacao(Evento)");

        Evento evt = evento;

        if (evento.getChecklists().isEmpty()) {
            evt = eventoRepository.find(evento.getId());
        }

        Set<SituacaoEnum> situacoes = new HashSet<SituacaoEnum>();
        for (Checklist chk : evt.getChecklists()) {

            SituacaoEnum situacao = obterPorChecklist(chk);
            situacoes.add(situacao);
        }

        return getSituacaoMaiorPrioridade(situacoes);
    }

    @Override
    public SituacaoEnum obterSituacaoPorLocal(Local local) throws ServiceException {
        logger.debug("SituacaoServiceImpl.getSituacao(Local)");

        Local loc = local;

        if (local.getEventos().isEmpty()) {
            loc = localRepository.find(local.getId());
        }

        Set<SituacaoEnum> situacoes = new HashSet<SituacaoEnum>();
        Collection<Evento> eventos = loc.getEventos();
        for (Evento evt : eventos) {

            SituacaoEnum situacao = obterSituacaoPorEvento(evt);
            situacoes.add(situacao);
        }

        return getSituacaoMaiorPrioridade(situacoes);
    }

    /**
     * Obtém a Situação pelo Status.
     *
     * @param idStatus
     * @param mensagensAssociadas ocorrenciaService
     * @return
     */
    private SituacaoEnum obterSituacaoPorMensagensAsssociadas(int idStatus, Collection<IMensagemAssociada> mensagensAssociadas) {

        logger.debug("SituacaoServiceImpl.getSituacao(int, Collection<IMensagemAssociada>)");

        SituacaoEnum resultado = SituacaoEnum.SEM_INDICADOR;
        Long id = ((Integer) idStatus).longValue();
        StatusEnum statusEnum = StatusEnum.find(id);

        switch (statusEnum) {

            case AGENDADO:
            case AGUARDANDO:
                resultado = SituacaoEnum.AGENDADO;
                if (isDataEnvioMensagem(mensagensAssociadas)) {
                    resultado = SituacaoEnum.ALERTA_VIGENTE;
                }
                break;

            case EM_ANDAMENTO:
                resultado = SituacaoEnum.SEM_ALERTA;
                if (isDataEnvioMensagem(mensagensAssociadas)) {
                    resultado = SituacaoEnum.ALERTA_OCORRIDO;
                    if (hasIdMensagem(mensagensAssociadas, 15L)) {
                        resultado = SituacaoEnum.ALERTA_VIGENTE;
                    }
                }
                break;

            case PAUSADA:
                break;

            case CANCELADA:
                resultado = SituacaoEnum.CANCELADA;
                break;

            case FINALIZADA:
                resultado = SituacaoEnum.SEM_ALERTA;
                if (isDataEnvioMensagem(mensagensAssociadas)) {
                    resultado = SituacaoEnum.ALERTA_OCORRIDO;
                }
                break;

            default:
                break;
        }

        return resultado;
    }

    private Boolean isDataEnvioMensagem(final Collection<IMensagemAssociada> mensagensAssociadas) {
        Boolean dataValida = Boolean.FALSE;

        for (IMensagemAssociada iMsg : mensagensAssociadas) {
            if (iMsg.getDataEnvio() != null) {
                dataValida = Boolean.TRUE;
                break;
            }
        }

        return dataValida;
    }

    private Boolean hasIdMensagem(final Collection<IMensagemAssociada> mensagensAssociadas, Long id) {
        Boolean result = Boolean.FALSE;

        for (IMensagemAssociada iMsg : mensagensAssociadas) {
            if (iMsg.getMensagem() != null &&
                    iMsg.getMensagem().getId() != null &&
                    iMsg.getMensagem().getId().equals(id)) {
                result = Boolean.TRUE;
                break;
            }
        }

        return result;
    }

    /**
     * Agrupa as Situações das Atividades pelo seu respectivo Status.
     *
     * @return
     */
    private Map<Serializable, Set<SituacaoEnum>> agruparSituacoesPorStatus(Collection<Atividade> atividades) {

        logger.debug("SituacaoServiceImpl.agruparSituacoesPorStatus");

        // Agrupa as Situações por Status:
        Map<Serializable, Set<SituacaoEnum>> mapStatus = new HashMap<Serializable, Set<SituacaoEnum>>();
        for (Atividade atv : atividades) {
            Serializable idStatus = atv.getStatus().getId();

            if (!mapStatus.containsKey(atv.getStatus().getId())) {
                mapStatus.put(idStatus, new HashSet<SituacaoEnum>());
            }

            SituacaoEnum situacao = obterSituacaoPorAtividade(atv);
            atv.setSituacao(situacao);
            Set<SituacaoEnum> setSituacoes = mapStatus.get(idStatus);
            setSituacoes.add(situacao);
        }

        return mapStatus;
    }

    /**
     * Retorna a Situação com maior prioridade.
     *
     * @return
     */
    private SituacaoEnum getSituacaoMaiorPrioridade(Collection<SituacaoEnum> situacoes) {
        logger.debug("SituacaoServiceImpl.getMaiorPrioridade");

        SituacaoEnum maiorPrioridade = SituacaoEnum.SEM_INDICADOR;
        if (situacoes != null && !situacoes.isEmpty()) {

            // Itera a Collection para obter a maior Situação:
            for (SituacaoEnum situacao : situacoes) {
                if (situacao.getPrioridade() > maiorPrioridade.getPrioridade()) {
                    maiorPrioridade = situacao;
                }
            }
        }

        return maiorPrioridade;
    }

    @Override
    public SituacaoOcorrenciaEnum obterSituacaoOcorrencia(Local local,
                                                          Serializable idUsuarioContexto) throws ServiceException {

        List<Ocorrencia> lst = ocorrenciaService.getOcorrenciasEmAndamentoPorLocalPorContexto(local.getId(), null, null, idUsuarioContexto);

        SituacaoOcorrenciaEnum situacaoOcorrencia = SituacaoOcorrenciaEnum.SEM_INDICADOR;
        if (lst != null && !lst.isEmpty()) {
            situacaoOcorrencia = SituacaoOcorrenciaEnum.OCORRENCIA_VIGENTE;
        } else {
            situacaoOcorrencia = SituacaoOcorrenciaEnum.SEM_OCORRENCIA;
        }

        return situacaoOcorrencia;
    }

    public void setChecklistRepository(ChecklistRepository checklistRepository) {
        this.checklistRepository = checklistRepository;
    }

    public void setEventoRepository(EventoRepository eventoRepository) {
        this.eventoRepository = eventoRepository;
    }

    public void setLocalRepository(LocalRepository localRepository) {
        this.localRepository = localRepository;
    }

    public void setAtividadeRepository(AtividadeRepositoryImpl atividadeRepository) {
        this.atividadeRepository = atividadeRepository;
    }

}
