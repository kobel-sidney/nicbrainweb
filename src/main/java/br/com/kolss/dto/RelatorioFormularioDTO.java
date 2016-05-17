package br.com.kolss.dto;

import java.util.ArrayList;
import java.util.List;

public class RelatorioFormularioDTO {
	
	private String logo;
	private String descricaoFormulario;
	private List<GrupoQuestaoDTO> grupo = new ArrayList<GrupoQuestaoDTO>();
	
	public RelatorioFormularioDTO(){}

	/**
	 * @return the descricaoFormulario
	 */
	public String getDescricaoFormulario() {
		return descricaoFormulario;
	}

	/**
	 * @param descricaoFormulario the descricaoFormulario to set
	 */
	public void setDescricaoFormulario(String descricaoFormulario) {
		this.descricaoFormulario = descricaoFormulario;
	}

	/**
	 * @return the grupo
	 */
	public List<GrupoQuestaoDTO> getGrupo() {
		return grupo;
	}

	/**
	 * @param grupo the grupo to set
	 */
	public void setGrupo(List<GrupoQuestaoDTO> grupo) {
		this.grupo = grupo;
	}

	/**
	 * @return the logo
	 */
	public String getLogo() {
		return logo;
	}

	/**
	 * @param logo the logo to set
	 */
	public void setLogo(String logo) {
		this.logo = logo;
	}	
}