package br.com.kolss.model.entities;

import java.io.Serializable;


public class ChecklistProcedimentoId implements Serializable {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -1730813128892544866L;
	
	
	private Long checklistPadrao;
	private Long procedimento;
	
	
	/** Método Construtor Padrão. */
	public ChecklistProcedimentoId() { }
	
	/**
	 * Método Construtor.
	 * 
	 * @param checklistPadrao
	 * @param procedimento
	 */
	public ChecklistProcedimentoId(Long checklistPadrao, Long procedimento) {
		this.checklistPadrao = checklistPadrao;
		this.procedimento = procedimento;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((checklistPadrao == null) ? 0 : checklistPadrao.hashCode());
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
		ChecklistProcedimentoId other = (ChecklistProcedimentoId) obj;
		if (checklistPadrao == null) {
			if (other.checklistPadrao != null)
				return false;
		} else if (!checklistPadrao.equals(other.checklistPadrao))
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
		return "ChecklistProcedimentoId [idChecklist=" + checklistPadrao
				+ ", idProcedimento=" + procedimento
				+ "]";
	}
	
	
	public Long getChecklistPadrao() {
		return checklistPadrao;
	}
	
	public void setChecklistPadrao(Long checklistPadrao) {
		this.checklistPadrao = checklistPadrao;
	}
	
	public Long getProcedimento() {
		return procedimento;
	}
	
	public void setProcedimento(Long procedimento) {
		this.procedimento = procedimento;
	}
	
}
