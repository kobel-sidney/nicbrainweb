package br.com.kolss.model.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "perfil")
public class Perfil extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -2477801799333138831L;
	
	public static Long ID_PERFIL_ADMINISTRADOR = Long.valueOf(1);
	public static Long ID_PERFIL_OPERADOR_MESTRE = Long.valueOf(2);
	public static Long ID_PERFIL_OPERADOR = Long.valueOf(3);
	public static Long ID_PERFIL_SUPERVISOR = Long.valueOf(4);
	public static Long ID_PERFIL_DIRETOR = Long.valueOf(5);
	public static Long ID_PERFIL_OPERADOR_MASTER = Long.valueOf(6);
	public static Long ID_PERFIL_OPERADOR_RONDA = Long.valueOf(7);
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_perfil", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_perfil", nullable = false)
	private String nome;
	
	
	@Column(name = "descricao_perfil", nullable = true)
	private String descricao;
	
	
	/** Método Construtor padrão. */
	public Perfil() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param nome
	 */
	public Perfil(Long id, String nome) {
		this(id, nome, null);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param nome
	 * @param descricao
	 */
	public Perfil(Long id, String nome, String descricao) {
		this();
		this.id = id;
		this.nome = nome;
		this.descricao = descricao;
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
		Perfil other = (Perfil) obj;
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
		return "Perfil [id=" + id
				+ ", nome=" + nome
				+ ", descricao=" + descricao
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
	
}
