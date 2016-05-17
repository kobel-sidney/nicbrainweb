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
@Table(name = "formulario")
public class Formulario extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -6356398710385820738L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_formulario", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_formulario", nullable = false)
	private String nome;
	
	
	@Column(name = "descricao_formulario", nullable = false)
	private String descricao;
	
	
	@Column(name = "ativo", nullable = false)
	private boolean ativo = false;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "formulario")
	private Set<Topico> topicos = new HashSet<Topico>();
	
	
	/** Método Construtor padrão. */
	public Formulario() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 * @param descricao
	 */
	public Formulario(Long id, String nome, String descricao, boolean ativo) {
		this();
		this.id = id;
		this.nome = nome;
		this.descricao = descricao;
		this.ativo = ativo;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((descricao == null) ? 0 : descricao.hashCode());
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
		Formulario other = (Formulario) obj;
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
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Formulario [id=" + id
				+ ", nome=" + nome
				+ ", descricao=" + descricao
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
	
	public String getDescricao() {
		return descricao;
	}
	
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public boolean isAtivo() {
		return ativo;
	}
	
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	
	public Set<Topico> getTopicos() {
		return topicos;
	}
	
	public void setTopicos(Set<Topico> topicos) {
		this.topicos = topicos;
	}
	
}
