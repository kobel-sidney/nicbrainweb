package br.com.kolss.model.entities;

import java.util.Arrays;
import java.util.Comparator;

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
import javax.persistence.Table;


@Entity
@Table(name = "documento_anexo")
public class DocumentoAnexo extends AbstractEntity<Long> implements Comparator<DocumentoAnexo>, Comparable<DocumentoAnexo> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -1930521951289869841L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_documento_anexo", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_anexo", nullable = false)
	private String nome;
	
	@Lob
	@Basic(optional = false, fetch = FetchType.LAZY)
	@Column(name = "documento_anexo", nullable = false)
	private byte[] documento;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_local", nullable = true)
	private Local local = new Local();
	
	
	/** Método Construtor padrão. */
	public DocumentoAnexo() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param nome
	 * @param documento
	 */
	public DocumentoAnexo(Long id, String nome, byte[] documento) {
		this(id, nome, documento, null);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param nome
	 * @param documento
	 * @param local
	 */
	public DocumentoAnexo(Long id, String nome, byte[] documento, Local local) {
		this();
		this.id = id;
		this.nome = nome;
		this.documento = documento;
		this.local = local;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Arrays.hashCode(documento);
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((local == null) ? 0 : local.hashCode());
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
		DocumentoAnexo other = (DocumentoAnexo) obj;
		if (!Arrays.equals(documento, other.documento))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (local == null) {
			if (other.local != null)
				return false;
		} else if (!local.equals(other.local))
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
		return "DocumentoAnexo [id=" + id
				+ ", nome=" + nome
				+ ", local=" + local
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
	
	public byte[] getDocumento() {
		return documento;
	}
	
	public void setDocumento(byte[] documento) {
		this.documento = documento;
	}
	
	public Local getLocal() {
		return local;
	}
	
	public void setLocal(Local local) {
		this.local = local;
	}

	@Override
	public int compareTo(DocumentoAnexo o) {
		return (this.getNome()).compareToIgnoreCase(o.getNome());
	}

	@Override
	public int compare(DocumentoAnexo o1, DocumentoAnexo o2) {
		return o1.getNome().compareToIgnoreCase(o2.getNome());
	}
	
}
