package br.com.kolss.enums;
/**
 * 
 * @author hamseshenrique
 *
 */
public enum TipoExportRelatorioEnum {
	
	PDF(1,"PDF"),
	EXCEL(2,"EXCEL"),
	CSV(3,"CSV");
	
	private Integer codigo;
	private String descricao;
	
	/**
	 * 
	 * @param codigo
	 * @param descricao
	 */
	private TipoExportRelatorioEnum(final Integer codigo,final String descricao){
		this.codigo = codigo;
		this.descricao = descricao;
	}

	/**
	 * @return the codigo
	 */
	public Integer getCodigo() {
		return codigo;
	}

	/**
	 * @return the descricao
	 */
	public String getDescricao() {
		return descricao;
	}
}
