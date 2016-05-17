package br.com.kolss.dto;

import br.com.kolss.model.entities.ModeloEquipamento;

public class ModeloEquipamentoDTO {

	private Long id;
	private String nome;

	public ModeloEquipamentoDTO(ModeloEquipamento modeloEquipamento) {
		this.id = modeloEquipamento.getId();
		this.nome = modeloEquipamento.getNome();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
