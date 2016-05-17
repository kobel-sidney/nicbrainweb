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
@Table(name = "email_pessoa")
public class EmailPessoa extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 6251067733907318209L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_email", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "email", nullable = false)
	private String email;
	
	@Temporal(TemporalType.TIMESTAMP)
	
	@Column(name = "data_cadastro", nullable = false)
	private Date dataCadastro;
	
	
	@Column(name = "email_atual", nullable = false)
	private boolean emailAtual = false;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_pessoa", nullable = true)
	private Pessoa pessoa = new Pessoa();
	
	
	/** Método Construtor padrão. */
	public EmailPessoa() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param email
	 * @param dataCadastro
	 * @param emailAtual
	 */
	public EmailPessoa(Long id, String email, Date dataCadastro,
			boolean emailAtual) {
		this(id, email, dataCadastro, emailAtual, null);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param email
	 * @param dataCadastro
	 * @param emailAtual
	 * @param pessoa
	 */
	public EmailPessoa(Long id, String email, Date dataCadastro,
			boolean emailAtual, Pessoa pessoa) {
		this();
		this.id = id;
		this.email = email;
		this.dataCadastro = dataCadastro;
		this.emailAtual = emailAtual;
		this.pessoa = pessoa;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
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
		EmailPessoa other = (EmailPessoa) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "EmailPessoa [id=" + id
				+ ", email=" + email
				+ ", dataCadastro=" + dataCadastro
				+ ", emailAtual=" + emailAtual
				+ ", pessoa=" + pessoa
				+ "]";
	}
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = (email != null ? email.toLowerCase() : null);
	}
	
	public Date getDataCadastro() {
		return dataCadastro;
	}
	
	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	
	public boolean isEmailAtual() {
		return emailAtual;
	}
	
	public void setEmailAtual(boolean emailAtual) {
		this.emailAtual = emailAtual;
	}
	
	public Pessoa getPessoa() {
		return pessoa;
	}
	
	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
	
}
