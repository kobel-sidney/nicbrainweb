package br.com.kolss.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.enuns.SituacaoEnum;
import br.com.kolss.model.repository.EventoRepository;

@Service("EventoService")
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class EventoServiceImpl implements EventoService {

	protected Logger logger = Logger.getLogger(getClass());

	@Autowired
	protected EventoRepository eventoRepository;

	@Autowired
	protected SituacaoService situacaoService;
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Evento obter(Serializable idEvento) throws ServiceException {
		logger.debug("EventoServiceImpl.find");

		if (idEvento == null) {
			throw new ServiceException("ID Evento inválido");
		}

		return eventoRepository.find(idEvento);
	}

	@Override
	public List<Evento> getEventosComChecklistNaoEncerrados(
			Serializable idLocal, Serializable idUsuarioResponsavel,
			Serializable idUsuarioContexto) throws ServiceException {
		logger.debug("EventoServiceImpl.getEventosComChecklistNaoEncerrados");

		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário Contexto inválido!");
		}

		return eventoRepository.getEventosComChecklistNaoEncerrados(idLocal,
				idUsuarioResponsavel, idUsuarioContexto);
	}

	@Override
	public List<Evento> getEventosPorChecklist(Serializable filtroIdLocal,
			Serializable filtroIdResponsavel, Serializable filtroIdCliente,
			Date filtroDataInicio, Serializable idUsuarioContexto)
			throws ServiceException {
		logger.debug("EventoServiceImpl.getEventosPorChecklist");

		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário inválido");
		}

		List<Evento> lst = eventoRepository.getEventosPorChecklist(
				filtroIdLocal, filtroIdResponsavel, filtroIdCliente,
				filtroDataInicio, idUsuarioContexto);

		for (Evento evt : lst) {
			SituacaoEnum situacao = situacaoService.obterSituacaoPorEvento(evt);

			evt.setSituacao(situacao);
		}

		return lst;
	}

	@Override
	public List<Evento> obterPorChecklistRelatorio(
			Serializable filtroIdLocal, Serializable filtroIdResponsavel,
			Serializable filtroIdCliente, Date filtroDataInicio,
			Serializable idUsuarioContexto) throws ServiceException {
		logger.debug("EventoServiceImpl.getEventosPorChecklistRelatorio");

		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário inválido");
		}

		List<Evento> lst = eventoRepository.getEventosPorChecklistRelatorio(
				filtroIdLocal, filtroIdResponsavel, filtroIdCliente,
				filtroDataInicio, idUsuarioContexto);

		for (Evento evt : lst) {
			SituacaoEnum situacao = situacaoService.obterSituacaoPorEvento(evt);

			evt.setSituacao(situacao);
		}

		return lst;
	}

	@Override
	public List<Evento> getEventosPorCliente(Long idCliente)
			throws ServiceException {

		return eventoRepository.getEventosPorCliente(idCliente);
	}

	@Override
	public List<Evento> getEventosPorChecklistRastreamento(
			Serializable filtroIdLocal, Serializable filtroIdResponsavel,
			Serializable filtroIdCliente, Date filtroDataInicio,
			Serializable idUsuarioContexto) throws ServiceException {

		logger.debug("EventoServiceImpl.getEventosPorChecklistRastreamento");

		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário inválido");
		}

		List<Evento> lst = eventoRepository.getEventosPorChecklistRastreamento(
				filtroIdLocal, filtroIdResponsavel, filtroIdCliente,
				filtroDataInicio, idUsuarioContexto);

		for (Evento evt : lst) {

			SituacaoEnum situacao = situacaoService.obterSituacaoPorEvento(evt);
			evt.setSituacao(situacao);
		}

		return lst;

	}

	@Override
	public List<Evento> listarEvento() {
		return eventoRepository.listarEvento();
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void salvar(Evento evento) {
		eventoRepository.salvar(evento);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void atualizar(Evento evento) {
		eventoRepository.atualizar(evento);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void remover(Evento evento) {
		eventoRepository.remover(evento);
	}
	
	@Override
	public List<Evento> eventosPorContratante(Contratante contratante) {
		return eventoRepository.getEventosPorContratante(contratante);
	}
}