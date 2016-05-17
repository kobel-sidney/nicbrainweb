package br.com.kolss.model.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Embedded;
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
import javax.persistence.Transient;

import br.com.kolss.model.enuns.SituacaoEnum;

@Entity
@Table(name = "checklist")
public class Checklist extends AbstractEntity<Long>
		implements UsuarioResponsavel, ISituacao {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -3073932662877791527L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_checklist", nullable = false, unique = true)
	private Long id;
	
	@Column(name = "nome_checklist", nullable = false)
	private String nome;
	
	@Column(name = "descricao_checklist", nullable = true)
	private String descricao;
	
	@Column(name = "tempo_exec_estimado", nullable = false)
	private Integer tempoExecucaoEstimado;
	
	@Column(name = "tempo_toler_inicio", nullable = false)
	private Integer tempoToleranciaInicio;
	
	@Column(name = "tempo_toler_fim", nullable = false)
	private Integer tempoToleranciaFim;
	
	@Column(name = "recorrente", nullable = false)
	private boolean recorrente = false;
	
	@Column(name = "checklist_ronda", nullable = false)
	private boolean checklistRonda = false;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_inicio_previsto", nullable = true)
	private Date dataInicioPrevisto;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_fim_previsto", nullable = true)
	private Date dataFimPrevisto;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_inicio_realizado", nullable = true)
	private Date dataInicioRealizado;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_fim_realizado", nullable = true)
	private Date dataFimRealizado;
	
	@Embedded
	private CoordenadaGeografica coordenadas = new CoordenadaGeografica();
	
	@Column(name = "observacao", nullable = true)
	private String observacao;
	
	@Column(name = "ativo", nullable = false)
	private boolean ativo = false;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_status", nullable = false)
	private Status status = new Status();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_evento", nullable = false)
	private Evento evento = new Evento();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_usuario_responsavel", nullable = true)
	private Usuario usuarioResponsavel = new Usuario();
	
	@OneToMany(mappedBy = "checklist", fetch = FetchType.LAZY)
	private Set<ChecklistMensagem> checklistsMensagens =
			new HashSet<ChecklistMensagem>();
	
	@OneToMany(mappedBy = "checklist", fetch = FetchType.LAZY)
	private Set<OperacaoChecklist> operacoesChecklists =
			new HashSet<OperacaoChecklist>();
	
	@OneToMany(mappedBy = "checklist", fetch = FetchType.LAZY)
	private Set<ChecklistComentario> checklistsComentarios =
			new HashSet<ChecklistComentario>();
	
	@OneToMany(mappedBy = "checklist", fetch = FetchType.LAZY)
	private Set<Atividade> atividades = new HashSet<Atividade>();
	
	@Transient
	private SituacaoEnum situacao;

	
	/** Método Construtor padrão. */
	public Checklist() {
		super();
	}
	
	/**
	 * Métodos Construtor
	 * 
	 * @param id
	 * @param ativo
	 */
	public Checklist(Long id, String nome, Integer tempoExecucaoEstimado,
			Integer tempoToleranciaInicio, Integer tempoToleranciaFim,
			boolean recorrente, boolean checklistRonda, boolean ativo,
			Status status) {
		this(id, nome, null, tempoExecucaoEstimado, tempoToleranciaInicio,
				tempoToleranciaFim, recorrente, checklistRonda, null, null,
				null, null, null, null, null, ativo, status, null, null);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param nome
	 * @param descricao
	 * @param tempoExecucaoEstimado
	 * @param tempoToleranciaInicio
	 * @param tempoToleranciaFim
	 * @param recorrente
	 * @param checklistRonda
	 * @param dataInicioPrevisto
	 * @param dataFimPrevisto
	 * @param dataInicioRealizado
	 * @param dataFimRealizado
	 * @param latitude
	 * @param longitude
	 * @param observacao
	 * @param ativo
	 * @param status
	 * @param evento
	 * @param usuarioResponsavel
	 */
	public Checklist(Long id, String nome, String descricao,
			Integer tempoExecucaoEstimado, Integer tempoToleranciaInicio,
			Integer tempoToleranciaFim, boolean recorrente,
			boolean checklistRonda, Date dataInicioPrevisto,
			Date dataFimPrevisto, Date dataInicioRealizado,
			Date dataFimRealizado, String latitude, String longitude,
			String observacao, boolean ativo, Status status, Evento evento,
			Usuario usuarioResponsavel) {
		this();
		this.id = id;
		this.nome = nome;
		this.descricao = descricao;
		this.tempoExecucaoEstimado = tempoExecucaoEstimado;
		this.tempoToleranciaInicio = tempoToleranciaInicio;
		this.tempoToleranciaFim = tempoToleranciaFim;
		this.recorrente = recorrente;
		this.checklistRonda = checklistRonda;
		this.dataInicioPrevisto = dataInicioPrevisto;
		this.dataFimPrevisto = dataFimPrevisto;
		this.dataInicioRealizado = dataInicioRealizado;
		this.dataFimRealizado = dataFimRealizado;
		this.coordenadas.setLatitude(latitude);
		this.coordenadas.setLongitude(longitude);
		this.observacao = observacao;
		this.ativo = ativo;
		this.status = status;
		this.evento = evento;
		this.usuarioResponsavel = usuarioResponsavel;
	}
	
	
	@Override
	public boolean isNew() {
		return !isNumeroNatural(this.id);
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((descricao == null) ? 0 : descricao.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result
				+ ((tempoExecucaoEstimado == null) ? 0
						: tempoExecucaoEstimado.hashCode());
		result = prime * result
				+ ((tempoToleranciaFim == null) ? 0
						: tempoToleranciaFim.hashCode());
		result = prime * result
				+ ((tempoToleranciaInicio == null) ? 0
						: tempoToleranciaInicio.hashCode());
		result = prime * result + (ativo ? 1231 : 1237);
		result = prime * result
				+ ((dataFimPrevisto == null) ? 0 : dataFimPrevisto.hashCode());
		result = prime * result
				+ ((dataFimRealizado == null) ? 0 : dataFimRealizado.hashCode());
		result = prime * result
				+ ((dataInicioPrevisto == null) ? 0
						: dataInicioPrevisto.hashCode());
		result = prime * result
				+ ((dataInicioRealizado == null) ? 0 : dataInicioRealizado
						.hashCode());
		result = prime * result + ((evento == null) ? 0 : evento.hashCode());
		result = prime * result
				+ ((coordenadas == null) ? 0 : coordenadas.hashCode());
		result = prime * result
				+ ((observacao == null) ? 0 : observacao.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result
				+ ((usuarioResponsavel == null) ? 0
						: usuarioResponsavel.hashCode());
		result = prime * result + (checklistRonda ? 1231 : 1237);
		result = prime * result + (recorrente ? 1231 : 1237);
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		Checklist other = (Checklist) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (tempoExecucaoEstimado == null) {
			if (other.tempoExecucaoEstimado != null)
				return false;
		} else if (!tempoExecucaoEstimado.equals(other.tempoExecucaoEstimado))
			return false;
		if (tempoToleranciaFim == null) {
			if (other.tempoToleranciaFim != null)
				return false;
		} else if (!tempoToleranciaFim.equals(other.tempoToleranciaFim))
			return false;
		if (tempoToleranciaInicio == null) {
			if (other.tempoToleranciaInicio != null)
				return false;
		} else if (!tempoToleranciaInicio.equals(other.tempoToleranciaInicio))
			return false;
		if (ativo != other.ativo)
			return false;
		if (dataFimPrevisto == null) {
			if (other.dataFimPrevisto != null)
				return false;
		} else if (!dataFimPrevisto.equals(other.dataFimPrevisto))
			return false;
		if (dataFimRealizado == null) {
			if (other.dataFimRealizado != null)
				return false;
		} else if (!dataFimRealizado.equals(other.dataFimRealizado))
			return false;
		if (dataInicioPrevisto == null) {
			if (other.dataInicioPrevisto != null)
				return false;
		} else if (!dataInicioPrevisto.equals(other.dataInicioPrevisto))
			return false;
		if (dataInicioRealizado == null) {
			if (other.dataInicioRealizado != null)
				return false;
		} else if (!dataInicioRealizado.equals(other.dataInicioRealizado))
			return false;
		if (evento == null) {
			if (other.evento != null)
				return false;
		} else if (!evento.equals(other.evento))
			return false;
		if (coordenadas == null) {
			if (other.coordenadas != null)
				return false;
		} else if (!coordenadas.equals(other.coordenadas))
			return false;
		if (observacao == null) {
			if (other.observacao != null)
				return false;
		} else if (!observacao.equals(other.observacao))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (usuarioResponsavel == null) {
			if (other.usuarioResponsavel != null)
				return false;
		} else if (!usuarioResponsavel.equals(other.usuarioResponsavel))
			return false;
		if (checklistRonda != other.checklistRonda)
			return false;
		if (recorrente != other.recorrente)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Checklist [id=" + id
				+ ", nome=" + nome
				+ ", descricao=" + descricao
				+ ", tempoExecucaoEstimado=" + tempoExecucaoEstimado
				+ ", tempoToleranciaInicio=" + tempoToleranciaInicio
				+ ", tempoToleranciaFim=" + tempoToleranciaFim
				+ ", dataInicioPrevisto=" + dataInicioPrevisto
				+ ", dataFimPrevisto=" + dataFimPrevisto
				+ ", dataInicioRealizado=" + dataInicioRealizado
				+ ", dataFimRealizado=" + dataFimRealizado
				+ ", " + coordenadas
				+ ", observacao=" + observacao
				+ ", ativo=" + ativo
				+ ", status=" + status
				+ ", evento=" + evento
				+ ", usuarioResponsavel=" + usuarioResponsavel
				+ ", checklistRonda=" + checklistRonda
				+ ", recorrente=" + recorrente
				+ "]";
	}
	
	
	@Override
	public SituacaoEnum getSituacao() {
		return situacao;
	}
	
	@Override
	public void setSituacao(SituacaoEnum situacao) {
		this.situacao = situacao;
	}
	
	// TODO: Criar uma Interface para definir este comportamento!
	/**
	 * Retorna, em porcentagem, o tempo de execução deste checklist.<br>
	 * Caso o Checklist ainda não tenha sido encerrado, será utilizado o momento
	 * atual para se realizar o cálculo.
	 * 
	 * @return
	 */
	public float getPorcentagemTempoExecucaoDecorrido() {
		
		float porcentagem = 0;
		if (this.getTempoExecucaoEstimado() > 0) {
			porcentagem = (100 * this.getTempoExecucaoDecorrido())
					/ this.getTempoExecucaoEstimado();
		}
		
		return porcentagem;
	}
	
	// TODO: Criar uma Interface para definir este comportamento!
	/**
	 * Retorna, em porcentagem, o tempo de execução deste checklist.<br>
	 * Caso o valor seja maior que 100% (o tempo real é maior que o estimado,
	 * será retornado o valor 100%).
	 * 
	 * @return
	 */
	public float getPorcentagemTempoExecucao() {
		return Math.min(100, getPorcentagemTempoExecucaoDecorrido());
	}
	
	// TODO: Criar uma Interface para definir este comportamento!
	/**
	 * Retorna, em minutos, o tempo de execução decorrido.<br>
	 * Caso o Checklist ainda não tenha sido encerrado, será utilizado o momento
	 * atual para se realizar o cálculo.
	 * 
	 * Mais info:
	 * 	http://www.mkyong.com/java/how-to-calculate-date-time-difference-in-java/
	 * 
	 * @return
	 */
	public int getTempoExecucaoDecorrido() {
		int tempoDecorrido = 0;
		if (this.getDataInicioRealizado() != null) {
			
			Date dtFim = (this.getDataFimRealizado() == null) ? new Date()
					: this.getDataFimRealizado();

			try {
				long inicio = this.getDataInicioRealizado().getTime();
				long fim = dtFim.getTime();
				long diffMin = fim - inicio;
				tempoDecorrido = (int) diffMin / 1000 / 60;
			} catch (Exception e) {
				tempoDecorrido = 0;
			}
		}
		
		return tempoDecorrido;
	}
	
	/**
	 * Exibe a quantidade total de Atividades deste checklist.
	 * 
	 * @return
	 */
	public int getQuantidadeAtividades() {
		return this.getAtividades().size();
	}
	
	/**
	 * Exibe a quantidade total de Atividades Finalizadas deste checklist.
	 * 
	 * @return
	 */
	public int getQuantidadeAtividadesFinalizados() {
		return this.contarAtividadeStatus(StatusEnum.FINALIZADA.getId());
	}
	
	/**
	 * Exibe a quantidade total de Atividades Finalizadas deste checklist.
	 * 
	 * @return
	 */
	public int getQuantidadeAtividadesCancelados() {
		return this.contarAtividadeStatus(StatusEnum.CANCELADA.getId());
	}
	
	/**
	 * Exibe a quantidade total de Atividades Pausadas deste checklist.
	 * 
	 * @return
	 */
	public int getQuantidadeAtividadesPausados() {
		return this.contarAtividadeStatus(StatusEnum.PAUSADA.getId());
	}
	
	/**
	 * Exibe a quantidade total de Atividades Em Andamento deste checklist.
	 * 
	 * @return
	 */
	public int getQuantidadeAtividadesEmAndamento() {
		return this.contarAtividadeStatus(StatusEnum.EM_ANDAMENTO.getId());
	}
	
	/**
	 * Exibe a quantidade total de Atividades Agendadas deste checklist.
	 * 
	 * @return
	 */
	public int getQuantidadeAtividadesAgendadas() {
		return this.contarAtividadeStatus(StatusEnum.AGENDADO.getId());
	}
	
	/**
	 * Contabiliza a quantidade de Atividades que estão com o Status escolhido.
	 * 
	 * @param idStatus
	 * 
	 * @return
	 */
	private int contarAtividadeStatus(Serializable idStatus) {
		int qtd = 0;
		for (Atividade atividade : this.getAtividades()) {
			if (idStatus.equals(atividade.getStatus().getId())) {
				qtd++;
			}
		}
		
		return qtd;
	}
	
	/**
	 * Retorna a quantidade de Mensagens do tipo 'Alerta'.
	 * 
	 * @return
	 */
	public int getQuantidadeMensagemAlerta() {
		
		int qtd = 0;
		if (this.checklistsMensagens != null
				&& !this.checklistsMensagens.isEmpty()) {
			for (ChecklistMensagem mensagem : checklistsMensagens) {
				if (mensagem.getDataEnvio() != null
						&& TipoMensagem.ID_TIPO_ALERTA.equals(
								mensagem.getMensagem().getTipoMensagem().getId())) {
					qtd++;
				}
			}
		}
		
		return qtd;
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
	
	public Date getDataInicioPrevisto() {
		return dataInicioPrevisto;
	}
	
	public void setDataInicioPrevisto(Date dataInicioPrevisto) {
		this.dataInicioPrevisto = dataInicioPrevisto;
	}
	
	public Date getDataFimPrevisto() {
		return dataFimPrevisto;
	}
	
	public void setDataFimPrevisto(Date dataFimPrevisto) {
		this.dataFimPrevisto = dataFimPrevisto;
	}
	
	public Date getDataInicioRealizado() {
		return dataInicioRealizado;
	}
	
	public void setDataInicioRealizado(Date dataInicioRealizado) {
		this.dataInicioRealizado = dataInicioRealizado;
	}
	
	public Date getDataFimRealizado() {
		return dataFimRealizado;
	}
	
	public void setDataFimRealizado(Date dataFimRealizado) {
		this.dataFimRealizado = dataFimRealizado;
	}
	
	public String getLatitude() {
		
		if (coordenadas != null) {
			return this.coordenadas.getLatitude();
		} else {
			return null;
		}
		
	}
	
	public void setLatitude(String latitude) {
		
		if (coordenadas != null) {
			this.coordenadas.setLatitude(latitude);
		}
		
	}
	
	public String getLongitude() {
		
		if (coordenadas != null) {
			return this.coordenadas.getLongitude();
		} else {
			return null;
		}
		
	}
	
	public void setLongitude(String longitude) {
		
		if (coordenadas != null) {
			this.coordenadas.setLongitude(longitude);
		}
		
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
	
	public Status getStatus() {
		return status;
	}
	
	public void setStatus(Status status) {
		this.status = status;
	}
	
	public Evento getEvento() {
		return evento;
	}
	
	public void setEvento(Evento evento) {
		this.evento = evento;
	}
	
	public Usuario getUsuarioResponsavel() {
		return usuarioResponsavel;
	}
	
	public void setUsuarioResponsavel(Usuario usuarioResponsavel) {
		this.usuarioResponsavel = usuarioResponsavel;
	}
	
	public Set<ChecklistMensagem> getChecklistsMensagens() {
		return checklistsMensagens;
	}
	
	public void setChecklistsMensagens(Set<ChecklistMensagem> checklistsMensagens) {
		this.checklistsMensagens = checklistsMensagens;
	}
	
	public Set<OperacaoChecklist> getOperacoesChecklists() {
		return operacoesChecklists;
	}
	
	public void setOperacoesChecklists(Set<OperacaoChecklist> operacoesChecklists) {
		this.operacoesChecklists = operacoesChecklists;
	}
	
	public Set<ChecklistComentario> getChecklistsComentarios() {
		return checklistsComentarios;
	}
	
	public void setChecklistsComentarios(
			Set<ChecklistComentario> checklistsComentarios) {
		this.checklistsComentarios = checklistsComentarios;
	}
	
	public Set<Atividade> getAtividades() {
		return atividades;
	}
	
	public void setAtividades(Set<Atividade> atividades) {
		this.atividades = atividades;
	}
	
	public boolean isRecorrente() {
		return recorrente;
	}
	
	public void setRecorrente(boolean recorrente) {
		this.recorrente = recorrente;
	}
	
	public boolean isChecklistRonda() {
		return checklistRonda;
	}
	
	public void setChecklistRonda(boolean checklistRonda) {
		this.checklistRonda = checklistRonda;
	}
	
}
