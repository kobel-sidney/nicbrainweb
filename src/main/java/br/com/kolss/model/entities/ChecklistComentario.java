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
@Table(name = "checklist_comentario")
public class ChecklistComentario extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 5348740727306013246L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_checklist_comentario", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "comentario", nullable = false)
	private String comentario;
	
	@Temporal(TemporalType.TIMESTAMP)
	
	@Column(name = "data_comentario", nullable = false)
	private Date dataComentario;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_usuario", nullable = true)
	private Usuario usuario = new Usuario();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_checklist", nullable = true)
	private Checklist checklist = new Checklist();
	
	
	/** Método Construtor padrão. */
	public ChecklistComentario() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param comentario
	 * @param dataComentario
	 */
	public ChecklistComentario(Long id, String comentario, Date dataComentario) {
		this(id, comentario, dataComentario, null, null);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param comentario
	 * @param dataComentario
	 * @param usuario
	 * @param checklist
	 */
	public ChecklistComentario(Long id, String comentario, Date dataComentario,
			Usuario usuario, Checklist checklist) {
		this();
		this.id = id;
		this.comentario = comentario;
		this.dataComentario = dataComentario;
		this.usuario = usuario;
		this.checklist = checklist;
	}
	
	
	@Override
	public boolean isNew() {
		return !isNumeroNatural(this.id);
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
				+ ((checklist == null) ? 0 : checklist.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChecklistComentario other = (ChecklistComentario) obj;
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
			return false;		if (checklist == null) {
			if (other.checklist != null)
				return false;
		} else if (!checklist.equals(other.checklist))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ChecklistComentario [id=" + id
				+ ", comentario=" + comentario
				+ ", dataComentario=" + dataComentario
				+ ", usuario=" + usuario
				+ ", checklist=" + checklist
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
	
	public Checklist getChecklist() {
		return checklist;
	}
	
	public void setChecklist(Checklist checklist) {
		this.checklist = checklist;
	}
	
}
