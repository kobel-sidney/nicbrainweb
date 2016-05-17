package br.com.kolss.model.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "ocorrencia")
public class Ocorrencia extends AbstractEntity<Long> implements UsuarioResponsavel {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -7848609075137899359L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_ocorrencia", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "descricao_ocorrencia", nullable = true)
	private String descricaoOcorrencia;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_inicio_ocorrencia", nullable = false)
	private Date dataInicio;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_fim_ocorrencia", nullable = true)
	private Date dataFim;
	
	@Embedded
	private CoordenadaGeografica coordenadas = new CoordenadaGeografica();
	
	@Lob
	@Basic(optional = true, fetch = FetchType.EAGER)
	@Column(name = "foto", nullable = true)
	private byte[] foto;
	
	
	@Column(name = "url_ocorrencia", nullable = true)
	private String url;
	
	@Column(name = "ativo", nullable = false)
	private boolean ativo = true;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_setor", nullable = true)
	private Setor setor = new Setor();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_status", nullable = false)
	private Status status = new Status();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_classificacao_ocorrencia", nullable = false)
	private ClassificacaoOcorrencia classificacaoOcorrencia = 
			new ClassificacaoOcorrencia();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_tipo_classificacao", nullable = true)
	private TipoClassificacao tipoClassificacao =
			new TipoClassificacao();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_gravidade_ocorrencia", nullable = false)
	private GravidadeOcorrencia gravidadeOcorrencia =
			new GravidadeOcorrencia();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_usuario_responsavel", nullable = false)
	private Usuario usuarioResponsavel = new Usuario();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_evento", nullable = false)
	private Evento evento = new Evento();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_atividade", nullable = true)
	private Atividade atividade = new Atividade();
	
