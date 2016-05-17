package br.com.kolss.model.entities;

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

import br.com.kolss.model.enuns.TipoContato;

@Entity
@Table(name = "endereco_contato")
public class EnderecoContato extends AbstractEntity<Long> {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_endereco_contato", nullable = false)
	private Long id;

	@ManyToOne
	@JoinColumn(name = "fk_contato", nullable = false)
	private Contato contato;

	@ManyToOne
	@JoinColumn(name = "fk_endereco", nullable = false)
	private EnderecoNovoModelo endereco;

	@Column(length = 7, nullable = false)
	private String numero;

	@Column(length = 30)
	private String complemento;

	@Enumerated(EnumType.STRING)
	@Column(name = "tipo_contato", nullable = false)
	private TipoContato tipoContato;

	public EnderecoContato() {
		this.endereco = new EnderecoNovoModelo();
	}

	@Override
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Contato getContato() {
		return contato;
	}

	public void setContato(Contato contato) {
		this.contato = contato;
	}

	public EnderecoNovoModelo getEndereco() {
		return endereco;
	}

	public void setEndereco(EnderecoNovoModelo endereco) {
		this.endereco = endereco;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public TipoContato getTipoContato() {
		return tipoContato;
	}

	public void setTipoContato(TipoContato tipoContato) {
		this.tipoContato = tipoContato;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((complemento == null) ? 0 : complemento.hashCode());
		result = prime * result + ((contato == null) ? 0 : contato.hashCode());
		result = prime * result
				+ ((endereco == null) ? 0 : endereco.hashCode());
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
		EnderecoContato other = (EnderecoContato) obj;
		if (complemento == null) {
			if (other.complemento != null) {
				return false;
			}
		} else if (!complemento.equals(other.complemento)) {
			return false;
		}
		if (contato == null) {
			if (other.contato != null) {
				return false;
			}
		} else if (!contato.equals(other.contato)) {
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
		return "EnderecoContato [id=" + id + ", contato=" + contato
				+ ", enderecoNovoModelo=" + endereco + ", numero=" + numero
				+ ", complemento=" + complemento + ", tipoContato="
				+ tipoContato + "]";
	}

}
