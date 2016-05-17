package br.com.kolss.model.entities;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "checklist_padrao_cliente")
@IdClass(ChecklistPadraoClienteId.class)
public class ChecklistPadraoCliente extends AbstractEntity<ChecklistPadraoClienteId> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 4525229377617814345L;
	
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_checklist_padrao")
	private ChecklistPadrao checklistPadrao;
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_cliente")
	private Cliente cliente;
	
	
	/** Método Construtor padrão */
	public ChecklistPadraoCliente() {
		this(null, null);
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param checklistPadrao
	 * @param cliente
	 */
	public ChecklistPadraoCliente(ChecklistPadrao checklistPadrao,
			Cliente cliente) {
		this.checklistPadrao = checklistPadrao;
		this.cliente = cliente;
	}
	
	@Override
	public ChecklistPadraoClienteId getId() {
		return new ChecklistPadraoClienteId(getChecklistPadrao(), getCliente());
	}
		
	@Override
	public boolean isNew() {
		return (checklistPadrao == null
					|| cliente == null
					|| checklistPadrao.isNew()
					|| cliente.isNew());
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
		ChecklistPadraoCliente other = (ChecklistPadraoCliente) obj;
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
		return "ChecklistCliente [checklistPadrao=" + checklistPadrao
				+ ", cliente=" + cliente
				+ "]";
	}
	
	
	public ChecklistPadrao getChecklistPadrao() {
		return checklistPadrao;
	}
	
	public void setChecklistPadrao(ChecklistPadrao checklistPadrao) {
		this.checklistPadrao = checklistPadrao;
	}
	
	public Cliente getCliente() {
		return cliente;
	}
	
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

}
