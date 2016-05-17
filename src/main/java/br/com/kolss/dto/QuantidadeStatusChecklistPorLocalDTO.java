package br.com.kolss.dto;

import java.io.Serializable;

import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Status;


/**
 * Classe do tipo DTO para exibir a relação entre quantidade de Status de 
 * Checklist por Local.
 */
public class QuantidadeStatusChecklistPorLocalDTO
		implements Serializable, Comparable<QuantidadeStatusChecklistPorLocalDTO> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 279692886466975217L;
	
	private Number quantidade;
	
	private Status status;
	
	private Local local;
	
	
	/** Método Construtor padrão. */
	public QuantidadeStatusChecklistPorLocalDTO() {
		this(null, null, null);
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param quantidade
	 * @param nomeLocal
	 */
	public QuantidadeStatusChecklistPorLocalDTO(Number quantidade,
			Status status, Local local) {
		this.quantidade = quantidade;
		this.status = status;
		this.local = local;
	}
	
	@Override
	public int compareTo(QuantidadeStatusChecklistPorLocalDTO o) {
		int compareTo = 0;
		if (o == null) {
			compareTo = 1;
		} else {
			// 01) Ordena pela quantidade de checklists:
			compareTo = getQuantidade().compareTo(o.getQuantidade());
			
			// 02) Ordena pelo ID do Status
			if (compareTo == 0) {
				if (o.getStatus() == null) {
					compareTo = 1;
				} else {
					Long _id1 = this.getStatus().getId();
					compareTo = _id1.compareTo(o.getStatus().getId());
				}
			}
			
			// 03) Ordena pelo nome do Local:
			if (compareTo == 0) {
				if (o.getLocal() == null) {
					compareTo = 1;
				} else {
					String _nome1 = this.getNomeLocal() + "";
					compareTo = _nome1.compareTo(o.getNomeLocal());
				}
			}
		}
		
		return compareTo;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((local == null) ? 0 : local.hashCode());
		result = prime * result
				+ ((quantidade == null) ? 0 : quantidade.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
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
		QuantidadeStatusChecklistPorLocalDTO other =
				(QuantidadeStatusChecklistPorLocalDTO) obj;
		if (local == null) {
			if (other.local != null)
				return false;
		} else if (!local.equals(other.local))
			return false;
		if (quantidade == null) {
			if (other.quantidade != null)
				return false;
		} else if (!quantidade.equals(other.quantidade))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "QuantidadeStatusChecklistPorLocalDTO [quantidade=" + quantidade
				+ ", status=" + status
				+ ", local=" + local
				+ "]";
	}
	
	
	public Integer getQuantidade() {
		return quantidade != null ? quantidade.intValue() : Integer.valueOf(0);
	}
	
	public void setQuantidade(Number quantidade) {
		this.quantidade = quantidade;
	}
	
	public Status getStatus() {
		return status;
	}
	
	public void setStatus(Status status) {
		this.status = status;
	}
	
	public String getNomeStatus() {
		return getStatus() != null ? getStatus().getNome() : "";
	}
	
	public Local getLocal() {
		return local;
	}
	
	public void setLocal(Local local) {
		this.local = local;
	}
	
	public String getNomeLocal() {
		return getLocal() != null ? getLocal().getNome() : "";
	}
	
}
