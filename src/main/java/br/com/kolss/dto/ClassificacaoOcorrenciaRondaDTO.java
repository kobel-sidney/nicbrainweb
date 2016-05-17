package br.com.kolss.dto;

import br.com.kolss.model.entities.ClassificacaoOcorrencia;

public class ClassificacaoOcorrenciaRondaDTO {

	private String descricao;
	private byte[] pin;
	private byte[] icone;

	public ClassificacaoOcorrenciaRondaDTO() {
	}

	public ClassificacaoOcorrenciaRondaDTO(ClassificacaoOcorrencia classificacaoOcorrencia) {
		this.descricao = classificacaoOcorrencia.getNome();
		this.pin = classificacaoOcorrencia.getPin();
		this.icone = classificacaoOcorrencia.getIcone();
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public byte[] getPin() {
		return pin;
	}

	public void setPin(byte[] pin) {
		this.pin = pin;
	}

	public byte[] getIcone() {
		return icone;
	}

	public void setIcone(byte[] icone) {
		this.icone = icone;
	}

}
