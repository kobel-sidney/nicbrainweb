package br.com.kolss.model.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.com.kolss.model.enuns.TipoContato;

@Entity
@Table(name = "email")
public class Email extends AbstractEntity<Long> {

	private static final long serialVersionUID = 2040662236797440471L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_email")
	private Long id;

	@Column(length = 150, nullable = false)
	private String endereco;

	@Enumerated(EnumType.STRING)
	@Column(name = "tipo_contato", length = 11, nullable = false)
	private TipoContato tipoContato;

	@ManyToOne
	@JoinColumn(name = "fk_contato")
	private Contato contato;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_criacao", nullable = false)
	private Date dataCriacao;

	@Override
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public TipoContato getTipoContato() {
		return tipoContato;
	}

	public void setTipoContato(TipoContato tipoContato) {
		this.tipoContato = tipoContato;
	}

	public Contato getContato() {
		return contato;
	}

	public void setContato(Contato contato) {
		this.contato = contato;
	}

	public Date getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((contato == null) ? 0 : contato.hashCode());
		result = prime * result
				+ ((dataCriacao == null) ? 0 : dataCriacao.hashCode());
		result = prime * result
				+ ((endereco == null) ? 0 : endereco.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((tipoContato == null) ? 0 : tipoContato.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		Email other = (Email) obj;
		if (contato == null) {
			if (other.contato != null) {
				return false;
			}
		} else if (!contato.equals(other.contato)) {
			return false;
		}
		if (dataCriacao == null) {
			if (other.dataCriacao != null) {
				return false;
			}
		} else if (!dataCriacao.equals(other.dataCriacao)) {
			return false;
		}
		if (endereco == null) {
			if (other.endereco != null) {
				return false;
			}
		} else if (!endereco.equals(other.endereco)) {
			return false;
		}
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		if (tipoContato != other.tipoContato) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "Email [id=" + id + ", endereco=" + endereco + ", tipoContato="
				+ tipoContato + ", contato=" + contato + ", dataCriacao="
				+ dataCriacao + "]";
	}

}
