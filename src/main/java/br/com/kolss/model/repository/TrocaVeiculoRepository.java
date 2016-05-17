package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TrocaVeiculo;
import br.com.kolss.model.entities.Veiculo;

public interface TrocaVeiculoRepository {
	
	void inserir(TrocaVeiculo trocaVeiculo);
	void atualizar(TrocaVeiculo trocaVeiculo);
	void deletar(TrocaVeiculo trocaVeiculo);
	List<TrocaVeiculo> obterTodos(Contratante contratante);
	TrocaVeiculo obter(Serializable id,Contratante contratante);

        /**
         * Retorna a troca de veiculo com status de saída pelo veículo
         * 
         * @param veiculo
         * @return 
         */
        TrocaVeiculo buscarComStatusSaida(Veiculo veiculo);
}
