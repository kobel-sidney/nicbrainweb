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
@Table(name = "agendamento_rastreamento_usuario")
public class AgendamentoRastreamentoUsuario extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -7563658017129497783L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_agn_rast_usuario", nullable = false, unique = true)
	private Long id;
	
	@Temporal(TemporalType.TIMESTAMP)
	
	@Column(name = "data_inicio_rastreamento", nullable = false)
	private Date dataInicioRastreamento;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_fim_rastreamento", nullable = false)
	private Date dataFimRastreamento;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_cadastro", nullable = true)
	private Date dataCadastro;
	
	
	@Column(name = "intervalo_rastreamento", nullable = false)
	private Integer intervaloRastreamento;
	
	
	@Column(name = "ativo", nullable = false)
	private boolean ativo = false;
	
	
	@Column(name = "rastreamento_por_rota", nullable = false)
	private boolean rastreamentoPorRota = false;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_usuario", nullable = false)
	private Usuario usuario = new Usuario();
	
	@OneToMany(mappedBy = "agendamentoRastreamentoUsuario", fetch = FetchType.LAZY)
	public Set<RastreamentoUsuario> rastreamentosUsuarios =
			new HashSet<RastreamentoUsuario>();
	
	
	/** Método Construtor padrão .*/
	public AgendamentoRastreamentoUsuario() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param dataInicioRastreamento
	 * @param dataFimRastreamento
	 * @param intervaloRastreamento
	 * @param rastreamentoPorRota
	 * @param usuario
	 * @param ativo
	 */
	public AgendamentoRastreamentoUsuario(Long id, Date dataInicioRastreamento,
			Date dataFimRastreamento, Integer intervaloRastreamento,
			boolean rastreamentoPorRota, Usuario usuario, boolean ativo) {
		this(id, dataInicioRastreamento, dataFimRastreamento, null,
				intervaloRastreamento, rastreamentoPorRota, usuario, ativo);
	}
	
	/**
	 * Método Construtor
	 *  
	 * @param id
	 * @param dataInicioRastreamento
	 * @param dataFimRastreamento
	 * @param dataCadastro
	 * @param intervaloRastreamento
	 * @param rastreamentoPorRota
	 * @param usuario
	 * @param ativo
	 */
	public AgendamentoRastreamentoUsuario(Long id, Date dataInicioRastreamento,
			Date dataFimRastreamento, Date dataCadastro,
			Integer intervaloRastreamento, boolean rastreamentoPorRota,
			Usuario usuario, boolean ativo) {
		this();
		this.id = id;
		this.dataInicioRastreamento = dataInicioRastreamento;
		this.dataFimRastreamento = dataFimRastreamento;
		this.dataCadastro = dataCadastro;
		this.intervaloRastreamento = intervaloRastreamento;
		this.ativo = ativo;
		this.rastreamentoPorRota = rastreamentoPorRota;
		this.usuario = usuario;
	}
	
	
	@Override
	public boolean isNew() {
		return !isNumeroNatural(this.id);
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (ativo ? 1231 : 1237);
		result = prime * result
				+ ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((dataCadastro == null) ? 0 : dataCadastro.hashCode());
		result = prime * result
				+ ((dataFimRastreamento == null) ? 0
						: dataFimRastreamento.hashCode());
		result = prime * result
				+ ((dataInicioRastreamento == null) ? 0
						: dataInicioRastreamento.hashCode());
		result = prime * result
				+ ((intervaloRastreamento == null) ? 0
						: intervaloRastreamento.hashCode());
		result = prime * result + (rastreamentoPorRota ? 1231 : 1237);
		result = prime * result + ((usuario == null) ? 0 : usuario.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		AgendamentoRastreamentoUsuario other = (AgendamentoRastreamentoUsuario) obj;
		if (ativo != other.ativo)
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (dataCadastro == null) {
			if (other.dataCadastro != null)
				return false;
		} else if (!dataCadastro.equals(other.dataCadastro))
			return false;
		if (dataFimRastreamento == null) {
			if (other.dataFimRastreamento != null)
				return false;
		} else if (!dataFimRastreamento.equals(other.dataFimRastreamento))
			return false;
		if (dataInicioRastreamento == null) {
			if (other.dataInicioRastreamento != null)
				return false;
		} else if (!dataInicioRastreamento.equals(other.dataInicioRastreamento))
			return false;
		if (intervaloRastreamento == null) {
			if (other.intervaloRastreamento != null)
				return false;
		} else if (!intervaloRastreamento.equals(other.intervaloRastreamento))
			return false;
		if (rastreamentoPorRota != other.rastreamentoPorRota)
			return false;
		if (usuario == null) {
			if (other.usuario != null)
				return false;
		} else if (!usuario.equals(other.usuario))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "AgendamentoRastreamentoUsuario [id=" + id
				+ ", dataInicioRastreamento=" + dataInicioRastreamento
				+ ", dataFimRastreamento=" + dataFimRastreamento
				+ ", dataCadastro=" + dataCadastro
				+ ", intervaloRastreamento=" + intervaloRastreamento
				+ ", ativo=" + ativo
				+ ", rastreamentoPorRota=" + rastreamentoPorRota
				+ ", usuario=" + usuario
				+ "]";
	}
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Date getDataInicioRastreamento() {
		return dataInicioRastreamento;
	}
	
	public void setDataInicioRastreamento(Date dataInicioRastreamento) {
		this.dataInicioRastreamento = dataInicioRastreamento;
	}
	
	public Date getDataFimRastreamento() {
		return dataFimRastreamento;
	}
	
	public void setDataFimRastreamento(Date dataFimRastreamento) {
		this.dataFimRastreamento = dataFimRastreamento;
	}
	
	public Date getDataCadastro() {
		return dataCadastro;
	}
	
	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	
	public Integer getIntervaloRastreamento() {
		return intervaloRastreamento;
	}
	
	public void setIntervaloRastreamento(Integer intervaloRastreamento) {
		this.intervaloRastreamento = intervaloRastreamento;
	}
	
	public boolean isAtivo() {
		return ativo;
	}
	
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	
	public boolean isRastreamentoPorRota() {
		return rastreamentoPorRota;
	}
	
	public void setRastreamentoPorRota(boolean rastreamentoPorRota) {
		this.rastreamentoPorRota = rastreamentoPorRota;
	}
	
	public Usuario getUsuario() {
		return usuario;
	}
	
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public Set<RastreamentoUsuario> getRastreamentosUsuarios() {
		return rastreamentosUsuarios;
	}
	
	public void setRastreamentosUsuarios(
			Set<RastreamentoUsuario> rastreamentosPessoas) {
		this.rastreamentosUsuarios = rastreamentosPessoas;
	}
	
}
