package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Veiculo;


public interface VeiculoRepository {
	
	void inserir(Veiculo veiculo);
	void atualizar(Veiculo veiculo);
	void deletar(Veiculo veiculo);
	List<Veiculo> obterTodos(Contratante contratante);
	Veiculo obter(Serializable id,Contratante contratante);
	List<Veiculo> obterPorCliente(Cliente cliente);
	Veiculo obter(Long id);
	
}
