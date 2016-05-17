package br.com.kolss.model.entities;

import java.io.Serializable;


public class ProcedimentoClienteId implements Serializable {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -2662224303520881257L;
	
	private Long procedimento;
	private Long cliente;
	
	
	/** Método Construtor padrão */
	public ProcedimentoClienteId() {
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param procedimento
	 * @param cliente
	 */
	public ProcedimentoClienteId(Long procedimento, Long cliente) {
		this.procedimento = procedimento;
		this.cliente = cliente;
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param procedimento
	 * @param cliente
	 */
	public ProcedimentoClienteId(Procedimento procedimento, Cliente cliente) {
		if (procedimento != null) {
			this.procedimento = procedimento.getId();
		}
		if (cliente != null) {
			this.cliente = cliente.getId();
		}
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cliente == null) ? 0 : cliente.hashCode());
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
		ProcedimentoClienteId other = (ProcedimentoClienteId) obj;
		if (cliente == null) {
			if (other.cliente != null)
				return false;
		} else if (!cliente.equals(other.cliente))
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
		return "ProcedimentoClienteId [procedimento=" + procedimento
				+ ", cliente=" + cliente
				+ "]";
	}
	
	
	public Long getProcedimento() {
		return procedimento;
	}
	
	public void setProcedimento(Long procedimento) {
		this.procedimento = procedimento;
	}
	
	public Long getCliente() {
		return cliente;
	}
	
	public void setCliente(Long cliente) {
		this.cliente = cliente;
	}
	
}
