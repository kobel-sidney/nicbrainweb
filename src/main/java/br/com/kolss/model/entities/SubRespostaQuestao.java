package br.com.kolss.model.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sub_resposta_questao")
public class SubRespostaQuestao implements Serializable{

	private static final long serialVersionUID = -4295850234825399057L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", nullable = false, unique = true)
	private Long id;
	
	@Column(name = "id_atividade", nullable = false)
	private Long idAtividade;
	
	@Column(name = "id_perfil_formulario", nullable = false)
	private Long idPerfilFormulario;

	@Column(name = "id_grupo_questao", nullable = false)
	private Long idGrupoQuestao;

	@Column(name = "id_questao", nullable = false)
	private Long idQuestao;
	
	@Column(name = "id_resposta", nullable = true)
	private Long idResposta;
	
	@Column(name = "id_sub_questao", nullable = true)
	private Long idSubQuestao;
	
	@Column(name = "id_sub_resposta", nullable = true)
	private Long idSubResposta;
	
	@Column(name = "comentario", nullable = true)
	private String comentario;
	
	@Column(name = "linha", nullable = true)
	private Integer linha;
	
	@Column(name = "ordem_questao", nullable = true)
	private Integer ordemQuestao;
	
	@Column(name = "ordem_sub_questao", nullable = true)
	private Integer ordemSubQuestao;
	
	@Column(name = "ordem_sub_resposta", nullable = true)
	private Integer ordemSubResposta;
	
	public SubRespostaQuestao(){}

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
	 * @return the idPerfilFormulario
	 */
	public Long getIdPerfilFormulario() {
		return idPerfilFormulario;
	}

	/**
	 * @param idPerfilFormulario the idPerfilFormulario to set
	 */
	public void setIdPerfilFormulario(Long idPerfilFormulario) {
		this.idPerfilFormulario = idPerfilFormulario;
	}

	/**
	 * @return the idGrupoQuestao
	 */
	public Long getIdGrupoQuestao() {
		return idGrupoQuestao;
	}

	/**
	 * @param idGrupoQuestao the idGrupoQuestao to set
	 */
	public void setIdGrupoQuestao(Long idGrupoQuestao) {
		this.idGrupoQuestao = idGrupoQuestao;
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
				+ ((comentario == null) ? 0 : comentario.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((idAtividade == null) ? 0 : idAtividade.hashCode());
		result = prime * result
				+ ((idGrupoQuestao == null) ? 0 : idGrupoQuestao.hashCode());
		result = prime
				* result
				+ ((idPerfilFormulario == null) ? 0 : idPerfilFormulario
						.hashCode());
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
		SubRespostaQuestao other = (SubRespostaQuestao) obj;
		if (comentario == null) {
			if (other.comentario != null)
				return false;
		} else if (!comentario.equals(other.comentario))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (idAtividade == null) {
			if (other.idAtividade != null)
				return false;
		} else if (!idAtividade.equals(other.idAtividade))
			return false;
		if (idGrupoQuestao == null) {
			if (other.idGrupoQuestao != null)
				return false;
		} else if (!idGrupoQuestao.equals(other.idGrupoQuestao))
			return false;
		if (idPerfilFormulario == null) {
			if (other.idPerfilFormulario != null)
				return false;
		} else if (!idPerfilFormulario.equals(other.idPerfilFormulario))
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
}
