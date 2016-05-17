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
@Table(name = "telefone")
public class Telefone extends AbstractEntity<Long> {

	private static final long serialVersionUID = -5431207017530281296L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_telefone")
	private Long id;

	@Column(length = 9, nullable = false)
	private String numero;

	@Column(length = 3)
	private String ddd;

	@Column(length = 2, nullable = false)
	private String ddi;

	@Column(name = "falar_com", length = 35)
	private String falarCom;

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

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getDdd() {
		return ddd;
	}

	public void setDdd(String ddd) {
		this.ddd = ddd;
	}

	public String getDdi() {
		return ddi;
	}

	public void setDdi(String ddi) {
		this.ddi = ddi;
	}

	public String getFalarCom() {
		return falarCom;
	}

	public void setFalarCom(String falarCom) {
		this.falarCom = falarCom;
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
	public boolean isNew() {
		return !isNumeroNatural(this.id);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((contato == null) ? 0 : contato.hashCode());
		result = prime * result
				+ ((dataCriacao == null) ? 0 : dataCriacao.hashCode());
		result = prime * result + ((ddd == null) ? 0 : ddd.hashCode());
		result = prime * result + ((ddi == null) ? 0 : ddi.hashCode());
		result = prime * result
				+ ((falarCom == null) ? 0 : falarCom.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((numero == null) ? 0 : numero.hashCode());
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
		Telefone other = (Telefone) obj;
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
		if (ddd == null) {
			if (other.ddd != null) {
				return false;
			}
		} else if (!ddd.equals(other.ddd)) {
			return false;
		}
		if (ddi == null) {
			if (other.ddi != null) {
				return false;
			}
		} else if (!ddi.equals(other.ddi)) {
			return false;
		}
		if (falarCom == null) {
			if (other.falarCom != null) {
				return false;
			}
		} else if (!falarCom.equals(other.falarCom)) {
			return false;
		}
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		if (numero == null) {
			if (other.numero != null) {
				return false;
			}
		} else if (!numero.equals(other.numero)) {
			return false;
		}
		if (tipoContato != other.tipoContato) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "Telefone [id=" + id + ", numero=" + numero + ", ddd=" + ddd
				+ ", ddi=" + ddi + ", falarCom=" + falarCom + ", tipoContato="
				+ tipoContato + ", contato=" + contato + ", dataCriacao="
				+ dataCriacao + "]";
	}

}
