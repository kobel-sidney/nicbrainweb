package br.com.kolss.model.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "usuario", uniqueConstraints = @UniqueConstraint(columnNames = "email_usuario") )
public class Usuario extends AbstractEntity<Long> {

	/** serialVersionUID */
	private static final long serialVersionUID = -5411963157992471460L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_usuario", nullable = false, unique = true)
	private Long id;

	@Column(name = "nome_usuario", nullable = false)
	private String nome;

	@Column(name = "senha_usuario", nullable = false)
	private String senha;

	@Column(name = "email_usuario", nullable = false, unique = true)
	private String email;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_ultimo_login", nullable = true)
	private Date dataUltimoLogin;

	@Column(name = "ultimo_ip", nullable = true)
	private String ultimoIP;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_primeiro_acesso", nullable = true)
	private Date dataPrimeiroAcesso;

	@Column(name = "nr_tentativa_login", nullable = true)
	private Integer tentativasLogin;

	@Column(name = "usuario_bloqueado", nullable = true)
	private boolean bloqueado = false;

	@Temporal(TemporalType.TIMESTAMP)

	@Column(name = "data_cadastro", nullable = true)
	private Date dataCadastro;

	@Temporal(TemporalType.TIMESTAMP)

	@Column(name = "data_validade_senha", nullable = true)
	private Date dataValidadeSenha;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_validade_conta", nullable = true)
	private Date dataValidadeConta;

	@Column(name = "reset_senha", nullable = true)
	private boolean resetSenha = false;

