package br.com.kolss.model.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embedded;
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
@Table(name = "endereco")
public class Endereco extends AbstractEntity<Long> {

	/** serialVersionUID */
	private static final long serialVersionUID = 4717920982647415371L;


	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_endereco", nullable = false, unique = true)
	private Long id;

	
	@Column(name = "logradouro", nullable = false)
	private String logradouro;

	
	@Column(name = "numero", nullable = true)
	private Integer numero;

	
	@Column(name = "complemento", nullable = true)
	private String complemento;

	
	@Column(name = "bairro", nullable = false)
	private String bairro;

	
	@Column(name = "cep", nullable = false)
	private String cep;

	@Embedded
	private CoordenadaGeografica coordenadas = new CoordenadaGeografica();

	
	@Column(name = "endereco_atual", nullable = false)
	private boolean enderecoAtual = false;

	@Temporal(TemporalType.TIMESTAMP)
	
	@Column(name = "data_cadastro", nullable = false)
	private Date dataCadastro;

	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_pessoa", nullable = true)
	private Pessoa pessoa;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_municipio", nullable = false)
	private Municipio municipio = new Municipio();

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_tipo_endereco", nullable = false)
	private TipoEndereco tipoEndereco = new TipoEndereco();

	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_cliente", nullable = true)
	private Cliente cliente;

	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_contratante", nullable = true)
	private Contratante contratante;

	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_local", nullable = true)
	private Local local;

	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_fornecedor", nullable = true)
	private Fornecedor fornecedor;

	/** Método Construtor padrão. */
	public Endereco() {
		super();
	}

	/**
	 * Método Construtor.
	 *
	 * @param id
	 * @param logradouro
	 * @param bairro
	 * @param cep
	 * @param enderecoAtual
	 * @param dataCadastro
	 * @param municipio
	 * @param tipoEndereco
	 */
	public Endereco(Long id, String logradouro, String bairro, String cep,
			boolean enderecoAtual, Date dataCadastro, Municipio municipio,
			TipoEndereco tipoEndereco) {

		this(id, logradouro, null, null, bairro, cep, null, null, null,
				enderecoAtual, dataCadastro, municipio, tipoEndereco, null,
				null, null, null);
	}

