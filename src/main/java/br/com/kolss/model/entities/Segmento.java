package br.com.kolss.model.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "segmento")
public class Segmento extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -8071541806016167722L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_segmento", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_segmento", nullable = false)
	private String nome;
	
	
	@Column(name = "descricao_segmento", nullable = false)
	private String descricao;
	
	
	@Column(name = "url_background", nullable = true)
	private String urlBackground;

	
	@Column(name = "url_logotipo", nullable = true)
	private String urlLogotipo;
	
	@OneToMany(mappedBy = "segmento", fetch = FetchType.LAZY)
	private Set<Contratante> contratantes = new HashSet<Contratante>();
	
	@OneToMany(mappedBy = "segmento", fetch = FetchType.LAZY)
	private Set<Fornecedor> fornecedores = new HashSet<Fornecedor>();
	
	@ManyToMany(mappedBy = "segmentos", fetch = FetchType.LAZY)
	private Set<ChecklistPadrao> checklistsPadroes = new HashSet<ChecklistPadrao>();
	
	
	/** Método Construtor padrão. */
	public Segmento() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 * @param descricao
	 */
	public Segmento(Long id, String nome, String descricao) {
		this(id, nome, descricao, null, null);
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 * @param descricao
	 * @param urlBackground
	 */
	public Segmento(Long id, String nome, String descricao,
			String urlBackground, String urlLogotipo) {
		this();
		this.id = id;
		this.nome = nome;
		this.descricao = descricao;
		this.urlBackground = urlBackground;
		this.urlLogotipo = urlLogotipo;
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
		Segmento other = (Segmento) obj;
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
		return "Segmento [id=" + id
				+ ", nome=" + nome
				+ ", descricao=" + descricao
				+ ", urlBackground=" + urlBackground
				+ ", urlLogotipo=" + urlLogotipo
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
	
	public String getUrlBackground() {
		return urlBackground;
	}
	
	public void setUrlBackground(String urlBackground) {
		this.urlBackground = urlBackground;
	}
	
	public String getUrlLogotipo() {
		return urlLogotipo;
	}
	
	public void setUrlLogotipo(String urlLogotipo) {
		this.urlLogotipo = urlLogotipo;
	}
	
	public Set<Contratante> getContratantes() {
		return contratantes;
	}
	
	public void setContratantes(Set<Contratante> contratantes) {
		this.contratantes = contratantes;
	}
	
	public Set<Fornecedor> getFornecedores() {
		return fornecedores;
	}
	
	public void setFornecedores(Set<Fornecedor> fornecedores) {
		this.fornecedores = fornecedores;
	}
	
	public Set<ChecklistPadrao> getChecklistsPadroes() {
		return checklistsPadroes;
	}
	
	public void setChecklistsPadroes(Set<ChecklistPadrao> checklistsPadroes) {
		this.checklistsPadroes = checklistsPadroes;
	}
	
}
