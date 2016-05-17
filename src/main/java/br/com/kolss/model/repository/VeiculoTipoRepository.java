package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.TipoVeiculo;

public interface VeiculoTipoRepository {

	TipoVeiculo BuscarPorId(Long id);

	List<TipoVeiculo> buscarTodos();

}
