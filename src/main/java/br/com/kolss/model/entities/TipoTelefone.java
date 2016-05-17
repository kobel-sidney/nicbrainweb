package br.com.kolss.model.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "tipo_telefone")
public class TipoTelefone extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 5396658660887074176L;
	
	public static Long ID_TIPO_TELEFONE_RESIDENCIAL = Long.valueOf(1);
	public static Long ID_TIPO_TELEFONE_COMERCIAL = Long.valueOf(2);
	public static Long ID_TIPO_TELEFONE_CELULAR = Long.valueOf(3);
	public static Long ID_TIPO_TELEFONE_RECADO = Long.valueOf(4);
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_tipo_telefone", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_tipo_telefone", nullable = false)
	private String nome;
	
	
	/** Método Construtor padrão. */
	public TipoTelefone() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 */
	public TipoTelefone(Long id, String nome) {
		this();
		this.id = id;
		this.nome = nome;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((nome == null) ? 0 : nome.hashCode());
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
		TipoTelefone other = (TipoTelefone) obj;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
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
		return "TipoTelefone [id=" + id
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
	
}
