package br.com.kolss.model.entities;

import java.util.HashSet;
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
@Table(name = "clas_ocor_msg")
public class ClassificacaoOcorrenciaMensagem extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 8261044715387529272L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_clas_ocor_msg", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "tempo_escala", nullable = false)
	private Integer tempoEscala;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_mensagem", nullable = true)
	private Mensagem mensagem = new Mensagem();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_classificacao_ocorrencia", nullable = true)
	private ClassificacaoOcorrencia classificacaoOcorrencia =
			new ClassificacaoOcorrencia();
	
	@OneToMany(mappedBy = "classificacaoOcorrenciaMensagem", fetch= FetchType.LAZY)
	private Set<ClassificacaoOcorrenciaMensagemGrupo> classificacoesOcorrenciasMensagensGrupos =
			new HashSet<ClassificacaoOcorrenciaMensagemGrupo>();
	
	
	/** Método Construtor padrão. */
	public ClassificacaoOcorrenciaMensagem() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param tempoEscala
	 */
	public ClassificacaoOcorrenciaMensagem(Long id, Integer tempoEscala) {
		this(id, tempoEscala, null, null);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param tempoEscala
	 * @param mensagem
	 * @param classificacaoOcorrencia
	 */
	public ClassificacaoOcorrenciaMensagem(Long id, Integer tempoEscala,
			Mensagem mensagem,
			ClassificacaoOcorrencia classificacaoOcorrencia) {
		this();
		this.id = id;
		this.tempoEscala = tempoEscala;
		this.mensagem = mensagem;
		this.classificacaoOcorrencia = classificacaoOcorrencia;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((mensagem == null) ? 0 : mensagem.hashCode());
		result = prime * result
				+ ((tempoEscala == null) ? 0 : tempoEscala.hashCode());
		result = prime * result
				+ ((classificacaoOcorrencia == null) ? 0
						: classificacaoOcorrencia.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		ClassificacaoOcorrenciaMensagem other = (ClassificacaoOcorrenciaMensagem) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (mensagem == null) {
			if (other.mensagem != null)
				return false;
		} else if (!mensagem.equals(other.mensagem))
			return false;
		if (tempoEscala == null) {
			if (other.tempoEscala != null)
				return false;
		} else if (!tempoEscala.equals(other.tempoEscala))
			return false;
		if (classificacaoOcorrencia == null) {
			if (other.classificacaoOcorrencia != null)
				return false;
		} else if (!classificacaoOcorrencia
				.equals(other.classificacaoOcorrencia))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "ClassificacaoOcorrenciaMensagem [id=" + id
				+ ", tempoEscala=" + tempoEscala
				+ ", mensagem=" + mensagem
				+ ", classificacaoOcorrencia=" + classificacaoOcorrencia
				+ "]";
	}
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Integer getTempoEscala() {
		return tempoEscala;
	}
	
	public void setTempoEscala(Integer tempoEscala) {
		this.tempoEscala = tempoEscala;
	}
	
	public Mensagem getMensagem() {
		return mensagem;
	}
	
	public void setMensagem(Mensagem mensagem) {
		this.mensagem = mensagem;
	}
	
	public ClassificacaoOcorrencia getClassificacaoOcorrencia() {
		return classificacaoOcorrencia;
	}
	
	public void setClassificacaoOcorrencia(
			ClassificacaoOcorrencia classificacaoOcorrencia) {
		this.classificacaoOcorrencia = classificacaoOcorrencia;
	}
	
	public Set<ClassificacaoOcorrenciaMensagemGrupo> getClassificacoesOcorrenciasMensagensGrupos() {
		return classificacoesOcorrenciasMensagensGrupos;
	}
	
	public void setClassificacoesOcorrenciasMensagens(
			Set<ClassificacaoOcorrenciaMensagemGrupo> classificacoesOcorrenciasMensagensGrupos) {
		this.classificacoesOcorrenciasMensagensGrupos = classificacoesOcorrenciasMensagensGrupos;
	}
	
}
