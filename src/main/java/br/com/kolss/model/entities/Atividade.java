package br.com.kolss.model.entities;

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
@Table(name = "atividade")
public class Atividade extends AbstractEntity<Long> implements UsuarioResponsavel,ISituacao {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -4195314326497524023L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_atividade", nullable = false, unique = true)
	private Long id;
	
	@Column(name = "nome_atividade", nullable = false)
	private String nome;
	
	@Column(name = "descricao_atividade", nullable = true)
	private String descricao;
	
	@Column(name = "tempo_exec_estimado", nullable = false)
	private Integer tempoExecucaoEstimado;
	
	@Column(name = "tempo_toler_inicio", nullable = false)
	private Integer tempoToleranciaInicio;
	
	@Column(name = "tempo_toler_fim", nullable = false)
	private Integer tempoToleranciaFim;
	
	
	@Column(name = "nr_item", nullable = false)
	private Integer numeroItem;
	
	@Column(name = "tempo_toler_antec", nullable = true)
	private Integer tempoToleranciaAntecipado;
		
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
	
	@Column(name = "distancia_limite", nullable = true)
	private Integer distanciaLimite;
	
	@Column(name = "observacao", nullable = true)
	private String observacao;
	
	@Column(name = "campo_check", nullable = false)
	private boolean campoCheck = false;
	
	@Column(name = "ativo", nullable = false)
	private boolean ativo = false;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_status", nullable = false)
	private Status status = new Status();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_usuario_responsavel", nullable = true)
	private Usuario usuarioResponsavel = new Usuario();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_checklist", nullable = true)
	private Checklist checklist = new Checklist();
	
	@OneToMany(mappedBy = "atividade", fetch = FetchType.LAZY)
	private Set<OperacaoAtividade> operacoesAtividaes =
		new HashSet<OperacaoAtividade>();
	
	@OneToMany(mappedBy = "atividade", fetch = FetchType.LAZY)
	private Set<AtividadeMensagem> atividadesMensagens =
			new HashSet<AtividadeMensagem>();
	
	@OneToMany(mappedBy = "atividade", fetch = FetchType.LAZY)
	private Set<AtividadeComentario> atividadesComentarios =
			new HashSet<AtividadeComentario>();
	
	@OneToMany(mappedBy = "atividade", fetch = FetchType.LAZY)
	private Set<Ocorrencia> ocorrencias = new HashSet<Ocorrencia>();
	
	@Transient
	private SituacaoEnum situacao;
	
