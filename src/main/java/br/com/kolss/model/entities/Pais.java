package br.com.kolss.model.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "pais")
public class Pais extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 4730623905959771558L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_pais", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_pais", nullable = false)
	private String nome;
	
	@OneToMany(mappedBy = "pais", fetch = FetchType.LAZY)
	private Set<Estado> estados = new HashSet<Estado>();
	
	
	/** Método Construtor padrão. */
	public Pais() {
		super();
	}
	
	/**
	 * Método Construtor. 
	 * 
	 * @param id
	 * @param nome
	 */
	public Pais(Long id, String nome) {
		this();
		this.id = id;
		this.nome = nome;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
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
		Pais other = (Pais) obj;
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
		return "Pais [id=" + id
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
	
	public Set<Estado> getEstados() {
		return estados;
	}
	
	public void setEstados(Set<Estado> estados) {
		this.estados = estados;
	}
	
}
