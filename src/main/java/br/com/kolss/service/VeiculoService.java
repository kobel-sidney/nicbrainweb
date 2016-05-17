package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Veiculo;

public interface VeiculoService {

	void inserir(Veiculo veiculo) throws ServiceException;
	
	void atualizar(Veiculo veiculo)throws ServiceException;
	
	void deletar(Veiculo veiculo)throws ServiceException;
	
	List<Veiculo> obterTodos(Contratante contratante)throws ServiceException;

	List<Veiculo> obterPorCliente(Cliente cliente);
	
	Veiculo obter(Serializable id)throws ServiceException;

}
