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
@Table(name = "telefone_pessoa")
public class TelefonePessoa extends AbstractEntity<Long> {

	/** serialVersionUID */
	private static final long serialVersionUID = 1411722572092330887L;


	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_telefone_pessoa", nullable = false, unique = true)
	private Long id;

	
	@Column(name = "nr_telefone_util", nullable = false)
	private String numero;

	@Temporal(TemporalType.TIMESTAMP)
	
	@Column(name = "data_cadastro", nullable = false)
	private Date dataCadastro;

	
	@Column(name = "telefone_atual", nullable = false)
	private boolean atual;

	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_tipo_telefone", nullable = true)
	private TipoTelefone tipoTelefone = new TipoTelefone();

	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_pessoa", nullable = true)
	private Pessoa pessoa = new Pessoa();


	/** Método Construtor padrão. */
	public TelefonePessoa() {
		super();
	}

	/**
	 * Método Construtor
	 *
	 * @param id
	 * @param numero
	 * @param dataCadastro
	 * @param atual
	 */
	public TelefonePessoa(Long id, String numero, Date dataCadastro,
			boolean atual) {
		this(id, numero, dataCadastro, atual, null, null);
	}

	/**
	 * Método Construtor
	 *
	 * @param id
	 * @param numero
	 * @param dataCadastro
	 * @param atual
	 * @param tipoTelefone
	 * @param pessoa
	 */
	public TelefonePessoa(Long id, String numero, Date dataCadastro,
			boolean atual, TipoTelefone tipoTelefone, Pessoa pessoa) {
		this();
		this.id = id;
		this.numero = numero;
		this.dataCadastro = dataCadastro;
		this.atual = atual;
		this.tipoTelefone = tipoTelefone;
		this.pessoa = pessoa;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (atual ? 1231 : 1237);
		result = prime * result
				+ ((dataCadastro == null) ? 0 : dataCadastro.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((numero == null) ? 0 : numero.hashCode());
		result = prime * result + ((pessoa == null) ? 0 : pessoa.hashCode());
		result = prime * result
				+ ((tipoTelefone == null) ? 0 : tipoTelefone.hashCode());
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
		TelefonePessoa other = (TelefonePessoa) obj;
		if (atual != other.atual) {
			return false;
		}
		if (dataCadastro == null) {
			if (other.dataCadastro != null) {
				return false;
			}
		} else if (!dataCadastro.equals(other.dataCadastro)) {
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
		if (pessoa == null) {
			if (other.pessoa != null) {
				return false;
			}
		} else if (!pessoa.equals(other.pessoa)) {
			return false;
		}
		if (tipoTelefone == null) {
			if (other.tipoTelefone != null) {
				return false;
			}
		} else if (!tipoTelefone.equals(other.tipoTelefone)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "TelefonePessoa [id=" + id
				+ ", numero=" + numero
				+ ", dataCadastro=" + dataCadastro
				+ ", atual=" + atual
				+ ", tipoTelefone=" + tipoTelefone
				+ ", pessoa=" + pessoa
				+ "]";
	}


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

	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public boolean isAtual() {
		return atual;
	}

	public void setAtual(boolean atual) {
		this.atual = atual;
	}

	public TipoTelefone getTipoTelefone() {
		return tipoTelefone;
	}

	public void setTipoTelefone(TipoTelefone tipoTelefone) {
		this.tipoTelefone = tipoTelefone;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

}
