package br.com.kolss.dto;
/**
 * 
 * @author hamseshenrique
 *
 */
public class SubRespostaQuestaoDTO {
	
	private Long idAtividade;
	private Long idPerfil;
	private Long idGrupo;
	private Long idQuestao;
	private Long idResposta;
	private Long idSubQuestao;
	private String descricaoSubQuestao;
	private Long idSubResposta;
	private String descricaoSubResposta;
	private String comentario;
	private Integer linha;
	private Integer ordemQuestao;
	private Integer ordemSubQuestao;
	private Integer ordemSubResposta;
	
	public SubRespostaQuestaoDTO(){}

	/**
	 * @return the idAtividade
	 */
	public Long getIdAtividade() {
		return idAtividade;
	}

	/**
	 * @param idAtividade the idAtividade to set
	 */
	public void setIdAtividade(Long idAtividade) {
		this.idAtividade = idAtividade;
	}

	/**
	 * @return the idPerfil
	 */
	public Long getIdPerfil() {
		return idPerfil;
	}

	/**
	 * @param idPerfil the idPerfil to set
	 */
	public void setIdPerfil(Long idPerfil) {
		this.idPerfil = idPerfil;
	}

	/**
	 * @return the idGrupo
	 */
	public Long getIdGrupo() {
		return idGrupo;
	}

	/**
	 * @param idGrupo the idGrupo to set
	 */
	public void setIdGrupo(Long idGrupo) {
		this.idGrupo = idGrupo;
	}

	/**
	 * @return the idQuestao
	 */
	public Long getIdQuestao() {
		return idQuestao;
	}

	/**
	 * @param idQuestao the idQuestao to set
	 */
	public void setIdQuestao(Long idQuestao) {
		this.idQuestao = idQuestao;
	}

	/**
	 * @return the idResposta
	 */
	public Long getIdResposta() {
		return idResposta;
	}

	/**
	 * @param idResposta the idResposta to set
	 */
	public void setIdResposta(Long idResposta) {
		this.idResposta = idResposta;
	}

	/**
	 * @return the idSubQuestao
	 */
	public Long getIdSubQuestao() {
		return idSubQuestao;
	}

	/**
	 * @param idSubQuestao the idSubQuestao to set
	 */
	public void setIdSubQuestao(Long idSubQuestao) {
		this.idSubQuestao = idSubQuestao;
	}

	/**
	 * @return the idSubResposta
	 */
	public Long getIdSubResposta() {
		return idSubResposta;
	}

	/**
	 * @param idSubResposta the idSubResposta to set
	 */
	public void setIdSubResposta(Long idSubResposta) {
		this.idSubResposta = idSubResposta;
	}

	/**
	 * @return the comentario
	 */
	public String getComentario() {
		return comentario;
	}

	/**
	 * @param comentario the comentario to set
	 */
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	/**
	 * @return the linha
	 */
	public Integer getLinha() {
		return linha;
	}

	/**
	 * @param linha the linha to set
	 */
	public void setLinha(Integer linha) {
		this.linha = linha;
	}

	/**
	 * @return the ordemQuestao
	 */
	public Integer getOrdemQuestao() {
		return ordemQuestao;
	}

	/**
	 * @param ordemQuestao the ordemQuestao to set
	 */
	public void setOrdemQuestao(Integer ordemQuestao) {
		this.ordemQuestao = ordemQuestao;
	}

	/**
	 * @return the ordemSubQuestao
	 */
	public Integer getOrdemSubQuestao() {
		return ordemSubQuestao;
	}

	/**
	 * @param ordemSubQuestao the ordemSubQuestao to set
	 */
	public void setOrdemSubQuestao(Integer ordemSubQuestao) {
		this.ordemSubQuestao = ordemSubQuestao;
	}

	/**
	 * @return the ordemSubResposta
	 */
	public Integer getOrdemSubResposta() {
		return ordemSubResposta;
	}

