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
@Table(name = "atividade_ocorrencia")
public class AtividadeOcorrencia extends AbstractEntity<Long>
		implements UsuarioResponsavel {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -1291020353814274997L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_atividade_ocorrencia", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_atividade_ocorrencia", nullable = false)
	private String nome;
	
	
	@Column(name = "descricao_atividade_ocorrencia", nullable = true)
	private String descricao;
	
	
	@Column(name = "nr_item", nullable = false)
	private Integer numeroItem;
	
	
	@Column(name = "tempo_exec_estimado", nullable = false)
	private Integer tempoExecucaoEstimado;
	
	
	@Column(name = "tempo_toler_inicio", nullable = false)
	private Integer tempoToleranciaInicio;
	
	
	@Column(name = "tempo_toler_fim", nullable = false)
	private Integer tempoToleranciaFim;
	
	@Temporal(TemporalType.TIMESTAMP)
	
	@Column(name = "data_inicio_atividade", nullable = false)
	private Date dataInicio;
	
	@Temporal(TemporalType.TIMESTAMP)
	
	@Column(name = "data_fim_atividade", nullable = true)
	private Date dataFim;
	
	
	@Column(name = "observacao", nullable = true)
	private String observacao;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_status", nullable = false)
	private Status status = new Status();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_ocorrencia", nullable = false)
	private Ocorrencia ocorrencia = new Ocorrencia();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_usuario_responsavel", nullable = false)
	private Usuario usuarioResponsavel = new Usuario();
	
	@OneToMany(mappedBy = "atividadeOcorrencia", fetch = FetchType.LAZY)
	private Set<OperacaoAtividadeOcorrencia> operacoesAtividadesOcorrencias =
		new HashSet<OperacaoAtividadeOcorrencia>();
	
	
	/** Método Construtor padrão. */
	public AtividadeOcorrencia() {
		super();
	}
	
	/**
	* Método Construtor
	 * 
	 * @param id
	 * @param nome
	 * @param numeroItem
	 * @param tempoExecucaoEstimado
	 * @param tempoToleranciaInicio
	 * @param tempoToleranciaFim
	 * @param dataInicio
	 * @param status
	 * @param ocorrencia
	 * @param usuarioResponsavel
	 */
	public AtividadeOcorrencia(Long id, String nome, Integer numeroItem,
			Integer tempoExecucaoEstimado, Integer tempoToleranciaInicio,
			Integer tempoToleranciaFim, Date dataInicio, Status status,
			Ocorrencia ocorrencia, Usuario usuarioResponsavel) {
		this(id, nome, null, numeroItem, tempoExecucaoEstimado,
				tempoToleranciaInicio, tempoToleranciaFim, dataInicio, null,
				null, status, ocorrencia, usuarioResponsavel);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param nome
	 * @param descricao
	 * @param numeroItem
	 * @param tempoExecucaoEstimado
	 * @param tempoToleranciaInicio
	 * @param tempoToleranciaFim
	 * @param dataInicio
	 * @param dataFim
	 * @param observacao
	 * @param status
	 * @param ocorrencia
	 * @param usuarioResponsavel
	 */
	public AtividadeOcorrencia(Long id, String nome, String descricao,
			Integer numeroItem, Integer tempoExecucaoEstimado,
			Integer tempoToleranciaInicio, Integer tempoToleranciaFim,
			Date dataInicio, Date dataFim, String observacao, Status status,
			Ocorrencia ocorrencia, Usuario usuarioResponsavel) {
		this();
		this.id = id;
		this.nome = nome;
		this.descricao = descricao;
		this.numeroItem = numeroItem;
		this.tempoExecucaoEstimado = tempoExecucaoEstimado;
		this.tempoToleranciaInicio = tempoToleranciaInicio;
		this.tempoToleranciaFim = tempoToleranciaFim;
		this.dataInicio = dataInicio;
		this.dataFim = dataFim;
		this.observacao = observacao;
		this.status = status;
		this.ocorrencia = ocorrencia;
		this.usuarioResponsavel = usuarioResponsavel;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((numeroItem == null) ? 0 : numeroItem.hashCode());
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
		AtividadeOcorrencia other = (AtividadeOcorrencia) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (numeroItem == null) {
			if (other.numeroItem != null)
				return false;
		} else if (!numeroItem.equals(other.numeroItem))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "AtividadeOcorrencia [id=" + id
				+ ", nome=" + nome
				+ ", descricao=" + descricao
				+ ", numeroItem= " + numeroItem
				+ ", tempoExecucaoEstimado=" + tempoExecucaoEstimado
				+ ", tempoToleranciaInicio=" + tempoToleranciaInicio
				+ ", tempoToleranciaFim=" + tempoToleranciaFim
				+ ", dataInicio=" + dataInicio
				+ ", dataFim=" + dataFim
				+ ", observacao=" + observacao
				+ ", status=" + status
				+ ", ocorrencia=" + ocorrencia
				+ ", usuarioResponsavel=" + usuarioResponsavel
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
	
	public Integer getNumeroItem() {
		return numeroItem;
	}

	public void setNumeroItem(Integer numeroItem) {
		this.numeroItem = numeroItem;
	}

	public Integer getTempoExecucaoEstimado() {
		return tempoExecucaoEstimado;
	}
	
	public void setTempoExecucaoEstimado(Integer tempoExecucaoEstimado) {
		this.tempoExecucaoEstimado = tempoExecucaoEstimado;
	}
	
	public Integer getTempoToleranciaInicio() {
		return tempoToleranciaInicio;
	}
	
	public void setTempoToleranciaInicio(Integer tempoToleranciaInicio) {
		this.tempoToleranciaInicio = tempoToleranciaInicio;
	}
	
	public Integer getTempoToleranciaFim() {
		return tempoToleranciaFim;
	}
	
	public void setTempoToleranciaFim(Integer tempoToleranciaFim) {
		this.tempoToleranciaFim = tempoToleranciaFim;
	}
	
	public Date getDataInicio() {
		return dataInicio;
	}
	
	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}
	
	public Date getDataFim() {
		return dataFim;
	}
	
	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}
	
	public String getObservacao() {
		return observacao;
	}
	
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	
	public Status getStatus() {
		return status;
	}
	
	public void setStatus(Status status) {
		this.status = status;
	}
	
	public Ocorrencia getOcorrencia() {
		return ocorrencia;
	}
	
	public void setOcorrencia(Ocorrencia ocorrencia) {
		this.ocorrencia = ocorrencia;
	}
	
	public Usuario getUsuarioResponsavel() {
		return usuarioResponsavel;
	}
	
	public void setUsuarioResponsavel(Usuario usuarioResponsavel) {
		this.usuarioResponsavel = usuarioResponsavel;
	}

	public Set<OperacaoAtividadeOcorrencia> getOperacoesAtividadesOcorrencias() {
		return operacoesAtividadesOcorrencias;
	}

	public void setOperacoesAtividadesOcorrencias(
			Set<OperacaoAtividadeOcorrencia> operacoesAtividadesOcorrencias) {
		this.operacoesAtividadesOcorrencias = operacoesAtividadesOcorrencias;
	}
	
}
