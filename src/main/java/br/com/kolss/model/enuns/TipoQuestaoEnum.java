package br.com.kolss.model.enuns;

public enum TipoQuestaoEnum {
	
	TEXTO(1,"TEXTO"),
	DATA(2,"DATA"),
	SELECT(3,"SELECT"),
	CHECKBOX(4,"CHECKBOX"),
	TABLE(5,"TABLE"),
	TEXTO_AREA(6,"TEXTO AREA"),
	ASSINATURA(7,"ASSINATURA"),
	TEXTO_NUMERICO(8,"TEXTO NUMERICO"),
	TEXTO_DECIMAL(9,"TEXTO DECIMAL"),
	TEXTO_TELEFONE(10,"TEXTO TELEFONE"),
	TEXTO_CELUALR(11,"TEXTO CELUALR"),
	TEXTO_EMAIL(12,"TEXTO EMAIL"),
	LABEL(13,"LABEL");
	
	private Integer codigo;
	private String descricao;
	
	private TipoQuestaoEnum(final Integer codigo,final String descricao){
		this.codigo = codigo;
		this.descricao = descricao;
	}

	public Integer getCodigo() {
		return codigo;
	}

	public String getDescricao() {
		return descricao;
	}
	
	public static TipoQuestaoEnum getValue(final Integer codigo){
		
		TipoQuestaoEnum tipoQuestaoEnum = TipoQuestaoEnum.TEXTO;
		
		for (TipoQuestaoEnum tipo : values()) {
			if(tipo.getCodigo().equals(codigo)){
				tipoQuestaoEnum = tipo;
				break;
			}
		}
		return tipoQuestaoEnum;
	}
}
