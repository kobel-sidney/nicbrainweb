package br.com.kolss.dto;

import java.io.Serializable;


/** Classe DTO para popular o pickList. */
public class SimplePickListDTO implements Serializable,
		Comparable<SimplePickListDTO> {

	/** serialVersionUID */
	private static final long serialVersionUID = 7072455904305689299L;
	
	private Long id;
	private String descricao;
	
	
	/** Método Construtor padrão. */
	public SimplePickListDTO() {
		this(null, null);
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param descricao
	 */
	public SimplePickListDTO(Long id, String descricao) {
		setId(id);
		setDescricao(descricao);
	}
	
	
	@Override
	public int compareTo(SimplePickListDTO o) {
		
		int compareTo = 0;
		if (o != null) {
			
			if (descricao != null) {
				compareTo = (o.descricao != null)
						? descricao.compareTo(o.descricao)	// os dois NÃO são nulos;
						: 1;								// este objeto NÃO é nulo;
			}
			
			if (descricao == null) {
				compareTo = (o.descricao == null)
						? 0		// os dois são nulos;
						: -1;	// o objeto comparadao NÃO é nulo;
			}
		} else {
			compareTo = 1;
		}
		
		return compareTo;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((descricao == null) ? 0 : descricao.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		SimplePickListDTO other = (SimplePickListDTO) obj;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "SimplePickListDTO [id=" + id + ", descricao=" + descricao + "]";
	}
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getDescricao() {
		return descricao;
	}
	
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

}
