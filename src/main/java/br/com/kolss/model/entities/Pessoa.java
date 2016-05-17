package br.com.kolss.model.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "pessoa")
public class Pessoa extends AbstractEntity<Long> {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 9124997052316759354L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_pessoa", nullable = false, unique = true)
	private Long id	;

	@Column(name = "nome_pessoa", nullable = false)
	private String nome;

	@Column(name = "cpf_pessoa", nullable = false, unique = true)
	private String cpf;

	@Column(name = "rg_pessoa", nullable = false)
	private String rg;

	@Lob
	@Column(name = "foto", nullable = true)
	private byte[] foto;

	@Temporal(TemporalType.TIMESTAMP)

	@Column(name = "data_nascimento", nullable = false)
	private Date dataNascimento;

	@Temporal(TemporalType.TIMESTAMP)

	@Column(name = "data_ultima_alteracao", nullable = false)
	private Date dataUltimaAlteracao;

	@Column(name = "apelido", nullable = true)
	private String apelido;

	@Column(name = "nome_pai", nullable = true)
	private String nomePai;

	@Column(name = "nome_mae", nullable = true)
	private String nomeMae;

	@Lob
	@Basic(optional = true, fetch = FetchType.LAZY)
	@Column(name = "string_face", nullable = true)
	private byte[] stringFace;

	@Column(name = "ativo", nullable = false)
	private boolean ativo = true;

	@ManyToOne(fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name = "id_genero", nullable = true)
	private Genero genero = new Genero();

	@ManyToOne(fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name = "id_tipo_pessoa", nullable = true)
	private TipoPessoa tipoPessoa = new TipoPessoa();

	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_cliente", nullable = true)
	private Cliente cliente = new Cliente();

	@OneToMany(mappedBy = "pessoa", fetch = FetchType.LAZY)
	private Set<EmailPessoa> emailsPessoais = new HashSet<EmailPessoa>();

	@OneToMany(mappedBy = "pessoa", fetch = FetchType.EAGER)
	private Set<Usuario> usuarios = new HashSet<Usuario>();

	@OneToMany(mappedBy = "pessoa", fetch = FetchType.LAZY)
	private Set<TelefonePessoa> telefonesPessoais = new HashSet<TelefonePessoa>();

	@OneToMany(mappedBy = "pessoa", fetch = FetchType.LAZY)
	private Set<Endereco> enderecos = new HashSet<Endereco>();

	@ManyToMany(mappedBy = "pessoas", fetch = FetchType.LAZY)
	private Set<TrocaVeiculo> trocaVeiculos = new HashSet<>(0);

	@ManyToMany(mappedBy = "tripulantes")
	private List<Ronda> rondas;

	public List<Ronda> getRondas() {
		return rondas;
	}

	public void setRondas(List<Ronda> rondas) {
		this.rondas = rondas;
	}

	/**
	 * Método Construtor padrão.
	 */
	public Pessoa() {
		super();
	}

	/**
	 * Método Construtor
	 *
	 * @param id
	 * @param nome
	 * @param cpf
	 * @param dataNascimento
	 * @param dataUltimaAlteracao
	 * @param ativo
	 */
	public Pessoa(Long id, String nome, String cpf, Date dataNascimento, Date dataUltimaAlteracao, boolean ativo) {
		this(id, nome, cpf, null, null, dataNascimento, dataUltimaAlteracao, ativo, null, null, null, null, null, null,
				null);
	}

