package br.com.kolss.model.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "funcionario")
public class Funcionario extends AbstractEntity<Long> {

	/** serialVersionUID */
	private static final long serialVersionUID = -459622297536003458L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_funcionario", nullable = false, unique = true)
	private Long id;

	@ManyToOne(optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "id_usuario", nullable = false)
	private Usuario usuario = new Usuario();

	@ManyToOne(fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name = "id_turno", nullable = true)
	private Turno turno = new Turno();

	@ManyToOne(optional = true, fetch = FetchType.EAGER)
	@JoinColumn(name = "id_cargo", nullable = false)
	private Cargo cargo = new Cargo();

	@ManyToOne(optional = true, fetch = FetchType.EAGER)
	@JoinColumn(name = "id_departamento", nullable = true)
	private Departamento departamento = new Departamento();

	@ManyToOne(fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name = "id_funcionario_superior", nullable = true)
	private Funcionario funcionarioSuperior;

	@OneToMany(mappedBy = "funcionarioSuperior", fetch = FetchType.LAZY)
	private Set<Funcionario> funcionariosSubordinados = new HashSet<Funcionario>();

	@Column(nullable = false)
	private Boolean ativo;

	/** Método Construtor padrão. */
	public Funcionario() {
		super();
	}

	/**
	 * Método Construtor
	 *
	 * @param id
	 * @param usuario
	 */
	public Funcionario(Long id, Usuario usuario) {
		this(id, usuario, null, null, null, null);

	}

	/**
	 * Método Construtor
	 *
	 * @param id
	 * @param usuario
	 * @param turno
	 * @param cargo
	 * @param departamento
	 * @param funcionarioSuperior
	 */
	public Funcionario(Long id, Usuario usuario, Turno turno, Cargo cargo,
			Departamento departamento, Funcionario funcionarioSuperior) {
		this();
		this.id = id;
		this.usuario = usuario;
		this.turno = turno;
		this.cargo = cargo;
		this.departamento = departamento;
		this.funcionarioSuperior = funcionarioSuperior;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cargo == null) ? 0 : cargo.hashCode());
		result = prime * result
				+ ((departamento == null) ? 0 : departamento.hashCode());
		result = prime
				* result
				+ ((funcionarioSuperior == null) ? 0 : funcionarioSuperior
						.hashCode());
		result = prime
				* result
				+ ((funcionariosSubordinados == null) ? 0
						: funcionariosSubordinados.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((turno == null) ? 0 : turno.hashCode());
		result = prime * result + ((usuario == null) ? 0 : usuario.hashCode());
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
		Funcionario other = (Funcionario) obj;
		if (cargo == null) {
			if (other.cargo != null) {
				return false;
			}
		} else if (!cargo.equals(other.cargo)) {
			return false;
		}
		if (departamento == null) {
			if (other.departamento != null) {
				return false;
			}
		} else if (!departamento.equals(other.departamento)) {
			return false;
		}
		if (funcionarioSuperior == null) {
			if (other.funcionarioSuperior != null) {
				return false;
			}
		} else if (!funcionarioSuperior.equals(other.funcionarioSuperior)) {
			return false;
		}
		if (funcionariosSubordinados == null) {
			if (other.funcionariosSubordinados != null) {
				return false;
			}
		} else if (!funcionariosSubordinados
				.equals(other.funcionariosSubordinados)) {
			return false;
		}
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		if (turno == null) {
			if (other.turno != null) {
				return false;
			}
		} else if (!turno.equals(other.turno)) {
			return false;
		}
		if (usuario == null) {
			if (other.usuario != null) {
				return false;
			}
		} else if (!usuario.equals(other.usuario)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "Funcionario [id=" + id + ", usuario=" + usuario + ", turno="
				+ turno + ", cargo=" + cargo + ", departamento=" + departamento
				+ "]";
	}

	@Override
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Turno getTurno() {
		return turno;
	}

	public void setTurno(Turno turno) {
		this.turno = turno;
	}

	public Cargo getCargo() {
		return cargo;
	}

	public void setCargo(Cargo cargo) {
		this.cargo = cargo;
	}

	public Departamento getDepartamento() {
		return departamento;
	}

	public void setDepartamento(Departamento departamento) {
		this.departamento = departamento;
	}

	public Funcionario getFuncionarioSuperior() {
		return funcionarioSuperior;
	}

	public void setFuncionarioSuperior(Funcionario funcionarioSuperior) {
		this.funcionarioSuperior = funcionarioSuperior;
	}

	public Set<Funcionario> getFuncionariosSubordinados() {
		return funcionariosSubordinados;
	}

	public void setFuncionariosSubordinados(
			Set<Funcionario> funcionariosSubordinados) {
		this.funcionariosSubordinados = funcionariosSubordinados;
	}

	public Boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

}
