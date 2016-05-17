package br.com.kolss.model.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "municipio")
public class Municipio extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 925346313008899199L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_municipio", nullable = false, unique = true)
	private Long id;
	
	@Basic(optional = false, fetch = FetchType.LAZY)
	@Column(name = "nome_municipio", nullable = false)
	private String nome;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_estado", nullable = false)
	private Estado estado = new Estado();
	
	@OneToMany(mappedBy = "municipio", fetch = FetchType.LAZY)
	private Set<Endereco> enderecos = new HashSet<Endereco>();
	
	
	/** Método Construtor padrão. */
	public Municipio() {
		super();
	}
	
	/**
	 * Método Construtor. 
	 * 
	 * @param id
	 * @param nome
	 * @param estado
	 */
	public Municipio(Long id, String nome, Estado estado) {
		this();
		this.id = id;
		this.nome = nome;
		this.estado = estado;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((estado == null) ? 0 : estado.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
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
		Municipio other = (Municipio) obj;
		if (estado == null) {
			if (other.estado != null)
				return false;
		} else if (!estado.equals(other.estado))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "Municipio [id=" + id
				+ ", nome=" + nome
				+ ", estado=" + estado
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
	
	public Estado getEstado() {
		return estado;
	}
	
	public void setEstado(Estado estado) {
		this.estado = estado;
	}
	
	public Set<Endereco> getEnderecos() {
		return enderecos;
	}
	
	public void setEnderecos(Set<Endereco> enderecos) {
		this.enderecos = enderecos;
	}
	
}
