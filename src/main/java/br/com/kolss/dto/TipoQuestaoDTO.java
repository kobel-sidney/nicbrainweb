package br.com.kolss.dto;

public class TipoQuestaoDTO {
	
	private Long id;
	private String descricao;
	private String formatacao;
	
	public TipoQuestaoDTO() {}

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the descricao
	 */
	public String getDescricao() {
		return descricao;
	}

	/**
	 * @param descricao the descricao to set
	 */
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	/**
	 * @return the formatacao
	 */
	public String getFormatacao() {
		return formatacao;
	}

	/**
	 * @param formatacao the formatacao to set
	 */
	public void setFormatacao(String formatacao) {
		this.formatacao = formatacao;
	}
}
