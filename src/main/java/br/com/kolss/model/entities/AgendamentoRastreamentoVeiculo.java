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
@Table(name = "agendamento_rastreamento_veiculo")
public class AgendamentoRastreamentoVeiculo extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -6603164049551939017L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_agn_rast_veiculo", nullable = false, unique = true)
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
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_veiculo", nullable = false)
	private Veiculo veiculo = new Veiculo();
	
	@OneToMany(mappedBy = "agendamentoRastreamentoVeiculo", fetch = FetchType.LAZY)
	private Set<RastreamentoVeiculo> rastreamentosVeiculos =
			new HashSet<RastreamentoVeiculo>();
	
	
	/** Método Construtor padrao. */
	public AgendamentoRastreamentoVeiculo() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param dataInicioRastreamento
	 * @param dataFimRastreamento
	 * @param intervaloRastreamento
	 * @param veiculo
	 * @param ativo
	 */
	public AgendamentoRastreamentoVeiculo(Long id, Date dataInicioRastreamento,
			Date dataFimRastreamento,  Integer intervaloRastreamento,
			Veiculo veiculo, boolean ativo) {
		this(id, dataInicioRastreamento, dataFimRastreamento, null,
				intervaloRastreamento, veiculo, ativo);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param dataInicioRastreamento
	 * @param dataFimRastreamento
	 * @param dataCadastro
	 * @param intervaloRastreamento
	 * @param veiculo
	 * @param ativo
	 */
	public AgendamentoRastreamentoVeiculo(Long id, Date dataInicioRastreamento,
			Date dataFimRastreamento, Date dataCadastro,
			Integer intervaloRastreamento,
			Veiculo veiculo, boolean ativo) {
		this();
		this.id = id;
		this.dataInicioRastreamento = dataInicioRastreamento;
		this.dataFimRastreamento = dataFimRastreamento;
		this.dataCadastro = dataCadastro;
		this.intervaloRastreamento = intervaloRastreamento;
		this.ativo = ativo;
		this.veiculo = veiculo;
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
		result = prime * result + ((veiculo == null) ? 0 : veiculo.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		AgendamentoRastreamentoVeiculo other = (AgendamentoRastreamentoVeiculo) obj;
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
		if (veiculo == null) {
			if (other.veiculo != null)
				return false;
		} else if (!veiculo.equals(other.veiculo))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "AgendamentoRastreamentoVeiculo [id=" + id
				+ ", dataInicioRastreamento=" + dataInicioRastreamento
				+ ", dataFimRastreamento=" + dataFimRastreamento
				+ ", dataCadastro=" + dataCadastro
				+ ", intervaloRastreamento=" + intervaloRastreamento
				+ ", ativo=" + ativo
				+ ", veiculo=" + veiculo
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
	
	public Veiculo getVeiculo() {
		return veiculo;
	}
	
	public void setVeiculo(Veiculo veiculo) {
		this.veiculo = veiculo;
	}
	
}
