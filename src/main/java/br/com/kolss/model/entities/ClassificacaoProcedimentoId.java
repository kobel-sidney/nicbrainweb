package br.com.kolss.model.entities;

import java.io.Serializable;


public class ClassificacaoProcedimentoId implements Serializable {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 2895102999657530930L;
	
	
	private Long classificacaoOcorrencia;
	private Long procedimento;
	
	
	/** Método Construtor Padrão. */
	public ClassificacaoProcedimentoId() {
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param classificacaoOcorrencia
	 * @param procedimento
	 */
	public ClassificacaoProcedimentoId(Long classificacaoOcorrencia,
			Long procedimento) {
		this();
		this.classificacaoOcorrencia = classificacaoOcorrencia;
		this.procedimento = procedimento;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((classificacaoOcorrencia == null) ? 0 : classificacaoOcorrencia.hashCode());
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
		ClassificacaoProcedimentoId other = (ClassificacaoProcedimentoId) obj;
		if (classificacaoOcorrencia == null) {
			if (other.classificacaoOcorrencia != null)
				return false;
		} else if (!classificacaoOcorrencia
				.equals(other.classificacaoOcorrencia))
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
		return "ClassificacaoProcedimentoId [idClassificacaoOcorrencia=" + classificacaoOcorrencia
				+ ", idProcedimento=" + procedimento
				+ "]";
	}
	
	
	public Long getClassificacaoOcorrencia() {
		return classificacaoOcorrencia;
	}
	
	public void setClassificacaoOcorrencia(Long classificacaoOcorrencia) {
		this.classificacaoOcorrencia = classificacaoOcorrencia;
	}
	
	public Long getProcedimento() {
		return procedimento;
	}
	
	public void setProcedimento(Long procedimento) {
		this.procedimento = procedimento;
	}
	
}
