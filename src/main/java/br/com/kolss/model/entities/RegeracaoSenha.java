package br.com.kolss.model.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.com.kolss.model.enuns.RegeracaoSenhaStatusEnum;


@Entity
@Table(name = "regeracao_senha")
public class RegeracaoSenha extends AbstractEntity<Long> {

	/** serialVersionUID */
	private static final long serialVersionUID = 1821884731679487627L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_regeracao_senha", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "hash_validacao", nullable = false)
	private String hashValidacao;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_solicitacao", nullable = false)
	private Date dataSolicitacao;
	
	@Column(name = "status", nullable = false)
	@Enumerated(EnumType.ORDINAL)
	private RegeracaoSenhaStatusEnum status;
	
	@Temporal(TemporalType.TIMESTAMP)
	
	@Column(name = "data_tentativa", nullable = true)
	private Date dataTentativa;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_encerramento", nullable = true)
	private Date dataEncerramento;
	
	@Column(name = "expirado", nullable = false)
	private boolean expirado = false;
	
	@ManyToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "id_usuario", nullable = false)
	private Usuario usuario = new Usuario();
	
	
	public RegeracaoSenha() {
		super();
	}
	
	public RegeracaoSenha(Long id, String hashValidacao, Date dataSolicitacao,
			RegeracaoSenhaStatusEnum status, boolean expirado, Usuario usuario) {
		this(id, hashValidacao, dataSolicitacao, status, null, null, expirado,
				usuario);
	}
	
	public RegeracaoSenha(Long id, String hashValidacao, Date dataSolicitacao,
			RegeracaoSenhaStatusEnum status, Date dataTentativa,
			Date dataEncerramento, boolean expirado, Usuario usuario) {
		this();
		this.id = id;
		this.hashValidacao = hashValidacao;
		this.dataSolicitacao = dataSolicitacao;
		this.status = status;
		this.dataTentativa = dataTentativa;
		this.dataEncerramento = dataEncerramento;
		this.expirado = expirado;
		this.usuario = usuario;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime
				* result
				+ ((dataEncerramento == null) ? 0 : dataEncerramento.hashCode());
		result = prime * result
				+ ((dataSolicitacao == null) ? 0 : dataSolicitacao.hashCode());
		result = prime * result
				+ ((dataTentativa == null) ? 0 : dataTentativa.hashCode());
		result = prime * result
				+ ((hashValidacao == null) ? 0 : hashValidacao.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((usuario == null) ? 0 : usuario.hashCode());
		result = prime * result + (expirado ? 1231 : 1237);
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
		RegeracaoSenha other = (RegeracaoSenha) obj;
		if (expirado != other.expirado)
			return false;
		if (dataEncerramento == null) {
			if (other.dataEncerramento != null)
				return false;
		} else if (!dataEncerramento.equals(other.dataEncerramento))
			return false;
		if (dataSolicitacao == null) {
			if (other.dataSolicitacao != null)
				return false;
		} else if (!dataSolicitacao.equals(other.dataSolicitacao))
			return false;
		if (dataTentativa == null) {
			if (other.dataTentativa != null)
				return false;
		} else if (!dataTentativa.equals(other.dataTentativa))
			return false;
		if (hashValidacao == null) {
			if (other.hashValidacao != null)
				return false;
		} else if (!hashValidacao.equals(other.hashValidacao))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (status != other.status)
			return false;
		if (usuario == null) {
			if (other.usuario != null)
				return false;
		} else if (!usuario.equals(other.usuario))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "RegeracaoSenha [id=" + id
				+ ", hashValidacao=" + hashValidacao
				+ ", dataSolicitacao=" + dataSolicitacao
				+ ", status=" + status
				+ ", dataTentativa=" + dataTentativa
				+ ", dataEncerramento=" + dataEncerramento
				+ ", expirado=" + expirado
				+ ", usuario=" + usuario
				+ "]";
	}
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getHashValidacao() {
		return hashValidacao;
	}
	
	public void setHashValidacao(String hashValidacao) {
		this.hashValidacao = hashValidacao;
	}
	
	public Date getDataSolicitacao() {
		return dataSolicitacao;
	}
	
	public void setDataSolicitacao(Date dataSolicitacao) {
		this.dataSolicitacao = dataSolicitacao;
	}
	
	public RegeracaoSenhaStatusEnum getStatus() {
		return status;
	}
	
	public void setStatus(RegeracaoSenhaStatusEnum status) {
		this.status = status;
	}
	
	public Date getDataTentativa() {
		return dataTentativa;
	}
	
	public void setDataTentativa(Date dataTentativa) {
		this.dataTentativa = dataTentativa;
	}
	
	public Date getDataEncerramento() {
		return dataEncerramento;
	}
	
	public void setDataEncerramento(Date dataEncerramento) {
		this.dataEncerramento = dataEncerramento;
	}
	
	public boolean isExpirado() {
		return expirado;
	}
	
	public void setExpirado(boolean expirado) {
		this.expirado = expirado;
	}
	
	public Usuario getUsuario() {
		return usuario;
	}
	
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
}
