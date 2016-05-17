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
@Table(name = "tipo_mensagem")
public class TipoMensagem extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 2565993192169224838L;
	
	public static Long ID_TIPO_AVISO = Long.valueOf(1);
	public static Long ID_TIPO_ALERTA = Long.valueOf(2);
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_tipo_mensagem", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_tipo_mensagem", nullable = false)
	private String nome;
	
	@OneToMany(mappedBy = "tipoMensagem", fetch = FetchType.LAZY)
	private Set<Mensagem> mensagens = new HashSet<Mensagem>();
	
	
	/** Método Construtor padrão. */
	public TipoMensagem() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 */
	public TipoMensagem(Long id, String nome) {
		this();
		this.id = id;
		this.nome = nome;
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
		TipoMensagem other = (TipoMensagem) obj;
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
		return "TipoMensagem [id=" + id
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
	
	public Set<Mensagem> getMensagens() {
		return mensagens;
	}
	
	public void setMensagens(Set<Mensagem> mensagens) {
		this.mensagens = mensagens;
	}
	
}
