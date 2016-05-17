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
@Table(name = "checklist_procedimento")
@IdClass(ChecklistProcedimentoId.class)
public class ChecklistProcedimento extends AbstractEntity<ChecklistProcedimentoId> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 8334595844657137553L;
	
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_checklist_padrao")
	private ChecklistPadrao checklistPadrao = new ChecklistPadrao();
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_procedimento")
	private Procedimento procedimento = new Procedimento();
	
	
	@Column(name = "nr_item", nullable = false)
	private Integer numeroItem;
	
	
	/** Método Construtor padrão. */
	public ChecklistProcedimento() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param checklistPadrao
	 * @param procedimento
	 * @param numeroItem
	 */
	public ChecklistProcedimento(ChecklistPadrao checklistPadrao,
			Procedimento procedimento, Integer numeroItem) {
		this();
		this.checklistPadrao = checklistPadrao;
		this.procedimento = procedimento;
		this.numeroItem = numeroItem;
	}
	
	
	@Override
	public boolean isNew() {
		return (checklistPadrao == null
					|| procedimento == null
					|| checklistPadrao.isNew()
					|| procedimento.isNew());
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((checklistPadrao == null) ? 0 : checklistPadrao.hashCode());
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
		ChecklistProcedimento other = (ChecklistProcedimento) obj;
		if (checklistPadrao == null) {
			if (other.checklistPadrao != null)
				return false;
		} else if (!checklistPadrao.equals(other.checklistPadrao))
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
		return "ChecklistProcedimento [checklistPadrao=" + checklistPadrao
				+ ", procedimento=" + procedimento
				+ ", numeroItem=" + numeroItem
				+ "]";
	}
	
	
	@Override
	public ChecklistProcedimentoId getId() {
		return new ChecklistProcedimentoId(
				this.checklistPadrao.getId(),
				this.procedimento.getId());
	}
	
	
	public ChecklistPadrao getChecklistPadrao() {
		return checklistPadrao;
	}
	
	public void setChecklistPadrao(ChecklistPadrao checklistPadrao) {
		this.checklistPadrao = checklistPadrao;
	}
	
	public Procedimento getProcedimento() {
		return procedimento;
	}
	
	public void setProcedimento(Procedimento procedimento) {
		this.procedimento = procedimento;
	}
	
	public Integer getNumeroItem() {
		return numeroItem;
	}
	
	public void setNumeroItem(Integer numeroItem) {
		this.numeroItem = numeroItem;
	}
	
}
