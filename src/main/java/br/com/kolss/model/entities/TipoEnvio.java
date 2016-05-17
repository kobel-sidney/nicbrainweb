package br.com.kolss.model.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "tipo_envio")
public class TipoEnvio extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -8454088859554589437L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_tipo_envio", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_tipo_envio", nullable = false)
	private String nome;
	
	
	/** Método Construtor padrão. */
	public TipoEnvio() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 */
	public TipoEnvio(Long id, String nome) {
		this();
		this.id = id;
		this.nome = nome;
	}
	
	public TipoEnvio(Long id) {
		this.id=id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}



	@Override
	public String toString() {
		return "TipoEnvio [id=" + id
				+ ", nome=" + nome
				+ "]";
	}
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TipoEnvio other = (TipoEnvio) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
}
