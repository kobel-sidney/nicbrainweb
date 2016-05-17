package br.com.kolss.model.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "classificacao_procedimento")
@IdClass(ClassificacaoProcedimentoId.class)
public class ClassificacaoProcedimento extends AbstractEntity<ClassificacaoProcedimentoId> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -7948405843912910943L;
	
	@Id
	@ManyToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "id_procedimento")
	private Procedimento procedimento = new Procedimento();
	
	@Id
	@ManyToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "id_classificacao_ocorrencia")
	private ClassificacaoOcorrencia classificacaoOcorrencia =
			new ClassificacaoOcorrencia();
	
	
	@Column(name = "nr_item", nullable = false)
	private Integer numeroItem;
	
	
	/** Método Construtor Padrão. */
	public ClassificacaoProcedimento() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param procedimento
	 * @param classificacaoOcorrencia
	 * @param numeroItem
	 */
	public ClassificacaoProcedimento(Procedimento procedimento,
			ClassificacaoOcorrencia classificacaoOcorrencia,
			Integer numeroItem) {
		this();
		this.procedimento = procedimento;
		this.classificacaoOcorrencia = classificacaoOcorrencia;
		this.numeroItem = numeroItem;
	}
	
	
	@Override
	public boolean isNew() {
		return (procedimento == null
				|| classificacaoOcorrencia == null
				|| procedimento.isNew()
				|| classificacaoOcorrencia.isNew());
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((classificacaoOcorrencia == null) ? 0 : classificacaoOcorrencia.hashCode());
		result = prime * result
				+ ((numeroItem == null) ? 0 : numeroItem.hashCode());
		result = prime * result
				+ ((procedimento == null) ? 0 : procedimento.hashCode());
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
		ClassificacaoProcedimento other = (ClassificacaoProcedimento) obj;
		if (classificacaoOcorrencia == null) {
			if (other.classificacaoOcorrencia != null)
				return false;
		} else if (!classificacaoOcorrencia
				.equals(other.classificacaoOcorrencia))
			return false;
		if (numeroItem == null) {
			if (other.numeroItem != null)
				return false;
		} else if (!numeroItem.equals(other.numeroItem))
			return false;
		if (procedimento == null) {
			if (other.procedimento != null)
				return false;
		} else if (!procedimento.equals(other.procedimento))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "ClassificacaoProcedimento [procedimento=" + procedimento
				+ ", classificacaoOcorrencia=" + classificacaoOcorrencia
				+ ", numeroItem=" + numeroItem
				+ "]";
	}
	
	@Override
	public ClassificacaoProcedimentoId getId() {
		return new ClassificacaoProcedimentoId(
				this.classificacaoOcorrencia.getId(),
				this.procedimento.getId());
	}
	
	
	public Procedimento getProcedimento() {
		return procedimento;
	}
	
	public void setProcedimento(Procedimento procedimento) {
		this.procedimento = procedimento;
	}
	
	public ClassificacaoOcorrencia getClassificacaoOcorrencia() {
		return classificacaoOcorrencia;
	}
	
	public void setClassificacaoOcorrencia(
			ClassificacaoOcorrencia classificacaoOcorrencia) {
		this.classificacaoOcorrencia = classificacaoOcorrencia;
	}
	
	public Integer getNumeroItem() {
		return numeroItem;
	}
	
	public void setNumeroItem(Integer numeroItem) {
		this.numeroItem = numeroItem;
	}
	
}