	/**
	 * @param ordemSubResposta the ordemSubResposta to set
	 */
	public void setOrdemSubResposta(Integer ordemSubResposta) {
		this.ordemSubResposta = ordemSubResposta;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((idAtividade == null) ? 0 : idAtividade.hashCode());
		result = prime * result + ((idGrupo == null) ? 0 : idGrupo.hashCode());
		result = prime * result
				+ ((idPerfil == null) ? 0 : idPerfil.hashCode());
		result = prime * result
				+ ((idQuestao == null) ? 0 : idQuestao.hashCode());
		result = prime * result
				+ ((idResposta == null) ? 0 : idResposta.hashCode());
		result = prime * result
				+ ((idSubQuestao == null) ? 0 : idSubQuestao.hashCode());
		result = prime * result
				+ ((idSubResposta == null) ? 0 : idSubResposta.hashCode());
		result = prime * result + ((linha == null) ? 0 : linha.hashCode());
		result = prime * result
				+ ((ordemQuestao == null) ? 0 : ordemQuestao.hashCode());
		result = prime * result
				+ ((ordemSubQuestao == null) ? 0 : ordemSubQuestao.hashCode());
		result = prime
				* result
				+ ((ordemSubResposta == null) ? 0 : ordemSubResposta.hashCode());
		return result;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SubRespostaQuestaoDTO other = (SubRespostaQuestaoDTO) obj;
		if (idAtividade == null) {
			if (other.idAtividade != null)
				return false;
		} else if (!idAtividade.equals(other.idAtividade))
			return false;
		if (idGrupo == null) {
			if (other.idGrupo != null)
				return false;
		} else if (!idGrupo.equals(other.idGrupo))
			return false;
		if (idPerfil == null) {
			if (other.idPerfil != null)
				return false;
		} else if (!idPerfil.equals(other.idPerfil))
			return false;
		if (idQuestao == null) {
			if (other.idQuestao != null)
				return false;
		} else if (!idQuestao.equals(other.idQuestao))
			return false;
		if (idResposta == null) {
			if (other.idResposta != null)
				return false;
		} else if (!idResposta.equals(other.idResposta))
			return false;
		if (idSubQuestao == null) {
			if (other.idSubQuestao != null)
				return false;
		} else if (!idSubQuestao.equals(other.idSubQuestao))
			return false;
		if (idSubResposta == null) {
			if (other.idSubResposta != null)
				return false;
		} else if (!idSubResposta.equals(other.idSubResposta))
			return false;
		if (linha == null) {
			if (other.linha != null)
				return false;
		} else if (!linha.equals(other.linha))
			return false;
		if (ordemQuestao == null) {
			if (other.ordemQuestao != null)
				return false;
		} else if (!ordemQuestao.equals(other.ordemQuestao))
			return false;
		if (ordemSubQuestao == null) {
			if (other.ordemSubQuestao != null)
				return false;
		} else if (!ordemSubQuestao.equals(other.ordemSubQuestao))
			return false;
		if (ordemSubResposta == null) {
			if (other.ordemSubResposta != null)
				return false;
		} else if (!ordemSubResposta.equals(other.ordemSubResposta))
			return false;
		return true;
	}

	/**
	 * @return the descricaoSubQuestao
	 */
	public String getDescricaoSubQuestao() {
		return descricaoSubQuestao;
	}

	/**
	 * @param descricaoSubQuestao the descricaoSubQuestao to set
	 */
	public void setDescricaoSubQuestao(String descricaoSubQuestao) {
		this.descricaoSubQuestao = descricaoSubQuestao;
	}

	/**
	 * @return the descricaoSubResposta
	 */
	public String getDescricaoSubResposta() {
		return descricaoSubResposta;
	}

	/**
	 * @param descricaoSubResposta the descricaoSubResposta to set
	 */
	public void setDescricaoSubResposta(String descricaoSubResposta) {
		this.descricaoSubResposta = descricaoSubResposta;
	}
	
}