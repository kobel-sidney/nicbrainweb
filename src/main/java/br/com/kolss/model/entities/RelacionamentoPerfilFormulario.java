package br.com.kolss.model.entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "relacionamento_perfil_formulario")
public class RelacionamentoPerfilFormulario implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", nullable = false, unique = true)
	private Long id;

	@Column(name = "ordem_grupo", nullable = false)
	private Integer ordemGrupo;

	@Column(name = "ordem_pergunta", nullable = false)
	private Integer ordemPergunta;

	@Column(name = "ordem_resposta", nullable = true)
	private Integer ordemResposta;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_perfil_formulario", nullable = false)
	private PerfilFormulario perfilFormulario = new PerfilFormulario();

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_grupo_questao", nullable = false)
	private GrupoQuestao grupoQuestao = new GrupoQuestao();

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_questao", nullable = false)
	private Questao questao = new Questao();

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_resposta", nullable = true)
	private Resposta resposta = new Resposta();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "relacionamentoPerflFormulario")
	private Set<SubQuestao> listSubQuestao;
	
	@ManyToOne
	@JoinColumn(name = "id_contratante", nullable = true)
	private Contratante contratante;
	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((grupoQuestao == null) ? 0 : grupoQuestao.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((ordemGrupo == null) ? 0 : ordemGrupo.hashCode());
		result = prime * result
				+ ((ordemPergunta == null) ? 0 : ordemPergunta.hashCode());
		result = prime * result
				+ ((ordemResposta == null) ? 0 : ordemResposta.hashCode());
		result = prime
				* result
				+ ((perfilFormulario == null) ? 0 : perfilFormulario.hashCode());
		result = prime * result + ((questao == null) ? 0 : questao.hashCode());
		result = prime * result
				+ ((resposta == null) ? 0 : resposta.hashCode());
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		RelacionamentoPerfilFormulario other = (RelacionamentoPerfilFormulario) obj;
		if (grupoQuestao == null) {
			if (other.grupoQuestao != null) {
				return false;
			}
		} else if (!grupoQuestao.equals(other.grupoQuestao)) {
			return false;
		}
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		if (ordemGrupo == null) {
			if (other.ordemGrupo != null) {
				return false;
			}
		} else if (!ordemGrupo.equals(other.ordemGrupo)) {
			return false;
		}
		if (ordemPergunta == null) {
			if (other.ordemPergunta != null) {
				return false;
			}
		} else if (!ordemPergunta.equals(other.ordemPergunta)) {
			return false;
		}
		if (ordemResposta == null) {
			if (other.ordemResposta != null) {
				return false;
			}
		} else if (!ordemResposta.equals(other.ordemResposta)) {
			return false;
		}
		if (perfilFormulario == null) {
			if (other.perfilFormulario != null) {
				return false;
			}
		} else if (!perfilFormulario.equals(other.perfilFormulario)) {
			return false;
		}
		if (questao == null) {
			if (other.questao != null) {
				return false;
			}
		} else if (!questao.equals(other.questao)) {
			return false;
		}
		if (resposta == null) {
			if (other.resposta != null) {
				return false;
			}
		} else if (!resposta.equals(other.resposta)) {
			return false;
		}
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "RelacionamentoPerfilFormulario [id=" + id + ", ordemGrupo="
				+ ordemGrupo + ", ordemPergunta=" + ordemPergunta
				+ ", ordemResposta=" + ordemResposta + ", perfilFormulario="
				+ perfilFormulario + ", grupoQuestao=" + grupoQuestao
				+ ", questao=" + questao + ", resposta=" + resposta + "]";
	}

	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the ordemGrupo
	 */
	public Integer getOrdemGrupo() {
		return ordemGrupo;
	}

	/**
	 * @param ordemGrupo
	 *            the ordemGrupo to set
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
	 * @param ordemPergunta
	 *            the ordemPergunta to set
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
	 * @param ordemResposta
	 *            the ordemResposta to set
	 */
	public void setOrdemResposta(Integer ordemResposta) {
		this.ordemResposta = ordemResposta;
	}

	/**
	 * @return the perfilFormulario
	 */
	public PerfilFormulario getPerfilFormulario() {
		return perfilFormulario;
	}

	/**
	 * @param perfilFormulario
	 *            the perfilFormulario to set
	 */
	public void setPerfilFormulario(PerfilFormulario perfilFormulario) {
		this.perfilFormulario = perfilFormulario;
	}

	/**
	 * @return the grupoQuestao
	 */
	public GrupoQuestao getGrupoQuestao() {
		return grupoQuestao;
	}

	/**
	 * @param grupoQuestao
	 *            the grupoQuestao to set
	 */
	public void setGrupoQuestao(GrupoQuestao grupoQuestao) {
		this.grupoQuestao = grupoQuestao;
	}

	/**
	 * @return the questao
	 */
	public Questao getQuestao() {
		return questao;
	}

	/**
	 * @param questao
	 *            the questao to set
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
	 * @param resposta
	 *            the resposta to set
	 */
	public void setResposta(Resposta resposta) {
		this.resposta = resposta;
	}

	/**
	 * @return the listSubQuestao
	 */
	public Set<SubQuestao> getListSubQuestao() {
		return listSubQuestao;
	}

	/**
	 * @param listSubQuestao
	 *            the listSubQuestao to set
	 */
	public void setListSubQuestao(Set<SubQuestao> listSubQuestao) {
		this.listSubQuestao = listSubQuestao;
	}

	public Contratante getContratante() {
		return contratante;
	}

	public void setContratante(Contratante contratante) {
		this.contratante = contratante;
	}
}