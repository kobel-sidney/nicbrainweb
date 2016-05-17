package br.com.kolss.model.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "subquestao")
public class SubQuestao implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", nullable = false, unique = true)
	private Long id;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_relacionamento_perfil_formulario",nullable=false)
	private RelacionamentoPerfilFormulario relacionamentoPerflFormulario;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_questao",nullable=false)
	private Questao questao;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_resposta",nullable=true)
	private Resposta resposta;
	
	@Column(name = "ordem_pergunta", nullable = false)
	private Integer ordemPergunta;
	
	@Column(name = "ordem_resposta", nullable = true)
	private Integer ordemResposta;
	
	
	public SubQuestao(){}

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
	 * @return the relacionamentoPerflFormulario
	 */
	public RelacionamentoPerfilFormulario getRelacionamentoPerflFormulario() {
		return relacionamentoPerflFormulario;
	}

	/**
	 * @param relacionamentoPerflFormulario the relacionamentoPerflFormulario to set
	 */
	public void setRelacionamentoPerflFormulario(
			RelacionamentoPerfilFormulario relacionamentoPerflFormulario) {
		this.relacionamentoPerflFormulario = relacionamentoPerflFormulario;
	}

	/**
	 * @return the questao
	 */
	public Questao getQuestao() {
		return questao;
	}

	/**
	 * @param questao the questao to set
	 */
	public void setQuestao(Questao questao) {
		this.questao = questao;
	}

	/**
	 * @return the resposta
	 */
	public Resposta getResposta() {
		return resposta;
	}

	/**
	 * @param resposta the resposta to set
	 */
	public void setResposta(Resposta resposta) {
		this.resposta = resposta;
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
		SubQuestao other = (SubQuestao) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	
}