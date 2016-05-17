package br.com.kolss.dto;

import java.io.Serializable;

import br.com.kolss.model.entities.Local;


/** 
 * Classe do tipo DTO para exibir a relação entre quantidade de Checklist por 
 * Locais.
 */
public class QuantidadeChecklistsPorLocalDTO
		implements Serializable, Comparable<QuantidadeChecklistsPorLocalDTO> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -7700913336534932906L;
	
	private Number quantidade;
	
	private Local local;
	
	
	/** Método Construtor padrão. */
	public QuantidadeChecklistsPorLocalDTO() {
		this(null, null);
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param quantidade
	 * @param nomeLocal
	 */
	public QuantidadeChecklistsPorLocalDTO(Number quantidade, Local local) {
		this.quantidade = quantidade;
		this.local = local;
	}
	
	@Override
	public int compareTo(QuantidadeChecklistsPorLocalDTO o) {
		int compareTo = 0;
		if (o == null) {
			compareTo = 1;
		} else {
			// 01) Ordena pela quantidade de checklists:
			compareTo = getQuantidade().compareTo(o.getQuantidade());
			
			// 02) Ordena pelo nome do Local:
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
		QuantidadeChecklistsPorLocalDTO other = (QuantidadeChecklistsPorLocalDTO) obj;
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
		return true;
	}
	
	@Override
	public String toString() {
		return "DashboardChecklistPorLocalDTO [quantidade=" + quantidade
				+ ", local=" + local
				+ "]";
	}
	
	
	public Integer getQuantidade() {
		return quantidade != null ? quantidade.intValue() : Integer.valueOf(0);
	}
	
	public void setQuantidade(Number quantidade) {
		this.quantidade = quantidade;
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
