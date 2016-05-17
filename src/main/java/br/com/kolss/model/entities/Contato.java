package br.com.kolss.model.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "contato")
public class Contato extends AbstractEntity<Long> {

	private static final long serialVersionUID = 8906526129336766222L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_contato")
	private Long id;

	@OneToOne
	@JoinColumn(name = "fk_pessoa", unique = true)
	private PessoaNovoModelo pessoa;

	@Override
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public PessoaNovoModelo getPessoa() {
		return pessoa;
	}

	public void setPessoa(PessoaNovoModelo pessoa) {
		this.pessoa = pessoa;
	}

	@Override
	public boolean isNew() {
		return !isNumeroNatural(this.id);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((pessoa == null) ? 0 : pessoa.hashCode());
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
		Contato other = (Contato) obj;
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		if (pessoa == null) {
			if (other.pessoa != null) {
				return false;
			}
		} else if (!pessoa.equals(other.pessoa)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "Contato [id=" + id + ", pessoa=" + pessoa + "]";
	}
}
