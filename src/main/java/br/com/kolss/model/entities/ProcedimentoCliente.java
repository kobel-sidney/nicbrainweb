package br.com.kolss.model.entities;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name = "procedimento_cliente")
@IdClass(ProcedimentoClienteId.class)
public class ProcedimentoCliente extends AbstractEntity<ProcedimentoCliente> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -4661913079270028673L;
	
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_procedimento")
	private Procedimento procedimento;
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_cliente")
	private Cliente cliente;
	
	
	/** Método Construtor padrão */
	public ProcedimentoCliente() {
		this(null, null);
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param procedimento
	 * @param cliente
	 */
	public ProcedimentoCliente(Procedimento procedimento, Cliente cliente) {
		this.procedimento = procedimento;
		this.cliente = cliente;
	}

	@Override
	public boolean isNew() {
		return (procedimento == null
				|| cliente == null
				|| procedimento.isNew()
				|| cliente.isNew());
	}
	
	@Override
	public ProcedimentoCliente getId() {
		return new ProcedimentoCliente(getProcedimento(), getCliente());
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
		ProcedimentoCliente other = (ProcedimentoCliente) obj;
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
		return "ProcedimentoCliente [procedimento=" + procedimento
				+ ", cliente=" + cliente
				+ "]";
	}
	
	
	public Procedimento getProcedimento() {
		return procedimento;
	}
	
	public void setProcedimento(Procedimento procedimento) {
		this.procedimento = procedimento;
	}
	
	public Cliente getCliente() {
		return cliente;
	}
	
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
}
