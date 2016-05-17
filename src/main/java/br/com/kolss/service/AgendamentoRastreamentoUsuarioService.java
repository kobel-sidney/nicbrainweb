package br.com.kolss.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.AgendamentoRastreamentoUsuario;


public interface AgendamentoRastreamentoUsuarioService {
	
	/**
	 * Obtém o Rastreamento pelo Id.
	 * 
	 * @return Rastreamento
	 * 
	 * @throws ServiceException
	 */
	AgendamentoRastreamentoUsuario getRastreamentoPorId(Serializable idRastreamento);
	
	/**
	 * Obtém todos os Rastreamentos pelo Nome do Usuário e Por Periodo.
	 * 
	 * @return Lista de Rastreamentos
	 * 
	 * @throws ServiceException
	 */
	List<AgendamentoRastreamentoUsuario> getRastreamentosAtivosPeloNomeDoUsuarioEPorPeriodo(String nomeDoUsuario, Date dataInicial, Date dataFinal);

	/**
	 * Obtém todos os Rastreamentos pelo Nome do Usuário.
	 * 
	 * @return Lista de Rastreamentos
	 * 
	 * @throws ServiceException
	 */
	List<AgendamentoRastreamentoUsuario> getRastreamentosAtivosPeloNomeDoUsuario(String nomeDoUsuario);
	
	/**
	 * Obtém todos os Rastreamentos por Periodo.
	 * 
	 * @return Lista de Rastreamentos
	 * 
	 * @throws ServiceException
	 */
	List<AgendamentoRastreamentoUsuario> getRastreamentosAtivosPorPeriodo(Date dataInicial, Date dataFinal);
	
	/**
	 * Obtém todos os Rastreamentos por Pessoa.
	 * 
	 * @return Lista de Rastreamentos
	 * 
	 * @throws ServiceException
	 */
	List<AgendamentoRastreamentoUsuario> getRastreamentosPorUsuario(Serializable idDoUsuario);
	
	/**
	 * Obtém todas os Rastreamentos Ativos.
	 * 
	 * @return Lista de Rastreamento
	 * 
	 * @throws ServiceException
	 */
	List<AgendamentoRastreamentoUsuario> getRastreamentosAtivos();
	
	/**
	 * Obtém todas os Rastreamentos Ativos por Vigencia.
	 * 
	 * @return Lista de Rastreamento
	 * 
	 * @throws ServiceException
	 */
	List<AgendamentoRastreamentoUsuario> getRastreamentosAtivosPorVigencia(Date vigenciaDeRastreamento);
	
	public void salvar(AgendamentoRastreamentoUsuario rastreamento);
	
	public void alterar(AgendamentoRastreamentoUsuario rastreamento);
	
	public void excluir(AgendamentoRastreamentoUsuario rastreamento);
	
}
