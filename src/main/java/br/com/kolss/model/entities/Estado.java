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
@Table(name = "estado")
public class Estado extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 6517366659959404672L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_estado", nullable = false, unique = true)
	private Long id;
	
	@Column(name = "nome_estado", nullable = false)
	private String nome;
	
	@Column(name = "sigla_estado", nullable = false)
	private String sigla;
	
	@ManyToOne
	@Basic(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "id_pais", nullable = false)
	private Pais pais = new Pais();
	
	@OneToMany(mappedBy = "estado", fetch = FetchType.LAZY)
	private Set<Municipio> municipios = new HashSet<Municipio>();
	
	/** Método Construtor padrão. */
	public Estado() {
		super();
	}
	
	/**
	 * Método Construtor. 
	 * 
	 * @param id
	 * @param nome
	 * @param sigla
	 * @param pais
	 */
	public Estado(Long id, String nome, String sigla, Pais pais) {
		this();
		this.id = id;
		this.nome = nome;
		this.sigla = sigla;
		this.pais = pais;
	}
	
	
	public Estado(long idUf) {
		this.id=idUf;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result + ((pais == null) ? 0 : pais.hashCode());
		result = prime * result + ((sigla == null) ? 0 : sigla.hashCode());
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
		Estado other = (Estado) obj;
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
		if (pais == null) {
			if (other.pais != null)
				return false;
		} else if (!pais.equals(other.pais))
			return false;
		if (sigla == null) {
			if (other.sigla != null)
				return false;
		} else if (!sigla.equals(other.sigla))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "Estado [id=" + id
				+ ", nome=" + nome
				+ ", sigla=" + sigla
				+ ", pais=" + pais
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
	
	public String getSigla() {
		return sigla;
	}
	
	public void setSigla(String sigla) {
		this.sigla = sigla;
	}
	
	public Pais getPais() {
		return pais;
	}
	
	public void setPais(Pais pais) {
		this.pais = pais;
	}
	
	public Set<Municipio> getMunicipios() {
		return municipios;
	}
	
	public void setMunicipios(Set<Municipio> municipios) {
		this.municipios = municipios;
	}
	
}
