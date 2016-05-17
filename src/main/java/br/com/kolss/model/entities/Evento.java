package br.com.kolss.model.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.Type;

import br.com.kolss.model.enuns.SituacaoEnum;

@Entity
@Table(name = "evento")
public class Evento extends AbstractEntity<Long>implements ISituacao {

	/** serialVersionUID */
	private static final long serialVersionUID = 1644031917291817369L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_evento", nullable = false, unique = true)
	private Long id;

	@Column(name = "nome_evento", nullable = false)
	private String nome;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_inicio_evento", nullable = false)
	private Date dataInicio;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_fim_evento", nullable = false)
	private Date dataFim;

	@Column(name = "observacao", nullable = true)
	private String observacao;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_cadastro", nullable = true)
	private Date dataCadastro;

	@Column(name = "ativo", nullable = false)
	private boolean ativo = false;

	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_local", nullable = true)
	private Local local = new Local();

	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_usuario_responsavel", nullable = true)
	private Usuario usuarioResponsavel = new Usuario();

	@Column(name = "ronda", nullable = false)
	private boolean ronda;

	@OneToMany(mappedBy = "evento", fetch = FetchType.LAZY)
	private Set<Checklist> checklists = new HashSet<Checklist>();

	@ManyToMany(mappedBy = "eventosUsuario", cascade = CascadeType.ALL)
	private Set<Usuario> usuariosNoEvento = new HashSet<Usuario>();

	@OneToMany(mappedBy = "evento", fetch = FetchType.LAZY)
	private Set<Ocorrencia> ocorrencias = new HashSet<Ocorrencia>();

	@Transient
	private SituacaoEnum situacao;

	/** Método Construtor padrão */
	public Evento() {
		super();
	}

	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param nome
	 * @param dataInicio
	 * @param dataFim
	 * @param ativo
	 */
	public Evento(Long id, String nome, Date dataInicio, Date dataFim, boolean ativo) {
		this(id, nome, dataInicio, dataFim, null, null, null, null, ativo);
	}

	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param nome
	 * @param dataInicio
	 * @param dataFim
	 * @param observacao
	 * @param dataCadastro
	 * @param local
	 * @param usuarioResponsavel
	 * @param ativo
	 */
	public Evento(Long id, String nome, Date dataInicio, Date dataFim, String observacao, Date dataCadastro,
			Local local, Usuario usuarioResponsavel, boolean ativo) {
		this();
		this.id = id;
		this.nome = nome;
		this.dataInicio = dataInicio;
		this.dataFim = dataFim;
		this.observacao = observacao;
		this.dataCadastro = dataCadastro;
		this.local = local;
		this.usuarioResponsavel = usuarioResponsavel;
		this.ativo = ativo;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (ativo ? 1231 : 1237);
		result = prime * result + ((dataCadastro == null) ? 0 : dataCadastro.hashCode());
		result = prime * result + ((dataFim == null) ? 0 : dataFim.hashCode());
		result = prime * result + ((dataInicio == null) ? 0 : dataInicio.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((local == null) ? 0 : local.hashCode());
		result = prime * result + ((observacao == null) ? 0 : observacao.hashCode());
		result = prime * result + ((usuarioResponsavel == null) ? 0 : usuarioResponsavel.hashCode());
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
		Evento other = (Evento) obj;
		if (ativo != other.ativo)
			return false;
		if (dataCadastro == null) {
			if (other.dataCadastro != null)
				return false;
		} else if (!dataCadastro.equals(other.dataCadastro))
			return false;
		if (dataFim == null) {
			if (other.dataFim != null)
				return false;
		} else if (!dataFim.equals(other.dataFim))
			return false;
		if (dataInicio == null) {
			if (other.dataInicio != null)
				return false;
		} else if (!dataInicio.equals(other.dataInicio))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (local == null) {
			if (other.local != null)
				return false;
		} else if (!local.equals(other.local))
			return false;
		if (observacao == null) {
			if (other.observacao != null)
				return false;
		} else if (!observacao.equals(other.observacao))
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
		return "Evento [id=" + id + ", dataInicio=" + dataInicio + ", dataFim=" + dataFim + ", observacao=" + observacao
				+ ", dataCadastro=" + dataCadastro + ", ativo=" + ativo + ", local=" + local + ", usuarioResponsavel="
				+ usuarioResponsavel + "]";
	}

	/**
	 * 
	 * @return
	 */
	public int getQuantidadeChecklists() {
		return this.getChecklists().size();
	}

	/**
	 * Retorna a quantidade de Checklist com o Status <i>Finalizada</i>.
	 * 
	 * @return
	 */
	public int getQuantidadeChecklistsFinalizados() {
		return this.contarChecklistStatus(StatusEnum.FINALIZADA.getId());
	}

	/**
	 * Retorna a quantidade de Checklist com o Status <i>Cancelada</i>.
	 * 
	 * @return
	 */
	public int getQuantidadeChecklistsCancelados() {
		return this.contarChecklistStatus(StatusEnum.CANCELADA.getId());
	}

	/**
	 * Retorna a quantidade de Checklist com o Status <i>Pausada</i>.
	 * 
	 * @return
	 */
	public int getQuantidadeChecklistsPausados() {
		return this.contarChecklistStatus(StatusEnum.PAUSADA.getId());
	}

	/**
	 * Retorna a quantidade de Checklist com o Status <i>Em Andamento</i>.
	 * 
	 * @return
	 */
	public int getQuantidadeChecklistsEmAndamento() {
		return this.contarChecklistStatus(StatusEnum.EM_ANDAMENTO);
	}

	/**
	 * Retorna a quantidade de Checklist com o Status <i>Agendada</i>.
	 * 
	 * @return
	 */
	public int getQuantidadeChecklistsAgendadas() {
		return this.contarChecklistStatus(StatusEnum.AGENDADO.getId());
	}

	/**
	 * Realiza a contagem dos checklist que estão com o Status escolhido.
	 * 
	 * @param idStatus
	 * 
	 * @return
	 */
	private int contarChecklistStatus(Serializable idStatus) {
		int qtd = 0;
		for (Checklist checklist : this.getChecklists()) {
			if (idStatus.equals(checklist.getStatus().getId())) {
				qtd++;
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

	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public Local getLocal() {
		return local;
	}

	public void setLocal(Local local) {
		this.local = local;
	}

	public Usuario getUsuarioResponsavel() {
		return usuarioResponsavel;
	}

	public void setUsuarioResponsavel(Usuario usuarioResponsavel) {
		this.usuarioResponsavel = usuarioResponsavel;
	}

	public Set<Usuario> getUsuariosNoEvento() {
		return usuariosNoEvento;
	}

	public void setUsuariosNoEvento(Set<Usuario> usuariosNoEvento) {
		this.usuariosNoEvento = usuariosNoEvento;
	}

	public Set<Checklist> getChecklists() {
		return checklists;
	}

	public void setChecklists(Set<Checklist> checklists) {
		this.checklists = checklists;
	}

	public Set<Ocorrencia> getOcorrencias() {
		return ocorrencias;
	}

	public void setOcorrencias(Set<Ocorrencia> ocorrencias) {
		this.ocorrencias = ocorrencias;
	}

	public SituacaoEnum getSituacao() {
		return situacao;
	}

	public void setSituacao(SituacaoEnum situacao) {
		this.situacao = situacao;
	}

	public boolean isRonda() {
		return ronda;
	}

	public void setRonda(boolean ronda) {
		this.ronda = ronda;
	}

}
