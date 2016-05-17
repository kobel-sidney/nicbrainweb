package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.DaoException;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.Funcionario;
import br.com.kolss.model.entities.Ocorrencia;
import br.com.kolss.model.entities.Usuario;


public interface FuncionarioService {

	/**
	 * Retorna o Funcionário pelo seu ID.
	 *
	 * @param idFuncionario
	 *
	 * @return
	 */
	public Funcionario find(Long idFuncionario) throws ServiceException;

	/**
	 * Retorna todos os funcionarios responsáveis por Checklists.
	 *
	 * @param usuario
	 *
	 * @return
	 */
	List<Funcionario> getFuncionariosResponsaveisPorChecklist(Usuario usuario);

	/**
	 * Retorna todos os funcionarios responsáveis por Atividade.
	 *
	 * @param usuario
	 *
	 * @return
	 */
	List<Funcionario> getFuncionariosResponsaveisPorAtividade(Usuario usuario);

	/**
	 *
	 * @param idFuncionarioSuperior
	 * @return
	 * @throws DaoException
	 */
	List<Funcionario> getFuncionariosSubordinados(Integer idFuncionarioSuperior) throws DaoException;

	/**
	 *
	 * @param idContratante
	 * @return
	 * @throws DaoException
	 */
	List<Funcionario> getFuncionariosPorContratante(Long idContratante) throws DaoException;

	Funcionario getFuncionario(Usuario usuario) throws ServiceException;


	/**
	 * Retorna o Funcionário Superior de um Ocorrencia.
	 *
	 * @param ocorrencia
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	Funcionario getFuncionarioSuperior(Ocorrencia ocorrencia)
			throws ServiceException;

	/**
	 * Retorna o Funcionário Superior de um Checklist.
	 *
	 * @param checklist
	 *
	 * @return
	 */
	Funcionario getFuncionarioSuperior(Checklist checklist)
			throws ServiceException;

	/**
	 * Retorna o Funcionário Superior de uma Atividade.
	 *
	 * @param atividade
	 *
	 * @return
	 */
	Funcionario getFuncionarioSuperior(Atividade atividade)
			throws ServiceException;

	/**
	 * Retorna os Funcionários por Evento.
	 *
	 * @param usuario
	 *
	 * @return Lista de Strings
	 */
	List<String> getPorEvento(Usuario usuario);

	/**
	 * Retorna todos os funcionários
	 *
	 * @return Lista de funcionários
	 */
	List<Funcionario> listarTodosFuncionarios();

	/*
	 * Salva ou atualiza funcionário
	 */
	void salvarOuAtualizar(Funcionario funcionario) throws ServiceException;

	/**
	 * Exclusão lógica de funcionario
	 *
	 * @param funcionario
	 * @throws ServiceException
	 */
	void excluir(Funcionario funcionario) throws ServiceException;
	
	/**
	 *
	 * @return funcionarios
	 * @throws ServiceException
	 */
	List<Funcionario> getFuncionarios() throws ServiceException;

}
