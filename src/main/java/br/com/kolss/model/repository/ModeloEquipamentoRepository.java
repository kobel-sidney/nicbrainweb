package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.ModeloEquipamento;

public interface ModeloEquipamentoRepository {

	void atualizar(ModeloEquipamento modeloEquipamento);
	void salvar(ModeloEquipamento modeloEquipamento);
	void remover(ModeloEquipamento modeloEquipamento);
	ModeloEquipamento obter(Serializable id);
	List<ModeloEquipamento> obterTodos(Contratante contratante);

}
