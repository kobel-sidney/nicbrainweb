package br.com.kolss.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Evento;

public interface EventoService {

	List<Evento> listarEvento();

	void salvar(Evento evento);

	void atualizar(Evento evento);

	void remover(Evento evento);

	/**
	 * Retorna o Evento pelo seu ID, contendo todos os seus atributos populados.
	 * 
	 * @param idEvento
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	public Evento obter(Serializable idEvento) throws ServiceException;

	/**
	 * Retorna os Eventos Ativos e visiveis ao Contexto do Usuário selecionado e
	 * com pelo menos um Checklist ativo e Não Finalizado.<br>
	 * Os Eventos são ordenados de forma decrescente pela sua Data de Início.<br>
	 * 
	 * @param idLocal
	 * @param idUsuarioResponsavel
	 * @param idUsuarioContexto
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Evento> getEventosComChecklistNaoEncerrados(Serializable idLocal,
			Serializable idUsuarioResponsavel, Serializable idUsuarioContexto)
			throws ServiceException;

	/**
	 * Retorna todos os eventos que o usuário selecionado pode visualizar.
	 * 
	 * @param filtroIdLocal
	 * @param filtroIdResponsavel
	 * @param filtroIdCliente
	 * @param filtroDataInicio
	 * @param idUsuarioContexto
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Evento> getEventosPorChecklist(Serializable filtroIdLocal,
			Serializable filtroIdResponsavel, Serializable filtroIdCliente,
			Date filtroDataInicio, Serializable idUsuarioContexto)
			throws ServiceException;

	/**
	 * Retorna todos os eventos que o usuário selecionado pode visualizar no
	 * Relatório.
	 * 
	 * @param filtroIdLocal
	 * @param filtroIdResponsavel
	 * @param filtroIdCliente
	 * @param filtroDataInicio
	 * @param idUsuarioContexto
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Evento> obterPorChecklistRelatorio(Serializable filtroIdLocal,
			Serializable filtroIdResponsavel, Serializable filtroIdCliente,
			Date filtroDataInicio, Serializable idUsuarioContexto)
			throws ServiceException;

	/**
	 * Obtém todos os Eventos de um Determinado Cliente.
	 * 
	 * @param idCliente
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Evento> getEventosPorCliente(Long idCliente)
			throws ServiceException;

	/**
	 * Retorna todos os eventos que o usuário selecionado pode visualizar no
	 * Rastreamento de Checklist.
	 * 
	 * @param filtroIdLocal
	 * @param filtroIdResponsavel
	 * @param filtroIdCliente
	 * @param filtroDataInicio
	 * @param idUsuarioContexto
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Evento> getEventosPorChecklistRastreamento(Serializable filtroIdLocal,
			Serializable filtroIdResponsavel, Serializable filtroIdCliente,
			Date filtroDataInicio, Serializable idUsuarioContexto)
			throws ServiceException;

	/**
	 * 
	 * @param contratante
	 * @return 
	 */
	List<Evento> eventosPorContratante(Contratante contratante);

}