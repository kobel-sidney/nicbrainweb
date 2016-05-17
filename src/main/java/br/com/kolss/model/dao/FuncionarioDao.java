package br.com.kolss.model.dao;

import java.util.List;

import br.com.kolss.exception.DaoException;
import br.com.kolss.model.entities.Funcionario;

public interface FuncionarioDao {

	List<Funcionario> listarFuncionarioSubordinados(Integer idFuncionarioSuperior) throws DaoException;
	
	List<Funcionario> listarFuncionariosPorContratante(Long idContratante) throws DaoException;
	
	
}
