package br.com.kolss.dto;

import java.io.Serializable;

public class RetornoAlterarSenhaDTO implements Serializable{
	
	
	private static final long serialVersionUID = 6260723920927299357L;

	private String Mensagem;

	public String getMensagem() {
		return Mensagem;
	}

	public void setMensagem(String mensagem) {
		Mensagem = mensagem;
	}
	
	

}
