package br.com.kolss.model.entities;

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
@Table(name = "tipo_classificacao")
public class TipoClassificacao extends AbstractEntity<Long> {

	private static final long serialVersionUID = -1958227520750856804L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_tipo_classificacao", nullable = false, unique = true)
	private Long id;

	@Column(name = "prefixo", nullable = false)
	private String prefixo;

	@Column(name = "nome_tipo_classificacao", nullable = false)
	private String nome;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_gravidade_ocorrencia", nullable = true)
	private GravidadeOcorrencia gravidadeOcorrencia = new GravidadeOcorrencia();

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_classificacao_ocorrencia", nullable = true)
	private ClassificacaoOcorrencia classificacaoOcorrencia = new ClassificacaoOcorrencia();

	@ManyToOne
	@JoinColumn(name = "id_contratante", nullable = true)
	private Contratante contratante;

	/** Método Construtor padrão. */
	public TipoClassificacao() {
		super();
	}

	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 */
	public TipoClassificacao(Long id, String nome) {
		this(id, nome, null, null);
	}

	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 * @param gravidadeOcorrencia
	 * @param classificacaoOcorrencia
	 */
	public TipoClassificacao(Long id, String nome, GravidadeOcorrencia gravidadeOcorrencia,
			ClassificacaoOcorrencia classificacaoOcorrencia) {
		super();
		this.id = id;
		this.nome = nome;
		this.gravidadeOcorrencia = gravidadeOcorrencia;
		this.classificacaoOcorrencia = classificacaoOcorrencia;
	}

	public TipoClassificacao(Long id ) {
		this.id = id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((classificacaoOcorrencia == null) ? 0 : classificacaoOcorrencia.hashCode());
		result = prime * result + ((gravidadeOcorrencia == null) ? 0 : gravidadeOcorrencia.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
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
		TipoClassificacao other = (TipoClassificacao) obj;
		if (classificacaoOcorrencia == null) {
			if (other.classificacaoOcorrencia != null)
				return false;
		} else if (!classificacaoOcorrencia.equals(other.classificacaoOcorrencia))
			return false;
		if (gravidadeOcorrencia == null) {
			if (other.gravidadeOcorrencia != null)
				return false;
		} else if (!gravidadeOcorrencia.equals(other.gravidadeOcorrencia))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "TipoClassificacao [id=" + id + ", nome=" + nome + ", gravidadeOcorrencia=" + gravidadeOcorrencia
				+ ", classificacaoOcorrencia=" + classificacaoOcorrencia + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPrefixo() {
		return prefixo;
	}

	public void setPrefixo(String prefixo) {
		this.prefixo = prefixo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public GravidadeOcorrencia getGravidadeOcorrencia() {
		return gravidadeOcorrencia;
	}

	public void setGravidadeOcorrencia(GravidadeOcorrencia gravidadeOcorrencia) {
		this.gravidadeOcorrencia = gravidadeOcorrencia;
	}

	public ClassificacaoOcorrencia getClassificacaoOcorrencia() {
		return classificacaoOcorrencia;
	}

	public void setClassificacaoOcorrencia(ClassificacaoOcorrencia classificacaoOcorrencia) {
		this.classificacaoOcorrencia = classificacaoOcorrencia;
	}

	public Contratante getContratante() {
		return contratante;
	}

	public void setContratante(Contratante contratante) {
		this.contratante = contratante;
	}

}
