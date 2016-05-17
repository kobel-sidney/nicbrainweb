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

import br.com.kolss.model.enuns.TipoDocumento;

@Entity
@Table(name = "documento")
public class Documento extends AbstractEntity<Long> {

	private static final long serialVersionUID = -7242780175612419168L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_documento")
	private Long id;

	@Column(length = 130, nullable = false)
	private String nome;

	@Column(length = 25, nullable = false)
	private String numero;

	@Column(length = 15, nullable = false)
	private String instEmissora;

	@Temporal(TemporalType.DATE)
	@Column(name = "data_emissao")
	private Date dataEmissao;

	@Temporal(TemporalType.DATE)
	@Column(name = "data_validade")
	private Date dataValidade;

	@Enumerated(EnumType.STRING)
	@Column(name = "tipo_documento", length = 11, nullable = false)
	private TipoDocumento tipoDocumento;

	@ManyToOne
	@JoinColumn(name = "fk_pessoa", nullable = false)
	private PessoaNovoModelo pessoa;

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

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getInstEmissora() {
		return instEmissora;
	}

	public void setInstEmissora(String instEmissora) {
		this.instEmissora = instEmissora;
	}

	public Date getDataEmissao() {
		return dataEmissao;
	}

	public void setDataEmissao(Date dataEmissao) {
		this.dataEmissao = dataEmissao;
	}

	public Date getDataValidade() {
		return dataValidade;
	}

	public void setDataValidade(Date dataValidade) {
		this.dataValidade = dataValidade;
	}

	public PessoaNovoModelo getPessoa() {
		return pessoa;
	}

	public void setPessoa(PessoaNovoModelo pessoa) {
		this.pessoa = pessoa;
	}

	public TipoDocumento getTipoDocumento() {
		return tipoDocumento;
	}

	public void setTipoDocumento(TipoDocumento tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
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
		result = prime * result
				+ ((dataCriacao == null) ? 0 : dataCriacao.hashCode());
		result = prime * result
				+ ((dataEmissao == null) ? 0 : dataEmissao.hashCode());
		result = prime * result
				+ ((dataValidade == null) ? 0 : dataValidade.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((instEmissora == null) ? 0 : instEmissora.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result + ((numero == null) ? 0 : numero.hashCode());
		result = prime * result + ((pessoa == null) ? 0 : pessoa.hashCode());
		result = prime * result
				+ ((tipoDocumento == null) ? 0 : tipoDocumento.hashCode());
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
		Documento other = (Documento) obj;
		if (dataCriacao == null) {
			if (other.dataCriacao != null) {
				return false;
			}
		} else if (!dataCriacao.equals(other.dataCriacao)) {
			return false;
		}
		if (dataEmissao == null) {
			if (other.dataEmissao != null) {
				return false;
			}
		} else if (!dataEmissao.equals(other.dataEmissao)) {
			return false;
		}
		if (dataValidade == null) {
			if (other.dataValidade != null) {
				return false;
			}
		} else if (!dataValidade.equals(other.dataValidade)) {
			return false;
		}
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		if (instEmissora == null) {
			if (other.instEmissora != null) {
				return false;
			}
		} else if (!instEmissora.equals(other.instEmissora)) {
			return false;
		}
		if (nome == null) {
			if (other.nome != null) {
				return false;
			}
		} else if (!nome.equals(other.nome)) {
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
		if (tipoDocumento != other.tipoDocumento) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "Documento [id=" + id + ", nome=" + nome + ", numero=" + numero
				+ ", instEmissora=" + instEmissora + ", dataEmissao="
				+ dataEmissao + ", dataValidade=" + dataValidade
				+ ", tipoDocumento=" + tipoDocumento + ", pessoa=" + pessoa
				+ ", dataCriacao=" + dataCriacao + "]";
	}

}
