package br.com.kolss.model.entities;

import java.io.Serializable;
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
@Table(name = "device")
public class Device implements Serializable{
	
	/** serialVersionUID */
	private static final long serialVersionUID = 5105273236453248548L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_device", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "id_registro", nullable = false, unique = true)
	private String idRegistro;
	
	
	@Column(name = "id_projeto", nullable = false)
	private String idProjeto;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_ultimo_login", nullable = false)
	private Date dataUltimoLogin;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_usuario_responsavel", nullable = false, unique = true)
	private Usuario usuarioResponsavel;
	
	
	/** Método Construtor padrão. */
	public Device() {
		super();
	}
	
	/**
	 * Método Construtor
	 *  
	 * @param id
	 * @param idRegistro
	 * @param idProjeto
	 * @param dataUltimoLogin
	 * @param usuarioResponsavel
	 */
	public Device(Long id, String idRegistro, String idProjeto,
			Date dataUltimoLogin, Usuario usuarioResponsavel) {
		this();
		this.id = id;
		this.idRegistro = idRegistro;
		this.idProjeto = idProjeto;
		this.dataUltimoLogin = dataUltimoLogin;
		this.usuarioResponsavel = usuarioResponsavel;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((dataUltimoLogin == null) ? 0 : dataUltimoLogin.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((idProjeto == null) ? 0 : idProjeto.hashCode());
		result = prime * result
				+ ((idRegistro == null) ? 0 : idRegistro.hashCode());
		result = prime * result + ((usuarioResponsavel == null) ? 0 : usuarioResponsavel.hashCode());
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
		Device other = (Device) obj;
		if (dataUltimoLogin == null) {
			if (other.dataUltimoLogin != null)
				return false;
		} else if (!dataUltimoLogin.equals(other.dataUltimoLogin))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (idProjeto == null) {
			if (other.idProjeto != null)
				return false;
		} else if (!idProjeto.equals(other.idProjeto))
			return false;
		if (idRegistro == null) {
			if (other.idRegistro != null)
				return false;
		} else if (!idRegistro.equals(other.idRegistro))
			return false;
		if (usuarioResponsavel == null) {
			if (other.usuarioResponsavel != null)
				return false;
		} else if (!usuarioResponsavel.equals(other.usuarioResponsavel))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Device [id=" + id
				+ ", idRegistro=" + idRegistro
				+ ", idProjeto=" + idProjeto
				+ ", dataUltimoLogin=" + dataUltimoLogin
				+ ", usuarioResponsavel=" + usuarioResponsavel
				+ "]";
	}
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getIdRegistro() {
		return idRegistro;
	}
	
	public void setIdRegistro(String idRegistro) {
		this.idRegistro = idRegistro;
	}
	
	public String getIdProjeto() {
		return idProjeto;
	}
	
	public void setIdProjeto(String idProjeto) {
		this.idProjeto = idProjeto;
	}
	
	public Date getDataUltimoLogin() {
		return dataUltimoLogin;
	}
	
	public void setDataUltimoLogin(Date dataUltimoLogin) {
		this.dataUltimoLogin = dataUltimoLogin;
	}
	
	public Usuario getUsuarioResponsavel() {
		return usuarioResponsavel;
	}
	
	public void setUsuarioResponsavel(Usuario usuarioResponsavel) {
		this.usuarioResponsavel = usuarioResponsavel;
	}
	
}
