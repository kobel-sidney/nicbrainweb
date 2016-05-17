package br.com.kolss.model.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "resposta_questao")
public class RespostaQuestao implements Serializable{
	
	private static final long serialVersionUID = -3278011538731894655L;

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
	
	@Column(name = "comentario", nullable = true)
	private String comentario;
	
	@Lob	
	@Column(name = "assinatura", nullable = true)
	private byte[] assinatura;
	
	@Column(name = "ordem_grupo", nullable = false)
	private Integer ordemGrupo;

	@Column(name = "ordem_pergunta", nullable = false)
	private Integer ordemPergunta;

	@Column(name = "ordem_resposta", nullable = true)
	private Integer ordemResposta;
	
	

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "RespostaQuestao [id=" + id + ", idAtividade=" + idAtividade
				+ ", idPerfilFormulario=" + idPerfilFormulario
				+ ", idGrupoQuestao=" + idGrupoQuestao + ", idQuestao="
				+ idQuestao + ", idResposta=" + idResposta + ", comentario="
				+ comentario + "]";
	}

	public Long getId() {
		return id;
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
	 * @return the comentario
	 */
	public String getComentario() {
		return comentario;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		RespostaQuestao other = (RespostaQuestao) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	/**
	 * @param comentario the comentario to set
	 */
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the assinatura
	 */
	public byte[] getAssinatura() {
		return assinatura;
	}

	/**
	 * @param assinatura the assinatura to set
	 */
	public void setAssinatura(byte[] assinatura) {
		this.assinatura = assinatura;
	}

	/**
	 * @return the ordemGrupo
	 */
	public Integer getOrdemGrupo() {
		return ordemGrupo;
	}

	/**
	 * @param ordemGrupo the ordemGrupo to set
	 */
	public void setOrdemGrupo(Integer ordemGrupo) {
		this.ordemGrupo = ordemGrupo;
	}

	/**
	 * @return the ordemPergunta
	 */
	public Integer getOrdemPergunta() {
		return ordemPergunta;
	}

	/**
	 * @param ordemPergunta the ordemPergunta to set
	 */
	public void setOrdemPergunta(Integer ordemPergunta) {
		this.ordemPergunta = ordemPergunta;
	}

	/**
	 * @return the ordemResposta
	 */
	public Integer getOrdemResposta() {
		return ordemResposta;
	}

	/**
	 * @param ordemResposta the ordemResposta to set
	 */
	public void setOrdemResposta(Integer ordemResposta) {
		this.ordemResposta = ordemResposta;
	}
}