	@ManyToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "id_perfil", nullable = false)
	private Perfil perfil;

	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_tipo_usuario", nullable = true)
	private TipoUsuario tipoUsuario;

	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_pessoa", nullable = true)
	private Pessoa pessoa = new Pessoa();

	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_cliente", nullable = true)
	private Cliente cliente;

	@Column(name = "ativo", nullable = false)
	private boolean ativo = true;

	@OneToMany(mappedBy = "usuarios", fetch = FetchType.LAZY)
	private Set<Grupo> grupos = new HashSet<Grupo>();

	@OneToMany(mappedBy = "usuario", fetch = FetchType.LAZY)
	private Set<AgendamentoRastreamentoUsuario> agendamentosRastreamentosUsuarios = new HashSet<AgendamentoRastreamentoUsuario>();

	@OneToMany(mappedBy = "usuarioResponsavel", fetch = FetchType.LAZY)
	private Set<Device> devices = new HashSet<Device>();

	@OneToMany(mappedBy = "usuarioResponsavel", fetch = FetchType.LAZY)
	private Set<Local> locais = new HashSet<Local>();

	@OneToMany(mappedBy = "usuarioResponsavel", fetch = FetchType.LAZY)
	private Set<Evento> eventos = new HashSet<Evento>();

	@OneToMany(mappedBy = "usuarioResponsavel", fetch = FetchType.LAZY)
	private Set<Setor> setores = new HashSet<Setor>();

	@OneToMany(mappedBy = "usuarioResponsavel", fetch = FetchType.LAZY)
	private Set<Checklist> checklists = new HashSet<Checklist>();

	@OneToMany(mappedBy = "usuarioResponsavel", fetch = FetchType.LAZY)
	private Set<Atividade> atividades = new HashSet<Atividade>();

	@OneToMany(mappedBy = "usuarioResponsavel", fetch = FetchType.LAZY)
	private Set<Ocorrencia> ocorrencias = new HashSet<Ocorrencia>();

	@OneToMany(mappedBy = "usuarioResponsavel", fetch = FetchType.LAZY)
	private Set<AtividadeOcorrencia> atividadesOcorrencias = new HashSet<AtividadeOcorrencia>();

	@ManyToMany
	@JoinTable(name = "usuario_regra", joinColumns = @JoinColumn(name = "id_usuario") , inverseJoinColumns = @JoinColumn(name = "id_regra") )
	private Set<Regra> regras = new HashSet<Regra>();

	@ManyToMany
	@JoinTable(name = "contexto", joinColumns = @JoinColumn(name = "id_usuario") , inverseJoinColumns = @JoinColumn(name = "id_evento") )
	private Set<Evento> eventosUsuario = new HashSet<Evento>();

	public Usuario(Long id) {
		super();
		this.id = id;
	}

	public Usuario() {
	}

	/**
	 * Método Construtor.
	 *
	 * @param id
	 * @param nome
	 * @param senha
	 * @param email
	 * @param perfil
	 * @param ativo
	 */
	public Usuario(Long id, String nome, String senha, String email, Perfil perfil, boolean ativo) {
		this(id, nome, senha, email, null, null, null, null, null, false, null, null, null, null, null, null, ativo);
	}

	/**
	 * Método Construtor.
	 *
	 * @param id
	 * @param nome
	 * @param senha
	 * @param email
	 * @param perfil
	 * @param dataUltimoLogin
	 * @param ultimoIP
	 * @param dataPrimeiroAcesso
	 * @param tentativasLogin
	 * @param bloqueado
	 * @param dataCadastro
	 * @param dataValidadeSenha
	 * @param dataValidadeConta
	 * @param tipoUsuario
	 * @param pessoa
	 * @param cliente
	 * @param ativo
	 */
	public Usuario(Long id, String nome, String senha, String email, Perfil perfil, Date dataUltimoLogin,
			String ultimoIP, Date dataPrimeiroAcesso, Integer tentativasLogin, boolean bloqueado, Date dataCadastro,
			Date dataValidadeSenha, Date dataValidadeConta, TipoUsuario tipoUsuario, Pessoa pessoa, Cliente cliente,
			boolean ativo) {
		this();
		this.id = id;
		this.nome = nome;
		this.senha = senha;
		this.email = email;
		this.perfil = perfil;
		this.dataUltimoLogin = dataUltimoLogin;
		this.ultimoIP = ultimoIP;
		this.dataPrimeiroAcesso = dataPrimeiroAcesso;
		this.tentativasLogin = tentativasLogin;
		this.bloqueado = bloqueado;
		this.dataCadastro = dataCadastro;
		this.dataValidadeSenha = dataValidadeSenha;
		this.dataValidadeConta = dataValidadeConta;
		this.tipoUsuario = tipoUsuario;
		this.pessoa = pessoa;
		this.cliente = cliente;
		this.ativo = ativo;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
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
		Usuario other = (Usuario) obj;
		if (email == null) {
			if (other.email != null) {
				return false;
			}
		} else if (!email.equals(other.email)) {
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
		return "Usuario [id=" + id + ", nome=" + nome + ", email=" + email + ", perfil=" + perfil + ", dataUltimoLogin="
				+ dataUltimoLogin + ", ultimoIP=" + ultimoIP + ", dataPrimeiroAcesso=" + dataPrimeiroAcesso
				+ ", tentativasLogin=" + tentativasLogin + ", bloqueado=" + bloqueado + ", dataCadastro=" + dataCadastro
				+ ", dataValidadeSenha=" + dataValidadeSenha + ", dataValidadeConta=" + dataValidadeConta
				+ ", resetSenha=" + resetSenha + ", tipoUsuario=" + tipoUsuario + ", pessoa=" + pessoa + ", cliente="
				+ cliente + ", ativo=" + ativo + "]";
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

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDataUltimoLogin() {
		return dataUltimoLogin;
	}

	public void setDataUltimoLogin(Date dataUltimoLogin) {
		this.dataUltimoLogin = dataUltimoLogin;
	}

	public String getUltimoIP() {
		return ultimoIP;
	}

	public void setUltimoIP(String ultimoIP) {
		this.ultimoIP = ultimoIP;
	}

	public Date getDataPrimeiroAcesso() {
		return dataPrimeiroAcesso;
	}

	public void setDataPrimeiroAcesso(Date dataPrimeiroAcesso) {
		this.dataPrimeiroAcesso = dataPrimeiroAcesso;
	}

	public Integer getTentativasLogin() {
		return tentativasLogin;
	}

	public void setTentativasLogin(Integer tentativasLogin) {
		this.tentativasLogin = tentativasLogin;
	}

	public boolean isBloqueado() {
		return bloqueado;
	}

	public void setBloqueado(boolean bloqueado) {
		this.bloqueado = bloqueado;
	}

	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public Date getDataValidadeSenha() {
		return dataValidadeSenha;
	}

	public void setDataValidadeSenha(Date dataValidadeSenha) {
		this.dataValidadeSenha = dataValidadeSenha;
	}

	public Date getDataValidadeConta() {
		return dataValidadeConta;
	}

	public void setDataValidadeConta(Date dataValidadeConta) {
		this.dataValidadeConta = dataValidadeConta;
	}

	public boolean isResetSenha() {
		return resetSenha;
	}

	public void setResetSenha(boolean resetSenha) {
		this.resetSenha = resetSenha;
	}

	public Perfil getPerfil() {
		return perfil;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}

	public TipoUsuario getTipoUsuario() {
		return tipoUsuario;
	}

	public void setTipoUsuario(TipoUsuario tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public Set<Grupo> getGruposUsuarios() {
		return grupos;
	}

	public void setGrupos(Set<Grupo> grupos) {
		this.grupos = grupos;
	}

	public Set<AgendamentoRastreamentoUsuario> getAgendamentosRastreamentosUsuarios() {
		return agendamentosRastreamentosUsuarios;
	}

	public void setAgendamentosRastreamentosUsuarios(
			Set<AgendamentoRastreamentoUsuario> agendamentosRastreamentosUsuarios) {
		this.agendamentosRastreamentosUsuarios = agendamentosRastreamentosUsuarios;
	}

	public Set<Device> getDevices() {
		return devices;
	}

	public void setDevices(Set<Device> devices) {
		this.devices = devices;
	}

	public Set<Local> getLocais() {
		return locais;
	}

	public void setLocais(Set<Local> locais) {
		this.locais = locais;
	}

	public Set<Regra> getRegras() {
		return regras;
	}

	public void setRegras(Set<Regra> regras) {
		this.regras = regras;
	}

	public Set<Evento> getEventos() {
		return eventos;
	}

	public void setEventos(Set<Evento> eventos) {
		this.eventos = eventos;
	}

	public Set<Evento> getEventosUsuario() {
		return eventosUsuario;
	}

	public void setEventosUsuario(Set<Evento> eventosUsuario) {
		this.eventosUsuario = eventosUsuario;
	}

	public Set<Setor> getSetores() {
		return setores;
	}

	public void setSetores(Set<Setor> setores) {
		this.setores = setores;
	}

	public Set<Checklist> getChecklists() {
		return checklists;
	}

	public void setChecklists(Set<Checklist> checklists) {
		this.checklists = checklists;
	}

	public Set<Atividade> getAtividades() {
		return atividades;
	}

	public void setAtividades(Set<Atividade> atividades) {
		this.atividades = atividades;
	}

	public Set<Ocorrencia> getOcorrencias() {
		return ocorrencias;
	}

	public void setOcorrencias(Set<Ocorrencia> ocorrencias) {
		this.ocorrencias = ocorrencias;
	}

	public Set<AtividadeOcorrencia> getAtividadesOcorrencias() {
		return atividadesOcorrencias;
	}

	public void setAtividadesOcorrencias(Set<AtividadeOcorrencia> atividadesOcorrencias) {
		this.atividadesOcorrencias = atividadesOcorrencias;
	}

	public String getDescricaoDevicesRegistrados() {

		String descricaoDevices = "";

		for (Device device : this.getDevices()) {
			descricaoDevices += device.getId() + ", ";
		}

		if (descricaoDevices != "") {
			descricaoDevices = descricaoDevices.substring(0, descricaoDevices.length() - 2);
		}

		return descricaoDevices;

	}

}
