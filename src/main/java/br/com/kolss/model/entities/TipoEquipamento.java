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
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "tipo_equipamento")
public class TipoEquipamento extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 5654317202954448013L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_tipo_equipamento", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_tipo_equipamento", nullable = false)
	private String nome;
	
	@Lob
	@Basic(optional = true, fetch = FetchType.LAZY)
	@Column(name = "icone", nullable = true)
	private byte[] icone;
	
	@OneToMany(mappedBy = "tipoEquipamento", fetch = FetchType.LAZY)
	private Set<ModeloEquipamento> modelosEquipamentos =
			new HashSet<ModeloEquipamento>();
	
	
	/** Método Construtor padrão. */
	public TipoEquipamento() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 */
	public TipoEquipamento(Long id, String nome) {
		this(id, nome, null);
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 * @param icone
	 */
	public TipoEquipamento(Long id, String nome, byte[] icone) {
		this();
		this.id = id;
		this.nome = nome;
		this.icone = icone;
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
		TipoEquipamento other = (TipoEquipamento) obj;
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
		return "TipoEquipamento [id=" + id
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
	
	public byte[] getIcone() {
		return icone;
	}
	
	public void setIcone(byte[] icone) {
		this.icone = icone;
	}
	
	public Set<ModeloEquipamento> getModelosEquipamentos() {
		return modelosEquipamentos;
	}
	
	public void setModelosEquipamentos(Set<ModeloEquipamento> modelosEquipamentos) {
		this.modelosEquipamentos = modelosEquipamentos;
	}
	
}