	@Column(name = "id_perfil_formulario", nullable = true)
	private Long idPerfilFormulario;
	
	
	/** Método Construtor padrão. */
	public Atividade() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param numeroItem
	 * @param campoCheck
	 * @param status
	 */
	public Atividade(Long id, String nome, Integer numeroItem,
			Integer tempoExecucaoEstimado, Integer tempoToleranciaInicio,
			Integer tempoToleranciaFim, boolean campoCheck, Status status,
			boolean ativo) {
		this(id, nome, null, numeroItem, null, tempoExecucaoEstimado,
				tempoToleranciaInicio, tempoToleranciaFim, null, null, null,
				null, null, null, null, null, campoCheck, status, null, null,
				ativo);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param numeroItem
	 * @param tempoToleranciaAntecipado
	 * @param dataInicioPrevisto
	 * @param dataFimPrevisto
	 * @param dataInicioRealizado
	 * @param dataFimRealizado
	 * @param latitude
	 * @param longitude
	 * @param distanciaLimite
	 * @param observacao
	 * @param campoCheck
	 * @param status
	 * @param formulario
	 * @param usuarioResponsavel
	 * @param checklist
	 * @param ativo
	 */
	public Atividade(Long id, String nome, String descricao,
			Integer numeroItem, Integer tempoToleranciaAntecipado, 
			Integer tempoExecucaoEstimado, Integer tempoToleranciaInicio,
			Integer tempoToleranciaFim, Date dataInicioPrevisto,
			Date dataFimPrevisto, Date dataInicioRealizado,
			Date dataFimRealizado, String latitude, String longitude,
			Integer distanciaLimite, String observacao, boolean campoCheck,
			Status status, Usuario usuarioResponsavel,
			Checklist checklist, boolean ativo) {
		this();
		this.id = id;
		this.nome = nome;
		this.descricao = descricao;
		this.tempoExecucaoEstimado = tempoExecucaoEstimado;
		this.tempoToleranciaInicio = tempoToleranciaInicio;
		this.tempoToleranciaFim = tempoToleranciaFim;
		this.numeroItem = numeroItem;
		this.tempoToleranciaAntecipado = tempoToleranciaAntecipado;
		this.dataInicioPrevisto = dataInicioPrevisto;
		this.dataFimPrevisto = dataFimPrevisto;
		this.dataInicioRealizado = dataInicioRealizado;
		this.dataFimRealizado = dataFimRealizado;
		this.coordenadas.setLatitude(latitude);
		this.coordenadas.setLongitude(longitude);
		this.observacao = observacao;
		this.campoCheck = campoCheck;
		this.status = status;
		this.usuarioResponsavel = usuarioResponsavel;
		this.checklist = checklist;
		this.ativo = ativo;
	}
	
	
	public Atividade(Long  id) {
		this.id =id;
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
		result = prime * result + (campoCheck ? 1231 : 1237);
		result = prime * result
				+ ((checklist == null) ? 0 : checklist.hashCode());
		result = prime * result
				+ ((dataFimPrevisto == null) ? 0 : dataFimPrevisto.hashCode());
		result = prime * result
				+ ((dataFimRealizado == null) ? 0 : dataFimRealizado.hashCode());
		result = prime * result
				+ ((dataInicioPrevisto == null) ? 0
						: dataInicioPrevisto.hashCode());
		result = prime * result
				+ ((dataInicioRealizado == null) ? 0
						: dataInicioRealizado.hashCode());
		result = prime * result
				+ ((coordenadas == null) ? 0 : coordenadas.hashCode());
		result = prime * result
				+ ((numeroItem == null) ? 0 : numeroItem.hashCode());
		result = prime * result
				+ ((observacao == null) ? 0 : observacao.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result
				+ ((tempoToleranciaAntecipado == null) ? 0
						: tempoToleranciaAntecipado.hashCode());
		result = prime * result
				+ ((usuarioResponsavel == null) ? 0
						: usuarioResponsavel.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		Atividade other = (Atividade) obj;
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
		if (campoCheck != other.campoCheck)
			return false;
		if (checklist == null) {
			if (other.checklist != null)
				return false;
		} else if (!checklist.equals(other.checklist))
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
		if (coordenadas == null) {
			if (other.coordenadas != null)
				return false;
		} else if (!coordenadas.equals(other.coordenadas))
			return false;
		if (numeroItem == null) {
			if (other.numeroItem != null)
				return false;
		} else if (!numeroItem.equals(other.numeroItem))
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
		if (tempoToleranciaAntecipado == null) {
			if (other.tempoToleranciaAntecipado != null)
				return false;
		} else if (!tempoToleranciaAntecipado
				.equals(other.tempoToleranciaAntecipado))
			return false;
		if (usuarioResponsavel == null) {
			if (other.usuarioResponsavel != null)
				return false;
		} else if (!usuarioResponsavel.equals(other.usuarioResponsavel))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Atividade [id=" + id
				+ ", nome=" + nome
				+ ", descricao=" + descricao
				+ ", tempoExecucaoEstimado=" + tempoExecucaoEstimado
				+ ", tempoToleranciaInicio=" + tempoToleranciaInicio
				+ ", tempoToleranciaFim=" + tempoToleranciaFim
				+ ", numeroItem=" + numeroItem
				+ ", tempoToleranciaAntecipado=" + tempoToleranciaAntecipado
				+ ", dataInicioPrevisto=" + dataInicioPrevisto
				+ ", dataFimPrevisto=" + dataFimPrevisto
				+ ", dataInicioRealizado=" + dataInicioRealizado
				+ ", dataFimRealizado=" + dataFimRealizado
				+ ", " + coordenadas
				+ ", distanciaLimite=" + distanciaLimite
				+ ", observacao=" + observacao
				+ ", campoCheck=" + campoCheck
				+ ", status=" + status
				+ ", usuarioResponsavel=" + usuarioResponsavel
				+ ", checklist=" + checklist
				+ ", ativo=" + ativo
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
	
	// TODO: Criar uma Interface para definir este comportamento!
	/**
	 * Retorna a quantidade de Mensagens do tipo 'Alerta'.
	 * 
	 * @return
	 */
	public int getQuantidadeMensagemAlerta() {
		
		int qtd = 0;
		if (this.atividadesMensagens != null && !this.atividadesMensagens.isEmpty()) {
			for (AtividadeMensagem mensagem : this.atividadesMensagens) {
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
	
	public Integer getNumeroItem() {
		return numeroItem;
	}
	
	public void setNumeroItem(Integer numeroItem) {
		this.numeroItem = numeroItem;
	}
	
	public Integer getTempoToleranciaAntecipado() {
		return tempoToleranciaAntecipado;
	}
	
	public void setTempoToleranciaAntecipado(Integer tempoToleranciaAntecipado) {
		this.tempoToleranciaAntecipado = tempoToleranciaAntecipado;
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
		return (this.coordenadas == null ? null : this.coordenadas.getLatitude());
	}
	
	public void setLatitude(String latitude) {
		this.coordenadas.setLatitude(latitude);
	}
	
	public String getLongitude() {
		return (this.coordenadas == null ? null : this.coordenadas.getLongitude());
	}
	
	public void setLongitude(String longitude) {
		this.coordenadas.setLongitude(longitude);
	}
	
	public Integer getDistanciaLimite() {
		return distanciaLimite;
	}
	
	public void setDistanciaLimite(Integer distanciaLimite) {
		this.distanciaLimite = distanciaLimite;
	}
	
	public String getObservacao() {
		return observacao;
	}
	
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	
	public boolean isCampoCheck() {
		return campoCheck;
	}
	
	public void setCampoCheck(boolean campoCheck) {
		this.campoCheck = campoCheck;
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
	
	public Usuario getUsuarioResponsavel() {
		return usuarioResponsavel;
	}
	
	public void setUsuarioResponsavel(Usuario usuarioResponsavel) {
		this.usuarioResponsavel = usuarioResponsavel;
	}
	
	public Checklist getChecklist() {
		return checklist;
	}
	
	public void setChecklist(Checklist checklist) {
		this.checklist = checklist;
	}
	
	public Set<OperacaoAtividade> getOperacoesAtividaes() {
		return operacoesAtividaes;
	}
	
	public void setOperacoesAtividaes(Set<OperacaoAtividade> operacoesAtividaes) {
		this.operacoesAtividaes = operacoesAtividaes;
	}
	
	public Set<AtividadeMensagem> getAtividadesMensagens() {
		return atividadesMensagens;
	}
	
	public void setAtividadesMensagens(Set<AtividadeMensagem> atividadesMensagens) {
		this.atividadesMensagens = atividadesMensagens;
	}
	
	public Set<AtividadeComentario> getAtividadesComentarios() {
		return atividadesComentarios;
	}
	
	public void setAtividadesComentarios(
			Set<AtividadeComentario> atividadesComentarios) {
		this.atividadesComentarios = atividadesComentarios;
	}
	
	public Set<Ocorrencia> getOcorrencias() {
		return ocorrencias;
	}
	
	public void setOcorrencias(Set<Ocorrencia> ocorrencias) {
		this.ocorrencias = ocorrencias;
	}

	public Long getIdPerfilFormulario() {
		return idPerfilFormulario;
	}

	public void setIdPerfilFormulario(Long idPerfilFormulario) {
		this.idPerfilFormulario = idPerfilFormulario;
	}
}
