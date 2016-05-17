package br.com.kolss.model.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "resposta_pergunta")
public class RespostaPergunta extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 9111845578613602898L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_resposta", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "descricao_resposta", nullable = true)
	private String descricaoResposta;
	
	
	@Column(name = "pontuacao", nullable = true)
	private String pontuacao;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_pergunta", nullable = false)
	private Pergunta pergunta = new Pergunta();
	
	@OneToOne
	@JoinColumn(name = "id_resposta_alternativa", nullable = true)
	private RespostaAlternativa respostaAlternativa;
	
	
	/** Método Construtor padrão. */
	public RespostaPergunta() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param pergunta
	 */
	public RespostaPergunta(Long id, Pergunta pergunta) {
		this(id, null, null, pergunta);
	}
	
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param descricaoResposta
	 * @param pontuacao
	 * @param pergunta
	 */
	public RespostaPergunta(Long id, String descricaoResposta,
			String pontuacao, Pergunta pergunta) {
		super();
		this.id = id;
		this.descricaoResposta = descricaoResposta;
		this.pontuacao = pontuacao;
		this.pergunta = pergunta;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((descricaoResposta == null) ? 0
						: descricaoResposta.hashCode());
		result = prime * result
				+ ((pergunta == null) ? 0 : pergunta.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RespostaPergunta other = (RespostaPergunta) obj;
		if (descricaoResposta == null) {
			if (other.descricaoResposta != null)
				return false;
		} else if (!descricaoResposta.equals(other.descricaoResposta))
			return false;
		if (pergunta == null) {
			if (other.pergunta != null)
				return false;
		} else if (!pergunta.equals(other.pergunta))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "RespostaPergunta [id=" + id
				+ ", descricaoResposta=" + descricaoResposta
				+ ", pontuacao=" + pontuacao
				+ ", pergunta=" + pergunta
				+ "]";
	}
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getDescricaoResposta() {
		return descricaoResposta;
	}
	
	public void setDescricaoResposta(String descricaoResposta) {
		this.descricaoResposta = descricaoResposta;
	}
	
	public String getPontuacao() {
		return pontuacao;
	}
	
	public void setPontuacao(String pontuacao) {
		this.pontuacao = pontuacao;
	}
	
	public RespostaAlternativa getRespostaAlternativa() {
		return respostaAlternativa;
	}

	public void setRespostaAlternativa(RespostaAlternativa respostaAlternativa) {
		this.respostaAlternativa = respostaAlternativa;
	}

	public Pergunta getPergunta() {
		return pergunta;
	}
	
	public void setPergunta(Pergunta pergunta) {
		this.pergunta = pergunta;
	}
	
}
