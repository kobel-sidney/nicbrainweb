package br.com.kolss.dto;

import br.com.kolss.model.entities.Pessoa;

public class PessoaDTO {

	private String nome;
	private byte[] foto;
	
	public PessoaDTO() {
	}

	public PessoaDTO(Pessoa pessoa) {
		this.nome = pessoa.getNome();
		this.foto = pessoa.getFoto();
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

}
