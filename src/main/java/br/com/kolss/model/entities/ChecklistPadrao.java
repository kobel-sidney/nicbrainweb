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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;


@Entity
@Table(name = "checklist_padrao")
public class ChecklistPadrao extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -9027239321634032591L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_checklist_padrao", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_checklist_padrao", nullable = false)
	private String nome;
	
	
	@Column(name = "descricao_checklist_padrao", nullable = true)
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
	
	
	@Column(name = "template", nullable = false)
	private boolean template = false;
	
	@OneToMany(mappedBy = "checklistPadrao", fetch = FetchType.LAZY)
	private Set<ChecklistPadraoCliente> checklistsPadraoClientes =
			new HashSet<ChecklistPadraoCliente>();
	
	@OneToMany(mappedBy = "checklistPadrao", fetch = FetchType.LAZY)
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private Set<ChecklistProcedimento> checklistsProcedimentos = new HashSet<ChecklistProcedimento>(0);
	
	@OneToMany(mappedBy = "checklistPadrao", fetch = FetchType.LAZY)
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private Set<ChecklistPadraoMensagem> checklistsPadroesMensagens = new HashSet<ChecklistPadraoMensagem>(0);
	
	@ManyToMany
	@JoinTable(name = "checklist_padrao_segmento",
			joinColumns = @JoinColumn(name = "id_checklist_padrao"),
			inverseJoinColumns = @JoinColumn(name = "id_segmento"))
	private Set<Segmento> segmentos = new HashSet<Segmento>(0);
	

	@ManyToOne
	@JoinColumn(name = "id_contratante", nullable = true)
	private Contratante contratante;
	
	
	/** Método Construtor padrão. */
	public ChecklistPadrao() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 * @param tempoExecucaoEstimado
	 * @param tempoToleranciaInicio
	 * @param tempoToleranciaFim
	 * @param recorrente
	 * @param checklistRonda
	 */
	public ChecklistPadrao(Long id, String nome, Integer tempoExecucaoEstimado,
			Integer tempoToleranciaInicio, Integer tempoToleranciaFim,
			boolean recorrente, boolean checklistRonda) {
		this(id, nome, null, tempoExecucaoEstimado, tempoToleranciaInicio,
			tempoToleranciaFim, recorrente, checklistRonda);
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 * @param descricao
	 * @param tempoExecucaoEstimado
	 * @param tempoToleranciaInicio
	 * @param tempoToleranciaFim
	 * @param recorrente
	 * @param checklistRonda
	 */
	public ChecklistPadrao(Long id, String nome, String descricao,
			Integer tempoExecucaoEstimado, Integer tempoToleranciaInicio,
			Integer tempoToleranciaFim, boolean recorrente,
			boolean checklistRonda) {
		this(id, nome, descricao, tempoExecucaoEstimado, tempoToleranciaInicio,
				tempoToleranciaFim, recorrente, checklistRonda, false);
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 * @param descricao
	 * @param tempoExecucaoEstimado
	 * @param tempoToleranciaInicio
	 * @param tempoToleranciaFim
	 * @param recorrente
	 * @param checklistRonda
	 * @param template
	 */
	public ChecklistPadrao(Long id, String nome, String descricao,
			Integer tempoExecucaoEstimado, Integer tempoToleranciaInicio,
			Integer tempoToleranciaFim, boolean recorrente,
			boolean checklistRonda, boolean template) {
		this();
		this.id = id;
		this.nome = nome;
		this.descricao = descricao;
		this.tempoExecucaoEstimado = tempoExecucaoEstimado;
		this.tempoToleranciaInicio = tempoToleranciaInicio;
		this.tempoToleranciaFim = tempoToleranciaFim;
		this.recorrente = recorrente;
		this.checklistRonda = checklistRonda;
		this.template = template;
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
		result = prime * result + (checklistRonda ? 1231 : 1237);
		result = prime * result + (recorrente ? 1231 : 1237);
		result = prime * result + (template ? 1231 : 1237);
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		ChecklistPadrao other = (ChecklistPadrao) obj;
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
		if (checklistsPadroesMensagens == null) {
			if (other.checklistsPadroesMensagens != null)
				return false;
		} else if (!checklistsPadroesMensagens
				.equals(other.checklistsPadroesMensagens))
			return false;
		if (checklistsProcedimentos == null) {
			if (other.checklistsProcedimentos != null)
				return false;
		} else if (!checklistsProcedimentos.equals(
				other.checklistsProcedimentos))
			return false;
		if (checklistRonda != other.checklistRonda)
			return false;
		if (recorrente != other.recorrente)
			return false;
		if (template != other.template)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ChecklistPadrao [id=" + id
				+ ", nome=" + nome
				+ ", descricao=" + descricao
				+ ", tempoExecucaoEstimado=" + tempoExecucaoEstimado
				+ ", tempoToleranciaInicio=" + tempoToleranciaInicio
				+ ", tempoToleranciaFim=" + tempoToleranciaFim
				+ ", checklistRonda=" + checklistRonda
				+ ", recorrente=" + recorrente
				+ ", template=" + template
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
	
	public Set<ChecklistProcedimento> getChecklistsProcedimentos() {
		return checklistsProcedimentos;
	}
	
	public void setChecklistsProcedimentos(
			Set<ChecklistProcedimento> checklistsProcedimentos) {
		this.checklistsProcedimentos = checklistsProcedimentos;
	}
	
	public Set<ChecklistPadraoMensagem> getChecklistsPadroesMensagens() {
		return checklistsPadroesMensagens;
	}
	
	public void setChecklistsPadroesMensagens(
			Set<ChecklistPadraoMensagem> checklistsPadroesMensagens) {
		this.checklistsPadroesMensagens = checklistsPadroesMensagens;
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
	
	public boolean isTemplate() {
		return template;
	}
	
	public void setTemplate(boolean template) {
		this.template = template;
	}
	
	public Set<ChecklistPadraoCliente> getChecklistsPadraoClientes() {
		return checklistsPadraoClientes;
	}
	
	public void setChecklistsPadraoClientes(
			Set<ChecklistPadraoCliente> checklistsPadraoClientes) {
		this.checklistsPadraoClientes = checklistsPadraoClientes;
	}
	
	public Set<Segmento> getSegmentos() {
		return segmentos;
	}
	
	public void setSegmentos(Set<Segmento> segmentos) {
		this.segmentos = segmentos;
	}

	public Contratante getContratante() {
		return contratante;
	}

	public void setContratante(Contratante contratante) {
		this.contratante = contratante;
	}
	
}
