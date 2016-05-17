package br.com.kolss.dto;

import java.util.ArrayList;
import java.util.List;

public class PerfilFormularioDTO extends RetornoDTO {
	
	private Long id;
	private String descricao;
	private String dataCriacao;
	private List<GrupoQuestaoDTO> listGrupoPerguntas;
	
	public PerfilFormularioDTO(){}

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
	 * @return the dataCriacao
	 */
	public String getDataCriacao() {
		return dataCriacao;
	}

	/**
	 * @param dataCriacao the dataCriacao to set
	 */
	public void setDataCriacao(String dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	/**
	 * @return the listGrupoPerguntas
	 */
	public List<GrupoQuestaoDTO> getListGrupoPerguntas() {
		if(listGrupoPerguntas == null){
			listGrupoPerguntas = new ArrayList<GrupoQuestaoDTO>();
		}
		return listGrupoPerguntas;
	}

	/**
	 * @param listGrupoPerguntas the listGrupoPerguntas to set
	 */
	public void setListGrupoPerguntas(List<GrupoQuestaoDTO> listGrupoPerguntas) {
		this.listGrupoPerguntas = listGrupoPerguntas;
	}
}