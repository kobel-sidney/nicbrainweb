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
@Table(name = "atividade_mensagem")
public class AtividadeMensagem extends AbstractEntity<Long> implements IMensagemAssociada {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -4518629685813243719L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_atv_mgs", nullable = false, unique = true)
	private Long id;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_envio", nullable = true)
	private Date dataEnvio;
	
	@Column(name = "tempo_escala", nullable = false)
	private Integer tempoEscala;
	
	@Column(name = "ativo", nullable = false)
	private boolean ativo = false;	
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_mensagem", nullable = true)
	private Mensagem mensagem = new Mensagem();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_atividade", nullable = true)
	private Atividade atividade = new Atividade();
	
	@OneToMany(mappedBy = "atividadeMensagem", fetch = FetchType.LAZY)
	private Set<AtividadeMensagemGrupo> atividadesMensagensGrupos =
			new HashSet<AtividadeMensagemGrupo>();
	
	
	/** Método Construtor padrão. */
	public AtividadeMensagem() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param tempoEscala
	 * @param ativo
	 */
	public AtividadeMensagem(Long id, Integer tempoEscala, boolean ativo) {
		this(id, null, tempoEscala, null, null, ativo);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param dataEnvio
	 * @param tempoEscala
	 * @param mensagem
	 * @param atividade
	 * @param ativo
	 */
	public AtividadeMensagem(Long id, Date dataEnvio, Integer tempoEscala,
			Mensagem mensagem, Atividade atividade, boolean ativo) {
		this();
		this.id = id;
		this.dataEnvio = dataEnvio;
		this.tempoEscala = tempoEscala;
		this.mensagem = mensagem;
		this.atividade = atividade;
		this.ativo = ativo;
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
				+ ((atividade == null) ? 0 : atividade.hashCode());
		result = prime * result
				+ ((dataEnvio == null) ? 0 : dataEnvio.hashCode());
		result = prime * result
				+ ((mensagem == null) ? 0 : mensagem.hashCode());
		result = prime * result
				+ ((tempoEscala == null) ? 0 : tempoEscala.hashCode());
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
		AtividadeMensagem other = (AtividadeMensagem) obj;
		if (atividade == null) {
			if (other.atividade != null)
				return false;
		} else if (!atividade.equals(other.atividade))
			return false;
		if (dataEnvio == null) {
			if (other.dataEnvio != null)
				return false;
		} else if (!dataEnvio.equals(other.dataEnvio))
			return false;
		if (mensagem == null) {
			if (other.mensagem != null)
				return false;
		} else if (!mensagem.equals(other.mensagem))
			return false;
		if (tempoEscala == null) {
			if (other.tempoEscala != null)
				return false;
		} else if (!tempoEscala.equals(other.tempoEscala))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "AtividadeMensagem [id=" + id
				+ ", dataEnvio=" + dataEnvio
				+ ", tempoEscala=" + tempoEscala
				+ ", mensagem=" + mensagem
				+ ", atividade=" + atividade
				+ ", ativo=" + ativo
				+ "]";
	}
	
	
	@Override
	public Set<IMensagemGrupo> getMensagensGrupos() {
		return new HashSet<IMensagemGrupo>(this.atividadesMensagensGrupos);
	}
	
	@Override
	public void setIMensagensGrupos(Set<IMensagemGrupo> iMensagensGrupos) {
		this.atividadesMensagensGrupos = new HashSet<AtividadeMensagemGrupo>();
		for (IMensagemGrupo iMsgGrupo :iMensagensGrupos) {
			if (iMsgGrupo instanceof AtividadeMensagemGrupo) {
				this.atividadesMensagensGrupos.add(
						(AtividadeMensagemGrupo) iMsgGrupo);
			}
		}
	}
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Date getDataEnvio() {
		return dataEnvio;
	}
	
	public void setDataEnvio(Date dataEnvio) {
		this.dataEnvio = dataEnvio;
	}
	
	public Integer getTempoEscala() {
		return tempoEscala;
	}
	
	public void setTempoEscala(Integer tempoEscala) {
		this.tempoEscala = tempoEscala;
	}
	
	public boolean isAtivo() {
		return ativo;
	}
	
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	
	public Mensagem getMensagem() {
		return mensagem;
	}
	
	public void setMensagem(Mensagem mensagem) {
		this.mensagem = mensagem;
	}
	
	public Atividade getAtividade() {
		return atividade;
	}
	
	public void setAtividade(Atividade atividade) {
		this.atividade = atividade;
	}
	
	public Set<AtividadeMensagemGrupo> getAtividadesMensagensGrupos() {
		return atividadesMensagensGrupos;
	}
	
	public void setAtividadesMensagensGrupos(
			Set<AtividadeMensagemGrupo> atividadesMensagensGrupos) {
		this.atividadesMensagensGrupos = atividadesMensagensGrupos;
	}
	
}
