package br.com.kolss.enums;

public enum RetornoEnum {
	
	SUCESSSO(0,"OK"),
	SENHA_INVALIDA(1,"Senha INVALIDA"),
	USUARIO_INVALIDO(2,"Usuario Invalido"),
	ERRO_OBTER_USUARIO(3,"ERRO AO OBTER USUARIO"),
	REGISTRO_NAO_ENCONTRADO(4,"REGISTRO NAO ENCONTRADO"),
	ERRO_SALVAR_ENVIO_FORMULARIO(5,"ERRO AO SALVAR ENVIO DO FORMULARIO"),
	DATA_INVALIDA(6, "FORMATACAO DA DATA INVALIDA"),
	ERRO_NEGOCIO(7,"ERRO NEGOCIO"),
	VAZIO(8, "Nenhum registro encontrado");
	
	
	private Integer codigo;
	private String messagem;
	
	private RetornoEnum(Integer codigo,String messagem){
		
		this.codigo = codigo;
		this.messagem = messagem;
	}

	public Integer getCodigo() {
		return codigo;
	}

	public String getMessagem() {
		return messagem;
	}
}