	/**
	 * Método Construtor.
	 *
	 * @param id
	 * @param logradouro
	 * @param numero
	 * @param complemento
	 * @param bairro
	 * @param cep
	 * @param latitude
	 * @param longitude
	 * @param pessoa
	 * @param enderecoAtual
	 * @param dataCadastro
	 * @param municipio
	 * @param tipoEndereco
	 * @param cliente
	 * @param contratante
	 * @param local
	 * @param fornecedor
	 */
	public Endereco(Long id, String logradouro, Integer numero,
			String complemento, String bairro, String cep, String latitude,
			String longitude, Pessoa pessoa, boolean enderecoAtual,
			Date dataCadastro, Municipio municipio, TipoEndereco tipoEndereco,
			Cliente cliente, Contratante contratante, Local local,
			Fornecedor fornecedor) {
		this();
		this.id = id;
		this.logradouro = logradouro;
		this.numero = numero;
		this.complemento = complemento;
		this.bairro = bairro;
		this.cep = cep;
		setLatitude(latitude);
		setLongitude(longitude);
		this.enderecoAtual = enderecoAtual;
		this.dataCadastro = dataCadastro;
		this.pessoa = pessoa;
		this.municipio = municipio;
		this.tipoEndereco = tipoEndereco;
		this.cliente = cliente;
		this.contratante = contratante;
		this.local = local;
		this.fornecedor = fornecedor;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bairro == null) ? 0 : bairro.hashCode());
		result = prime * result + ((cep == null) ? 0 : cep.hashCode());
		result = prime * result + ((cliente == null) ? 0 : cliente.hashCode());
		result = prime * result
				+ ((complemento == null) ? 0 : complemento.hashCode());
		result = prime * result
				+ ((contratante == null) ? 0 : contratante.hashCode());
		result = prime * result
				+ ((coordenadas == null) ? 0 : coordenadas.hashCode());
		result = prime * result + (enderecoAtual ? 1231 : 1237);
		result = prime * result
				+ ((fornecedor == null) ? 0 : fornecedor.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((local == null) ? 0 : local.hashCode());
		result = prime * result
				+ ((logradouro == null) ? 0 : logradouro.hashCode());
		result = prime * result
				+ ((municipio == null) ? 0 : municipio.hashCode());
		result = prime * result + ((numero == null) ? 0 : numero.hashCode());
		result = prime * result + ((pessoa == null) ? 0 : pessoa.hashCode());
		result = prime * result
				+ ((tipoEndereco == null) ? 0 : tipoEndereco.hashCode());
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
		Endereco other = (Endereco) obj;
		if (bairro == null) {
			if (other.bairro != null) {
				return false;
			}
		} else if (!bairro.equals(other.bairro)) {
			return false;
		}
		if (cep == null) {
			if (other.cep != null) {
				return false;
			}
		} else if (!cep.equals(other.cep)) {
			return false;
		}
		if (cliente == null) {
			if (other.cliente != null) {
				return false;
			}
		} else if (!cliente.equals(other.cliente)) {
			return false;
		}
		if (complemento == null) {
			if (other.complemento != null) {
				return false;
			}
		} else if (!complemento.equals(other.complemento)) {
			return false;
		}
		if (contratante == null) {
			if (other.contratante != null) {
				return false;
			}
		} else if (!contratante.equals(other.contratante)) {
			return false;
		}
		if (coordenadas == null) {
			if (other.coordenadas != null) {
				return false;
			}
		} else if (!coordenadas.equals(other.coordenadas)) {
			return false;
		}
		if (enderecoAtual != other.enderecoAtual) {
			return false;
		}
		if (fornecedor == null) {
			if (other.fornecedor != null) {
				return false;
			}
		} else if (!fornecedor.equals(other.fornecedor)) {
			return false;
		}
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		if (local == null) {
			if (other.local != null) {
				return false;
			}
		} else if (!local.equals(other.local)) {
			return false;
		}
		if (logradouro == null) {
			if (other.logradouro != null) {
				return false;
			}
		} else if (!logradouro.equals(other.logradouro)) {
			return false;
		}
		if (municipio == null) {
			if (other.municipio != null) {
				return false;
			}
		} else if (!municipio.equals(other.municipio)) {
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
		if (tipoEndereco == null) {
			if (other.tipoEndereco != null) {
				return false;
			}
		} else if (!tipoEndereco.equals(other.tipoEndereco)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "Endereco [id=" + id
				+ ", logradouro=" + logradouro
				+ ", numero=" + numero
				+ ", complemento=" + complemento
				+ ", bairro=" + bairro
				+ ", cep=" + cep
				+ ", " + coordenadas
				+ ", enderecoAtual=" + enderecoAtual
				+ ", pessoa=" + pessoa
				+ ", municipio=" + municipio
				+ ", tipoEndereco=" + tipoEndereco
				+ ", cliente=" + cliente
				+ ", contratante=" + contratante
				+ ", local=" + local
				+ ", fornecedor=" + fornecedor
				+ "]";
	}


	@Override
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getLatitude() {
		return this.coordenadas.getLatitude();
	}

	public void setLatitude(String latitude) {
		this.coordenadas.setLatitude(latitude);
	}

	public String getLongitude() {
		return this.coordenadas.getLongitude();
	}

	public void setLongitude(String longitude) {
		this.coordenadas.setLongitude(longitude);
	}

	public boolean isEnderecoAtual() {
		return enderecoAtual;
	}

	public void setEnderecoAtual(boolean enderecoAtual) {
		this.enderecoAtual = enderecoAtual;
	}

	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public Municipio getMunicipio() {
		return municipio;
	}

	public void setMunicipio(Municipio municipio) {
		this.municipio = municipio;
	}

	public TipoEndereco getTipoEndereco() {
		return tipoEndereco;
	}

	public void setTipoEndereco(TipoEndereco tipoEndereco) {
		this.tipoEndereco = tipoEndereco;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Contratante getContratante() {
		return contratante;
	}

	public void setContratante(Contratante contratante) {
		this.contratante = contratante;
	}

	public Local getLocal() {
		return local;
	}

	public void setLocal(Local local) {
		this.local = local;
	}

	public Fornecedor getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}
}
