package br.com.kolss.model.entities;

import java.io.Serializable;


public class ChecklistPadraoClienteId implements Serializable {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -5266736532377891656L;
	
	
	private Long checklistPadrao;
	private Long cliente;
	
	
	/** Método Construtor padrão. */
	public ChecklistPadraoClienteId() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param cliente
	 * @param mensagem
	 */
	public ChecklistPadraoClienteId(Long checklistPadrao, Long cliente) {
		this.checklistPadrao = checklistPadrao;
		this.cliente = cliente;
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param checklistPadrao
	 * @param cliente
	 */
	public ChecklistPadraoClienteId(ChecklistPadrao checklistPadrao,
			Cliente cliente) {
		if (checklistPadrao != null) {
			this.checklistPadrao = checklistPadrao.getId();
		}
		if (cliente != null) {
			this.cliente = cliente.getId();
		}
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((checklistPadrao == null) ? 0 : checklistPadrao.hashCode());
		result = prime * result + ((cliente == null) ? 0 : cliente.hashCode());
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
		ChecklistPadraoClienteId other = (ChecklistPadraoClienteId) obj;
		if (checklistPadrao == null) {
			if (other.checklistPadrao != null)
				return false;
		} else if (!checklistPadrao.equals(other.checklistPadrao))
			return false;
		if (cliente == null) {
			if (other.cliente != null)
				return false;
		} else if (!cliente.equals(other.cliente))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "ChecklistClienteId [checklistPadrao=" + checklistPadrao
				+ ", cliente=" + cliente
				+ "]";
	}
	
	
	public Long getChecklistPadrao() {
		return checklistPadrao;
	}
	
	public void setChecklistPadrao(Long checklist) {
		this.checklistPadrao = checklist;
	}
	
	public Long getCliente() {
		return cliente;
	}
	
	public void setCliente(Long cliente) {
		this.cliente = cliente;
	}
	
}
