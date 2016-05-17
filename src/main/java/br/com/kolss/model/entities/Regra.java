package br.com.kolss.model.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;


@Entity
@Table(name = "regra")
public class Regra extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 7327360630479532218L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_regra", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_regra", nullable = false)
	private String nome;
	
	
	@Column(name = "ativo", nullable = false)
	private boolean ativo;
	
	@ManyToMany
	@JoinTable(name = "regra_menu",
			joinColumns = @JoinColumn(name = "id_regra"),
			inverseJoinColumns = @JoinColumn(name = "id_menu"))
	private Set<Menu> menus = new HashSet<Menu>();
	
	@ManyToMany(mappedBy = "regras")
	private Set<Usuario> usuarios = new HashSet<Usuario>();
	
	
	/** Método Construtor padrão. */
	public Regra() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 */
	public Regra(Long id, String nome, boolean ativo) {
		this();
		this.id = id;
		this.nome = nome;
		this.ativo = ativo;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (ativo ? 1231 : 1237);
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
		Regra other = (Regra) obj;
		if (ativo != other.ativo)
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
		return "Regra [id=" + id
				+ ", nome=" + nome
				+ ", ativo=" + ativo
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
	
	public boolean isAtivo() {
		return ativo;
	}
	
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	
	public Set<Menu> getMenus() {
		return menus;
	}
	
	public void setMenus(Set<Menu> menus) {
		this.menus = menus;
	}
	
	public Set<Usuario> getUsuarios() {
		return usuarios;
	}
	
	public void setUsuarios(Set<Usuario> usuarios) {
		this.usuarios = usuarios;
	}
	
}
