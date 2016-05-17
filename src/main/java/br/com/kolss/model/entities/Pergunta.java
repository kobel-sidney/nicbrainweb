package br.com.kolss.model.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "pergunta")
public class Pergunta extends AbstractEntity<Long> {

	/** serialVersionUID */
	private static final long serialVersionUID = 6201846545279607392L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_pergunta", nullable = false, unique = true)
	private Long id;

	
	@Column(name = "descricao_pergunta", nullable = false)
	private String descricao;

	
	@Column(name = "quantidade_vezes", nullable = false)
	private Integer quantidadeVezes;

	
	@Column(name = "resposta_multipla", nullable = false)
	private boolean respostaMultipla = false;

	
	@Column(name = "tipo_pontuacao", nullable = false)
	private boolean tipoPontuacao = false;

	
	@Column(name = "resposta_obrigatoria", nullable = false)
	private boolean respostaObrigatoria = false;

	
	@Column(name = "ativo", nullable = false)
	private boolean ativo = true;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_topico", nullable = true)
	private Topico topico = new Topico();

	@OneToMany(mappedBy = "pergunta", fetch = FetchType.LAZY)
	private Set<RespostaPergunta> respostas = new HashSet<RespostaPergunta>();

	@Column(name = "tipo_pergunta", nullable = false)
	private String tipoDePergunta;
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "pergunta_x_resposta_alternativa", joinColumns = { @JoinColumn(name = "id_pergunta") }, inverseJoinColumns = { @JoinColumn(name = "id_resposta_alternativa") })
    private Set<RespostaAlternativa> respostasAlternativas = new HashSet<RespostaAlternativa>();
	

	/** Método Construtor padrão. */
	public Pergunta() {
		super();
	}

	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param quantidadeVezes
	 * @param respostaMultipla
	 * @param tipoPontuacao
	 * @param respostaObrigatoria
	 * @param ativo
	 */
	public Pergunta(Long id, Integer quantidadeVezes, boolean respostaMultipla,
			boolean tipoPontuacao, boolean respostaObrigatoria, boolean ativo,
			String tipoDePergunta) {
	}

	

	public Pergunta(Long id, String descricao, Integer quantidadeVezes,
			boolean respostaMultipla, boolean tipoPontuacao,
			boolean respostaObrigatoria, boolean ativo, Topico topico,
			Set<RespostaPergunta> respostas, String tipoDePergunta,
			Set<RespostaAlternativa> respostasAlternativas) {
		super();
		this.id = id;
		this.descricao = descricao;
		this.quantidadeVezes = quantidadeVezes;
		this.respostaMultipla = respostaMultipla;
		this.tipoPontuacao = tipoPontuacao;
		this.respostaObrigatoria = respostaObrigatoria;
		this.ativo = ativo;
		this.topico = topico;
		this.respostas = respostas;
		this.tipoDePergunta = tipoDePergunta;
		this.respostasAlternativas = respostasAlternativas;
	}

	@Override
	public String toString() {
		return "Pergunta [id=" + id + ", descricao=" + descricao
				+ ", quantidadeVezes=" + quantidadeVezes
				+ ", respostaMultipla=" + respostaMultipla + ", tipoPontuacao="
				+ tipoPontuacao + ", respostaObrigatoria="
				+ respostaObrigatoria + ", ativo=" + ativo + ", topico="
				+ topico + ", respostas=" + respostas + ", tipoDePergunta="
				+ tipoDePergunta + ", respostasAlternativas="
				+ respostasAlternativas + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Integer getQuantidadeVezes() {
		return quantidadeVezes;
	}

	public void setQuantidadeVezes(Integer quantidadeVezes) {
		this.quantidadeVezes = quantidadeVezes;
	}

	public boolean isRespostaMultipla() {
		return respostaMultipla;
	}

	public void setRespostaMultipla(boolean respostaMultipla) {
		this.respostaMultipla = respostaMultipla;
	}

	public boolean isTipoPontuacao() {
		return tipoPontuacao;
	}

	public void setTipoPontuacao(boolean tipoPontuacao) {
		this.tipoPontuacao = tipoPontuacao;
	}

	public boolean isRespostaObrigatoria() {
		return respostaObrigatoria;
	}

	public void setRespostaObrigatoria(boolean respostaObrigatoria) {
		this.respostaObrigatoria = respostaObrigatoria;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public Topico getTopico() {
		return topico;
	}

	public void setTopico(Topico topico) {
		this.topico = topico;
	}

	public Set<RespostaPergunta> getRespostas() {
		return respostas;
	}

	public void setRespostas(Set<RespostaPergunta> respostas) {
		this.respostas = respostas;
	}
	
	public String getTipoDePergunta() {
		return tipoDePergunta;
	}

	public void setTipoDePergunta(String tipoDePergunta) {
		this.tipoDePergunta = tipoDePergunta;
	}

	public Set<RespostaAlternativa> getRespostasAlternativas() {
		return respostasAlternativas;
	}

	public void setRespostasAlternativas(
			Set<RespostaAlternativa> respostasAlternativas) {
		this.respostasAlternativas = respostasAlternativas;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (ativo ? 1231 : 1237);
		result = prime * result
				+ ((descricao == null) ? 0 : descricao.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((quantidadeVezes == null) ? 0 : quantidadeVezes.hashCode());
		result = prime * result + (respostaMultipla ? 1231 : 1237);
		result = prime * result + (respostaObrigatoria ? 1231 : 1237);
		result = prime * result
				+ ((respostas == null) ? 0 : respostas.hashCode());
		result = prime * result
				+ ((tipoDePergunta == null) ? 0 : tipoDePergunta.hashCode());
		result = prime * result + (tipoPontuacao ? 1231 : 1237);
		result = prime * result + ((topico == null) ? 0 : topico.hashCode());
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
		Pergunta other = (Pergunta) obj;
		if (ativo != other.ativo)
			return false;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (quantidadeVezes == null) {
			if (other.quantidadeVezes != null)
				return false;
		} else if (!quantidadeVezes.equals(other.quantidadeVezes))
			return false;
		if (respostaMultipla != other.respostaMultipla)
			return false;
		if (respostaObrigatoria != other.respostaObrigatoria)
			return false;
		if (respostas == null) {
			if (other.respostas != null)
				return false;
		} else if (!respostas.equals(other.respostas))
			return false;
		if (tipoDePergunta == null) {
			if (other.tipoDePergunta != null)
				return false;
		} else if (!tipoDePergunta.equals(other.tipoDePergunta))
			return false;
		if (tipoPontuacao != other.tipoPontuacao)
			return false;
		if (topico == null) {
			if (other.topico != null)
				return false;
		} else if (!topico.equals(other.topico))
			return false;
		return true;
	}
	

}