	/**
	 * Método Construtor
	 *
	 * @param id
	 * @param nome
	 * @param cpf
	 * @param rg
	 * @param foto
	 * @param dataNascimento
	 * @param dataUltimaAlteracao
	 * @param ativo
	 * @param genero
	 * @param tipoPessoa
	 * @param cliente
	 * @param apelido
	 * @param nomePai
	 * @param nomeMae
	 * @param stringFace
	 */
	public Pessoa(Long id, String nome, String cpf, String rg, byte[] foto, Date dataNascimento,
			Date dataUltimaAlteracao, boolean ativo, Genero genero, TipoPessoa tipoPessoa, Cliente cliente,
			String apelido, String nomePai, String nomeMae, byte[] stringFace) {
		this();
		this.id = id;
		this.nome = nome;
		this.cpf = cpf;
		this.rg = rg;
		this.dataNascimento = dataNascimento;
		this.dataUltimaAlteracao = dataUltimaAlteracao;
		this.ativo = ativo;
		this.genero = genero;
		this.tipoPessoa = tipoPessoa;
		this.cliente = cliente;
		this.apelido = apelido;
		this.nomePai = nomePai;
		this.nomeMae = nomeMae;
		this.stringFace = stringFace;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (ativo ? 1231 : 1237);
		result = prime * result + ((cliente == null) ? 0 : cliente.hashCode());
		result = prime * result + ((cpf == null) ? 0 : cpf.hashCode());
		result = prime * result + ((dataNascimento == null) ? 0 : dataNascimento.hashCode());
		result = prime * result + ((dataUltimaAlteracao == null) ? 0 : dataUltimaAlteracao.hashCode());
		result = prime * result + ((genero == null) ? 0 : genero.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result + ((rg == null) ? 0 : rg.hashCode());
		result = prime * result + ((tipoPessoa == null) ? 0 : tipoPessoa.hashCode());
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
		Pessoa other = (Pessoa) obj;
		if (ativo != other.ativo) {
			return false;
		}
		if (cliente == null) {
			if (other.cliente != null) {
				return false;
			}
		} else if (!cliente.equals(other.cliente)) {
			return false;
		}
		if (cpf == null) {
			if (other.cpf != null) {
				return false;
			}
		} else if (!cpf.equals(other.cpf)) {
			return false;
		}
		if (dataNascimento == null) {
			if (other.dataNascimento != null) {
				return false;
			}
		} else if (!dataNascimento.equals(other.dataNascimento)) {
			return false;
		}
		if (dataUltimaAlteracao == null) {
			if (other.dataUltimaAlteracao != null) {
				return false;
			}
		} else if (!dataUltimaAlteracao.equals(other.dataUltimaAlteracao)) {
			return false;
		}
		if (genero == null) {
			if (other.genero != null) {
				return false;
			}
		} else if (!genero.equals(other.genero)) {
			return false;
		}
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		if (nome == null) {
			if (other.nome != null) {
				return false;
			}
		} else if (!nome.equals(other.nome)) {
			return false;
		}
		if (rg == null) {
			if (other.rg != null) {
				return false;
			}
		} else if (!rg.equals(other.rg)) {
			return false;
		}
		if (tipoPessoa == null) {
			if (other.tipoPessoa != null) {
				return false;
			}
		} else if (!tipoPessoa.equals(other.tipoPessoa)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "Pessoa [id=" + id + ", nome=" + nome + ", cpf=" + cpf + ", rg=" + rg + ", dataNascimento="
				+ dataNascimento + ", dataUltimaAlteracao=" + dataUltimaAlteracao + ", ativo=" + ativo + ", genero="
				+ genero + ", tipoPessoa=" + tipoPessoa + ", cliente=" + cliente + "]";
	}

	/**
	 * Retorna o Número de Celular do Usuário.
	 *
	 * @return
	 */
	public String getCelularContato() {

		String numeroCel = null;
		for (TelefonePessoa telefone : telefonesPessoais) {
			if (TipoTelefone.ID_TIPO_TELEFONE_CELULAR.equals(telefone.getTipoTelefone().getId())) {
				numeroCel = telefone.getNumero();
				break;
			}
		}

		return numeroCel;
	}

	/**
	 * Retorna o Email atual do Usuário.
	 *
	 * @return
	 */
	public String getEmailAtual() {

		String email = null;
		for (EmailPessoa emailPessoa : emailsPessoais) {
			if (emailPessoa.isEmailAtual()) {
				email = emailPessoa.getEmail();
				break;
			}
		}

		return email;
	}

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

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public Date getDataUltimaAlteracao() {
		return dataUltimaAlteracao;
	}

	public void setDataUltimaAlteracao(Date dataUltimaAlteracao) {
		this.dataUltimaAlteracao = dataUltimaAlteracao;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public Genero getGenero() {
		return genero;
	}

	public void setGenero(Genero genero) {
		this.genero = genero;
	}

	public TipoPessoa getTipoPessoa() {
		return tipoPessoa;
	}

	public void setTipoPessoa(TipoPessoa tipoPessoa) {
		this.tipoPessoa = tipoPessoa;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Set<EmailPessoa> getEmailsPessoais() {
		return emailsPessoais;
	}

	public void setEmailsPessoais(Set<EmailPessoa> emailsPessoais) {
		this.emailsPessoais = emailsPessoais;
	}

	public String getApelido() {
		return apelido;
	}

	public void setApelido(String apelido) {
		this.apelido = apelido;
	}

	public String getNomePai() {
		return nomePai;
	}

	public void setNomePai(String nomePai) {
		this.nomePai = nomePai;
	}

	public String getNomeMae() {
		return nomeMae;
	}

	public void setNomeMae(String nomeMae) {
		this.nomeMae = nomeMae;
	}

	public byte[] getStringFace() {
		return stringFace;
	}

	public void setStringFace(byte[] stringFace) {
		this.stringFace = stringFace;
	}

	public Set<Usuario> getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(Set<Usuario> usuarios) {
		this.usuarios = usuarios;
	}

	public Set<TelefonePessoa> getTelefonesPessoais() {
		return telefonesPessoais;
	}

	public void setTelefonesPessoais(Set<TelefonePessoa> telefonesPessoais) {
		this.telefonesPessoais = telefonesPessoais;
	}

	public Set<Endereco> getEnderecos() {
		return enderecos;
	}

	public void setEnderecos(Set<Endereco> enderecos) {
		this.enderecos = enderecos;
	}

	public void setTrocaVeiculos(Set<TrocaVeiculo> veiculos) {
		this.trocaVeiculos = veiculos;
	}

}
