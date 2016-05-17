package br.com.kolss.model.entities;

import java.util.HashSet;
import java.util.Set;

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
@Table(name = "topico")
public class Topico extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -7735214797147209654L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_topico", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_topico", nullable = false)
	private String nome;
	
	
	@Column(name = "ordem_topico", nullable = false)
	private Integer ordemTopico;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_formulario", nullable = false)
	private Formulario formulario = new Formulario();
	
	@OneToMany(mappedBy = "topico", fetch = FetchType.LAZY)
	private Set<Pergunta> perguntas = new HashSet<Pergunta>();
	
	
	/** Método Construtor padrão. */
	public Topico() {
		super();
	}
	
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 * @param ordemTopico
	 * @param formulario
	 */
	public Topico(Long id, String nome, Integer ordemTopico,
			Formulario formulario) {
		this();
		this.id = id;
		this.nome = nome;
		this.ordemTopico = ordemTopico;
		this.formulario = formulario;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((formulario == null) ? 0 : formulario.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result
				+ ((ordemTopico == null) ? 0 : ordemTopico.hashCode());
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
		Topico other = (Topico) obj;
		if (formulario == null) {
			if (other.formulario != null)
				return false;
		} else if (!formulario.equals(other.formulario))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (ordemTopico == null) {
			if (other.ordemTopico != null)
				return false;
		} else if (!ordemTopico.equals(other.ordemTopico))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "Topico [id=" + id
				+ ", nome=" + nome
				+ ", ordemTopico=" + ordemTopico
				+ ", formulario=" + formulario
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
	
	public Integer getOrdemTopico() {
		return ordemTopico;
	}
	
	public void setOrdemTopico(Integer ordemTopico) {
		this.ordemTopico = ordemTopico;
	}
	
	public Formulario getFormulario() {
		return formulario;
	}
	
	public void setFormulario(Formulario formulario) {
		this.formulario = formulario;
	}
	
	public Set<Pergunta> getPerguntas() {
		return perguntas;
	}
	
	public void setPerguntas(Set<Pergunta> perguntas) {
		this.perguntas = perguntas;
	}
	
}
