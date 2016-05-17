package br.com.kolss.dto;

import org.primefaces.util.Base64;

import br.com.kolss.model.entities.Equipamento;

public class EquipamentoDTO {

	private Long id;
	private String nome;
	private String icone;
	private String latitude;
	private String longitude;
	private ModeloEquipamentoDTO modeloEquipamento;
	private String endereco;
	private String usuario;
	private String senha;

	public EquipamentoDTO(Equipamento equipamento) {
		this.id = equipamento.getId();
		this.nome = equipamento.getNome();
		this.icone = Base64.encodeToString(equipamento.getModeloEquipamento().getTipoEquipamento().getIcone(), false);
		this.latitude = equipamento.getLatitude();
		this.longitude = equipamento.getLongitude();
		this.modeloEquipamento = new ModeloEquipamentoDTO(equipamento.getModeloEquipamento());
		this.endereco = equipamento.getIpEquipamento();
		this.usuario = equipamento.getUsuario();
		this.senha = equipamento.getSenha();
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

	public String getIcone() {
		return icone;
	}

	public void setIcone(String icone) {
		this.icone = icone;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public ModeloEquipamentoDTO getModeloEquipamento() {
		return modeloEquipamento;
	}

	public void setModeloEquipamento(ModeloEquipamentoDTO modeloEquipamento) {
		this.modeloEquipamento = modeloEquipamento;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

}
