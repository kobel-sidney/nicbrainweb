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
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "tipo_servico")
public class TipoServico extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 2411351763971950330L;
	
	public static final Integer ID_TIPO_AMBULANCIA = Integer.valueOf(1);
	public static final Integer ID_TIPO_POLICIA = Integer.valueOf(2);
	public static final Integer ID_TIPO_SEGURANCA_PARTICULAR = Integer.valueOf(3);
	public static final Integer ID_TIPO_BOMBEIRO = Integer.valueOf(4);
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_tipo_servico", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_tipo_servico", nullable = false)
	private String nome;
	
	@Lob
	@Basic(optional = true, fetch = FetchType.LAZY)
	@Column(name = "icone_tipo_servico", nullable = true)
	private byte[] icone;
	
	@OneToMany(mappedBy = "tipoServico", fetch = FetchType.LAZY)
	private Set<PostoServico> postosServicos = new HashSet<PostoServico>(0);
	
	@ManyToOne
	@JoinColumn(name = "id_contratante", nullable = true)
	private Contratante contratante;
	
	
	/** Método Construtor padrão. */
	public TipoServico() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 */
	public TipoServico(Long id, String nome) {
		this(id, nome, null);
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 * @param icone
	 */
	public TipoServico(Long id, String nome, byte[] icone) {
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
		TipoServico other = (TipoServico) obj;
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
		return "TipoServico [id=" + id
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
	
	public Set<PostoServico> getPostosServicos() {
		return postosServicos;
	}
	
	public void setPostosServicos(Set<PostoServico> postosServicos) {
		this.postosServicos = postosServicos;
	}

	public Contratante getContratante() {
		return contratante;
	}

	public void setContratante(Contratante contratante) {
		this.contratante = contratante;
	}
	
}
