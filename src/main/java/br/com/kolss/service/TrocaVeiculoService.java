package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.dto.GuarnicaoDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TrocaVeiculo;

public interface TrocaVeiculoService {
	
	void inserir(TrocaVeiculo trocaVeiculo) throws ServiceException;
	void atualizar(TrocaVeiculo trocaVeiculo)throws ServiceException;
	void deletar(TrocaVeiculo trocaVeiculo)throws ServiceException;
	List<TrocaVeiculo> obterTodos(Contratante contratante)throws ServiceException;
	TrocaVeiculo obter(Serializable id,Contratante contratante)throws ServiceException;

        /**
         * Retorna as guarnições pelo ID do veículo
         * 
         * @param idVeiculo
         * @return 
         */
        List<GuarnicaoDTO> buscarGuarnicoes(Long idVeiculo) throws ServiceException;
}
