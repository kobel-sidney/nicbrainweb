package br.com.kolss.model.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "atividade_comentario")
public class AtividadeComentario extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 6689414202990529235L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_atividade_comentario", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "comentario", nullable = false)
	private String comentario;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_comentario", nullable = false)
	private Date dataComentario;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_atividade", nullable = true)
	private Atividade atividade = new Atividade();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_usuario", nullable = true)
	private Usuario usuario = new Usuario();
	
	
	/** Método Construtor padrão. */
	public AtividadeComentario() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param comentario
	 * @param dataComentario
	 */
	public AtividadeComentario(Long id, String comentario, Date dataComentario) {
		this(id, comentario, dataComentario, null, null);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param comentario
	 * @param dataComentario
	 * @param usuario
	 * @param atividade
	 */
	public AtividadeComentario(Long id, String comentario, Date dataComentario,
			Usuario usuario, Atividade atividade) {
		this();
		this.id = id;
		this.comentario = comentario;
		this.dataComentario = dataComentario;
		this.atividade = atividade;
		this.usuario = usuario;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((comentario == null) ? 0 : comentario.hashCode());
		result = prime * result
				+ ((dataComentario == null) ? 0 : dataComentario.hashCode());
		result = prime * result + ((usuario == null) ? 0 : usuario.hashCode());
		result = prime * result
				+ ((atividade == null) ? 0 : atividade.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		if (getClass() != obj.getClass())
			return false;
		AtividadeComentario other = (AtividadeComentario) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (comentario == null) {
			if (other.comentario != null)
				return false;
		} else if (!comentario.equals(other.comentario))
			return false;
		if (dataComentario == null) {
			if (other.dataComentario != null)
				return false;
		} else if (!dataComentario.equals(other.dataComentario))
			return false;
		if (usuario == null) {
			if (other.usuario != null)
				return false;
		} else if (!usuario.equals(other.usuario))
			return false;
		if (atividade == null) {
			if (other.atividade != null)
				return false;
		} else if (!atividade.equals(other.atividade))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "AtividadeComentario [id=" + id
				+ ", comentario=" + comentario
				+ ", dataComentario=" + dataComentario
				+ ", usuario=" + usuario
				+ ", atividade=" + atividade
				+ "]";
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getComentario() {
		return comentario;
	}
	
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	
	public Date getDataComentario() {
		return dataComentario;
	}
	
	public void setDataComentario(Date dataComentario) {
		this.dataComentario = dataComentario;
	}
	
	public Usuario getUsuario() {
		return usuario;
	}
	
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public Atividade getAtividade() {
		return atividade;
	}
	
	public void setAtividade(Atividade atividade) {
		this.atividade = atividade;
	}
	
}