	@OneToMany(mappedBy = "ocorrencia", fetch = FetchType.LAZY)
	private Set<AtividadeOcorrencia> atividadesOcorrencias =
			new HashSet<AtividadeOcorrencia>();
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_ultima_atualizacao", nullable = true)
	private Date dataUltimaAtualizacao;
	
	
	
	
	/** Método Construtor padrão. */
	public Ocorrencia() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param descricaoOcorrencia
	 * @param dataInicio
	 * @param ativo
	 * @param status
	 * @param classificacaoOcorrencia
	 * @param tipoClassificacao
	 * @param gravidadeOcorrencia
	 * @param usuarioResponsavel
	 * @param evento
	 * @param atividade
	 */
	public Ocorrencia(Long id, String descricaoOcorrencia, Date dataInicio,
			boolean ativo, Status status,
			ClassificacaoOcorrencia classificacaoOcorrencia,
			TipoClassificacao tipoClassificacao,
			GravidadeOcorrencia gravidadeOcorrencia, Usuario usuarioResponsavel,
			Evento evento, Atividade atividade) {
		this(id, descricaoOcorrencia, dataInicio, null, null, null, null, null,
				false, null, status, classificacaoOcorrencia, tipoClassificacao,
				gravidadeOcorrencia, usuarioResponsavel, evento, atividade);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param descricaoOcorrencia
	 * @param dataInicio
	 * @param dataFim
	 * @param latitude
	 * @param longitude
	 * @param foto
	 * @param url
	 * @param ativo
	 * @param setor
	 * @param status
	 * @param classificacaoOcorrencia
	 * @param tipoClassificacao
	 * @param gravidadeOcorrencia
	 * @param usuarioResponsavel
	 * @param evento
	 * @param atividade
	 */
	public Ocorrencia(Long id, String descricaoOcorrencia, Date dataInicio,
			Date dataFim, String latitude, String longitude, byte[] foto,
			String url, boolean ativo, Setor setor, Status status,
			ClassificacaoOcorrencia classificacaoOcorrencia,
			TipoClassificacao tipoClassificacao,
			GravidadeOcorrencia gravidadeOcorrencia, Usuario usuarioResponsavel,
			Evento evento, Atividade atividade) {
		this();
		this.id = id;
		this.descricaoOcorrencia = descricaoOcorrencia;
		this.dataInicio = dataInicio;
		this.dataFim = dataFim;
		this.coordenadas.setLatitude(latitude);
		this.coordenadas.setLongitude(longitude);
		this.foto = foto;
		this.url = url;
		this.ativo = ativo;
		this.setor = setor;
		this.status = status;
		this.classificacaoOcorrencia = classificacaoOcorrencia;
		this.tipoClassificacao = tipoClassificacao;
		this.gravidadeOcorrencia = gravidadeOcorrencia;
		this.usuarioResponsavel = usuarioResponsavel;
		this.evento = evento;
		this.atividade = atividade;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((atividade == null) ? 0 : atividade.hashCode());
		result = prime * result
				+ ((atividadesOcorrencias == null) ? 0
						: atividadesOcorrencias.hashCode());
		result = prime * result + (ativo ? 1231 : 1237);
		result = prime * result
				+ ((classificacaoOcorrencia == null) ? 0
						: classificacaoOcorrencia.hashCode());
		result = prime * result
				+ ((coordenadas == null) ? 0 : coordenadas.hashCode());
		result = prime * result + ((dataFim == null) ? 0 : dataFim.hashCode());
		result = prime * result
				+ ((dataInicio == null) ? 0 : dataInicio.hashCode());
		result = prime * result
				+ ((descricaoOcorrencia == null) ? 0
						: descricaoOcorrencia.hashCode());
		result = prime * result + ((evento == null) ? 0 : evento.hashCode());
		result = prime * result
				+ ((gravidadeOcorrencia == null) ? 0
						: gravidadeOcorrencia.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((setor == null) ? 0 : setor.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result
				+ ((tipoClassificacao == null) ? 0
						: tipoClassificacao.hashCode());
		result = prime * result + ((url == null) ? 0 : url.hashCode());
		result = prime * result + ((usuarioResponsavel == null) ? 0
				: usuarioResponsavel.hashCode());
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
		Ocorrencia other = (Ocorrencia) obj;
		if (atividade == null) {
			if (other.atividade != null)
				return false;
		} else if (!atividade.equals(other.atividade))
			return false;
		if (atividadesOcorrencias == null) {
			if (other.atividadesOcorrencias != null)
				return false;
		} else if (!atividadesOcorrencias.equals(other.atividadesOcorrencias))
			return false;
		if (ativo != other.ativo)
			return false;
		if (classificacaoOcorrencia == null) {
			if (other.classificacaoOcorrencia != null)
				return false;
		} else if (!classificacaoOcorrencia
				.equals(other.classificacaoOcorrencia))
			return false;
		if (coordenadas == null) {
			if (other.coordenadas != null)
				return false;
		} else if (!coordenadas.equals(other.coordenadas))
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
		if (descricaoOcorrencia == null) {
			if (other.descricaoOcorrencia != null)
				return false;
		} else if (!descricaoOcorrencia.equals(other.descricaoOcorrencia))
			return false;
		if (evento == null) {
			if (other.evento != null)
				return false;
		} else if (!evento.equals(other.evento))
			return false;
		if (gravidadeOcorrencia == null) {
			if (other.gravidadeOcorrencia != null)
				return false;
		} else if (!gravidadeOcorrencia.equals(other.gravidadeOcorrencia))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (setor == null) {
			if (other.setor != null)
				return false;
		} else if (!setor.equals(other.setor))
			return false;
		if (tipoClassificacao == null) {
			if (other.tipoClassificacao != null)
				return false;
		} else if (!tipoClassificacao.equals(other.tipoClassificacao))
			return false;
		if (url == null) {
			if (other.url != null)
				return false;
		} else if (!url.equals(other.url))
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
		return "Ocorrencia [id=" + id
				+ ", descricaoOcorrencia=" + descricaoOcorrencia
				+ ", dataInicio=" + dataInicio
				+ ", dataFim=" + dataFim
				+ ", " + coordenadas
				+ ", url=" + url
				+ ", ativo=" + ativo
				+ ", setor=" + setor
				+ ", status=" + status
				+ ", classificacaoOcorrencia=" + classificacaoOcorrencia
				+ ", tipoClassificacao=" + tipoClassificacao
				+ ", gravidadeOcorrencia=" + gravidadeOcorrencia
				+ ", usuarioResponsavel=" + usuarioResponsavel
				+ ", evento=" + evento
				+ ", atividade=" + atividade
				+ "]";
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getDescricaoOcorrencia() {
		return descricaoOcorrencia;
	}
	
	public void setDescricaoOcorrencia(String descricaoOcorrencia) {
		this.descricaoOcorrencia = descricaoOcorrencia;
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
	
	public String getLatitude() {
		return this.coordenadas.getLatitude();
	}
	
	public void setLatitude(String latitude) {
		this.coordenadas.setLatitude(latitude);
	}
	
	public String getLongitude() {
		return this.coordenadas.getLongitude();
	}
	
	public void setLongitude(String longitude) {
		this.coordenadas.setLongitude(longitude);
	}
	
	public byte[] getFoto() {
		return foto;
	}
	
	public void setFoto(byte[] foto) {
		this.foto = foto;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public boolean isAtivo() {
		return ativo;
	}
	
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	
	public Setor getSetor() {
		return setor;
	}
	
	public void setSetor(Setor setor) {
		this.setor = setor;
	}
	
	public Status getStatus() {
		return status;
	}
	
	public void setStatus(Status status) {
		this.status = status;
	}
	
	public ClassificacaoOcorrencia getClassificacaoOcorrencia() {
		return classificacaoOcorrencia;
	}
	
	public void setClassificacaoOcorrencia(
			ClassificacaoOcorrencia classificacaoOcorrencia) {
		this.classificacaoOcorrencia = classificacaoOcorrencia;
	}
	
	public TipoClassificacao getTipoClassificacao() {
		return tipoClassificacao;
	}
	
	public void setTipoClassificacao(TipoClassificacao tipoClassificacao) {
		this.tipoClassificacao = tipoClassificacao;
	}
	
	public GravidadeOcorrencia getGravidadeOcorrencia() {
		return gravidadeOcorrencia;
	}
	
	public void setGravidadeOcorrencia(GravidadeOcorrencia gravidadeOcorrencia) {
		this.gravidadeOcorrencia = gravidadeOcorrencia;
	}
	
	public Usuario getUsuarioResponsavel() {
		return usuarioResponsavel;
	}
	
	public void setUsuarioResponsavel(Usuario usuarioResponsavel) {
		this.usuarioResponsavel = usuarioResponsavel;
	}
	
	public Evento getEvento() {
		return evento;
	}
	
	public void setEvento(Evento evento) {
		this.evento = evento;
	}
	
	public Atividade getAtividade() {
		return atividade;
	}
	
	public void setAtividade(Atividade atividade) {
		this.atividade = atividade;
	}
	
	public Set<AtividadeOcorrencia> getAtividadesOcorrencias() {
		return atividadesOcorrencias;
	}
	
	public void setAtividadesOcorrencias(
			Set<AtividadeOcorrencia> atividadesOcorrencias) {
		this.atividadesOcorrencias = atividadesOcorrencias;
	}

	public Date getDataUltimaAtualizacao() {
		return dataUltimaAtualizacao;
	}

	public void setDataUltimaAtualizacao(Date dataUltimaAtualizacao) {
		this.dataUltimaAtualizacao = dataUltimaAtualizacao;
	}
	
}
