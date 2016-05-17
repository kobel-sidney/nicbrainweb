package br.com.kolss.dto;

import javax.persistence.Column;

/**
 * 
 * @author hamseshenrique
 *
 */
public class RespostaQuestaoDTO {
	
	private Long idAtividade;
	private Long idPerfilFormulario;
	private Long idGrupo;
	private Long idQuestao;
	private Long idResposta;
	private String comentario;
	private byte[] assinatura;
	private Integer ordemGrupo;
	private Integer ordemPergunta;
	private Integer ordemResposta;
	
	public RespostaQuestaoDTO() {}

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