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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "turno")
public class Turno extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 7314010304035718822L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_turno", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_turno", nullable = false)
	private String nome;
	
	
	@Column(name = "descricao_turno", nullable = true)
	private String descricao;
	
	
	@Column(name = "duracao_turno", nullable = false)
	private Integer duracaoTurno;
	
	
	@Temporal(TemporalType.TIME)
	@Column(name = "hr_inicio", nullable = false)
	private Date horaInicio;
	
	
	@Temporal(TemporalType.TIME)
	@Column(name = "hr_fim", nullable = true)
	private Date horaFim;
	
	
	@Column(name = "observacao", nullable = true)
	private String observacao;
	
	
	@Column(name = "ativo", nullable = false)
	private boolean ativo = true;
	
	@OneToMany(mappedBy = "turno", fetch = FetchType.LAZY)
	private Set<Funcionario> funcionarios = new HashSet<Funcionario>(0);

	@ManyToOne
	@JoinColumn(name = "id_contratante", nullable = true)
	private Contratante contratante;
	
	
	/** Método Construtor padrão. */
	public Turno() {
		super();
	}
	
	/**
	 * Método Construtor.
	 *  
	 * @param id
	 * @param descricao
	 * @param duracaoTurno
	 * @param horaInicio
	 * @param ativo
	 */
	public Turno(Long id, String nome, Integer duracaoTurno,
			Date horaInicio, boolean ativo) {
		this(id, nome, null, duracaoTurno, horaInicio, null, null, ativo);
	}
	
	/**
	 * Método Construtor.
	 *  
	 * @param id
	 * @param nome
	 * @param descricao
	 * @param duracaoTurno
	 * @param horaInicio
	 * @param horaFim
	 * @param observacao
	 * @param ativo
	 */
	public Turno(Long id, String nome, String descricao, Integer duracaoTurno,
			Date horaInicio, Date horaFim, String observacao, boolean ativo) {
		this();
		this.id = id;
		this.nome = nome;
		this.descricao = descricao;
		this.duracaoTurno = duracaoTurno;
		this.horaInicio = horaInicio;
		this.horaFim = horaFim;
		this.observacao = observacao;
		this.ativo = ativo;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (ativo ? 1231 : 1237);
		result = prime * result
				+ ((descricao == null) ? 0 : descricao.hashCode());
		result = prime * result
				+ ((duracaoTurno == null) ? 0 : duracaoTurno.hashCode());
		result = prime * result + ((horaFim == null) ? 0 : horaFim.hashCode());
		result = prime * result
				+ ((horaInicio == null) ? 0 : horaInicio.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Turno other = (Turno) obj;
		if (ativo != other.ativo)
			return false;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (duracaoTurno == null) {
			if (other.duracaoTurno != null)
				return false;
		} else if (!duracaoTurno.equals(other.duracaoTurno))
			return false;
		if (horaFim == null) {
			if (other.horaFim != null)
				return false;
		} else if (!horaFim.equals(other.horaFim))
			return false;
		if (horaInicio == null) {
			if (other.horaInicio != null)
				return false;
		} else if (!horaInicio.equals(other.horaInicio))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "Turno [id=" + id
				+ ", nome=" + nome
				+ ", descricao=" + descricao
				+ ", duracaoTurno=" + duracaoTurno
				+ ", horaInicio=" + horaInicio
				+ ", horaFim=" + horaFim
				+ ", observacao=" + observacao
				+ ", ativo=" + ativo
				+ "]";
	}
	
	
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
	
	public String getDescricao() {
		return descricao;
	}
	
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public Integer getDuracaoTurno() {
		return duracaoTurno;
	}
	
	public void setDuracaoTurno(Integer duracaoTurno) {
		this.duracaoTurno = duracaoTurno;
	}
	
	public Date getHoraInicio() {
		return horaInicio;
	}
	
	public void setHoraInicio(Date horaInicio) {
		this.horaInicio = horaInicio;
	}
	
	public Date getHoraFim() {
		return horaFim;
	}
	
	public void setHoraFim(Date horaFim) {
		this.horaFim = horaFim;
	}
	
	public String getObservacao() {
		return observacao;
	}
	
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	
	public boolean isAtivo() {
		return ativo;
	}
	
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	
	public Set<Funcionario> getFuncionarios() {
		return funcionarios;
	}
	
	public void setFuncionarios(Set<Funcionario> funcionarios) {
		this.funcionarios = funcionarios;
	}

	public Contratante getContratante() {
		return contratante;
	}

	public void setContratante(Contratante contratante) {
		this.contratante = contratante;
	}
	
}
