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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;


@Entity
@Table(name = "procedimento")
public class Procedimento extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -5509913480000623450L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_procedimento", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_procedimento", nullable = false)
	private String nome;
	
	
	@Column(name = "descricao_procedimento", nullable = true)
	private String descricao;
	
	
	@Column(name = "tempo_exec_estimado", nullable = false)
	private Integer tempoExecucaoEstimado;
	
	
	@Column(name = "tempo_toler_inicio", nullable = false)
	private Integer tempoToleranciaInicio;
	
	
	@Column(name = "tempo_toler_fim", nullable = false)
	private Integer tempoToleranciaFim;
	
	
	@Column(name = "tempo_toler_antecipado", nullable = true)
	private Integer tempoToleranciaAntecipado;
	
	
	@Column(name = "mandatorio", nullable = false)
	private boolean mandatorio = false;
	
	
	@Column(name = "campo_check", nullable = false)
	private boolean campoCheck = false;
	
	
	@Column(name = "template", nullable = false)
	private boolean template = false;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_perfil_formulario", nullable = true)
	private PerfilFormulario perfilFormulario = new PerfilFormulario();
	
	@OneToMany(mappedBy = "procedimento", fetch = FetchType.LAZY)
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private Set<ChecklistProcedimento> checklistsProcedimentos =
			new HashSet<ChecklistProcedimento>();
	
	@OneToMany(mappedBy = "procedimento", fetch = FetchType.LAZY)
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private Set<ClassificacaoProcedimento> classificacoesProcedimentos =
			new HashSet<ClassificacaoProcedimento>();
	
	@OneToMany(mappedBy = "procedimento", fetch = FetchType.LAZY)
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private Set<ProcedimentoMensagem> procedimentosMensagens =
			new HashSet<ProcedimentoMensagem>();
	
	@OneToMany(mappedBy = "procedimento", fetch = FetchType.LAZY)
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private Set<ProcedimentoCliente> procedimentosClientes =
			new HashSet<ProcedimentoCliente>();
	
	@ManyToOne
	@JoinColumn(name = "id_contratante", nullable = true)
	private Contratante contratante;
	
	/** Método Construtor padrão. */
	public Procedimento() {
		super();
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
	 * @param mandatorio
	 */
	public Procedimento(Long id, String nome, String descricao,
			Integer tempoExecucaoEstimado, Integer tempoToleranciaInicio,
			Integer tempoToleranciaFim, boolean mandatorio) {
		this(id, nome, descricao, tempoExecucaoEstimado, tempoToleranciaInicio,
				tempoToleranciaFim, null, mandatorio, false, null);
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
	 * @param tempoToleranciaAntecipado
	 * @param mandatorio
	 * @param campoCheck
	 * @param perfilFormulario
	 */
	public Procedimento(Long id, String nome, String descricao,
			Integer tempoExecucaoEstimado, Integer tempoToleranciaInicio,
			Integer tempoToleranciaFim, Integer tempoToleranciaAntecipado,
			boolean mandatorio, boolean campoCheck,
			PerfilFormulario perfilFormulario) {
		this(id, nome, descricao, tempoExecucaoEstimado, tempoToleranciaInicio,
				tempoToleranciaFim, tempoToleranciaAntecipado, mandatorio,
				campoCheck, false, perfilFormulario);
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
	 * @param tempoToleranciaAntecipado
	 * @param mandatorio
	 * @param campoCheck
	 * @param template
	 * @param perfilFormulario
	 */
	public Procedimento(Long id, String nome, String descricao,
			Integer tempoExecucaoEstimado, Integer tempoToleranciaInicio,
			Integer tempoToleranciaFim, Integer tempoToleranciaAntecipado,
			boolean mandatorio, boolean campoCheck, boolean template,
			PerfilFormulario perfilFormulario) {
		this();
		this.id = id;
		this.nome = nome;
		this.descricao = descricao;
		this.tempoExecucaoEstimado = tempoExecucaoEstimado;
		this.tempoToleranciaInicio = tempoToleranciaInicio;
		this.tempoToleranciaFim = tempoToleranciaFim;
		this.tempoToleranciaAntecipado = tempoToleranciaAntecipado;
		this.mandatorio = mandatorio;
		this.campoCheck = campoCheck;
		this.template = template;
		this.perfilFormulario = perfilFormulario;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (campoCheck ? 1231 : 1237);
		result = prime * result + (template ? 1231 : 1237);
		result = prime * result + ((descricao == null) ? 0
				: descricao.hashCode());
		result = prime * result + ((perfilFormulario == null) ? 0
				: perfilFormulario.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + (mandatorio ? 1231 : 1237);
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result + ((tempoExecucaoEstimado == null) ? 0
				: tempoExecucaoEstimado.hashCode());
		result = prime * result + ((tempoToleranciaAntecipado == null) ? 0
				: tempoToleranciaAntecipado.hashCode());
		result = prime * result + ((tempoToleranciaFim == null) ? 0
				: tempoToleranciaFim.hashCode());
		result = prime * result + ((tempoToleranciaInicio == null) ? 0
				: tempoToleranciaInicio.hashCode());
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
		Procedimento other = (Procedimento) obj;
		if (campoCheck != other.campoCheck)
			return false;
		if (template != other.template)
			return false;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (perfilFormulario == null) {
			if (other.perfilFormulario != null)
				return false;
		} else if (!perfilFormulario.equals(other.perfilFormulario))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (mandatorio != other.mandatorio)
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
		if (tempoToleranciaAntecipado == null) {
			if (other.tempoToleranciaAntecipado != null)
				return false;
		} else if (!tempoToleranciaAntecipado
				.equals(other.tempoToleranciaAntecipado))
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
		return true;
	}

	@Override
	public String toString() {
		return "Procedimento [id=" + id
				+ ", nome=" + nome
				+ ", descricao=" + descricao
				+ ", tempoExecucaoEstimado=" + tempoExecucaoEstimado
				+ ", tempoToleranciaInicio=" + tempoToleranciaInicio
				+ ", tempoToleranciaFim=" + tempoToleranciaFim
				+ ", tempoToleranciaAntecipado=" + tempoToleranciaAntecipado
				+ ", mandatorio=" + mandatorio
				+ ", campoCheck=" + campoCheck
				+ ", template=" + template
				+ ", formulario=" + perfilFormulario
				+ "]";
	}
	
	
	/**
	 * Retorna o valor em Integer, ou zero.
	 * 
	 * @param str
	 * @return
	 */
	private Integer retornaInteger(String str) {
		Integer numero = null;
		try {
			numero = Integer.valueOf(str);
		} catch (Exception e) {
			numero = Integer.valueOf(0);
		}
		
		return numero;
	}
	
	/**
	 * Retorna o valor do Integer para String.<br>
	 * Em caso se valor inválido, irá retornar 'zero'.
	 * 
	 * @param integer
	 * 
	 * @return
	 */
	private String converterToString(Integer integer) {
		String str = null;
		try {
			str = Integer.toString(integer);
		} catch (Exception e) {
			str = "0";
		}
		
		return str;
	}
	
	
	public String getTempoExecucaoEstimadoAsString() {
		return this.converterToString(this.tempoExecucaoEstimado);
	}
	
	public void setTempoExecucaoEstimadoAsString(String tempoExecucaoEstimado) {
		this.tempoExecucaoEstimado = this.retornaInteger(tempoExecucaoEstimado);
	}
	
	public String getTempoToleranciaInicioAsString() {
		return this.converterToString(this.tempoToleranciaInicio);
	}
	
	public void setTempoToleranciaInicioAsString(String tempoToleranciaInicio) {
		this.tempoToleranciaInicio = this.retornaInteger(tempoToleranciaInicio);
	}
	
	public String getTempoToleranciaFimAsString() {
		return this.converterToString(this.tempoToleranciaFim);
	}
	
	public void setTempoToleranciaFimAsString(String tempoToleranciaFim) {
		this.tempoToleranciaFim = this.retornaInteger(tempoToleranciaFim);
	}
	
	public String getTempoToleranciaAntecipadoAsString() {
		return this.converterToString(tempoToleranciaAntecipado);
	}
	
	public void setTempoToleranciaAntecipadoAsString(String tempoToleranciaAntecipado) {
		this.tempoToleranciaAntecipado = this.retornaInteger(tempoToleranciaAntecipado);
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
	
	public Integer getTempoToleranciaAntecipado() {
		return tempoToleranciaAntecipado;
	}
	
	public void setTempoToleranciaAntecipado(Integer tempoToleranciaAntecipado) {
		this.tempoToleranciaAntecipado = tempoToleranciaAntecipado;
	}
	
	public boolean isMandatorio() {
		return mandatorio;
	}
	
	public void setMandatorio(boolean mandatorio) {
		this.mandatorio = mandatorio;
	}
	
	public boolean isCampoCheck() {
		return campoCheck;
	}
	
	public void setCampoCheck(boolean campoCheck) {
		this.campoCheck = campoCheck;
	}
	
	public boolean isTemplate() {
		return template;
	}
	
	public void setTemplate(boolean template) {
		this.template = template;
	}
	
	public PerfilFormulario getPerfilFormulario() {
		return perfilFormulario;
	}
	
	public void setPerfilFormulario(PerfilFormulario perfilFormulario) {
		this.perfilFormulario = perfilFormulario;
	}

	public Set<ChecklistProcedimento> getChecklistsProcedimentos() {
		return checklistsProcedimentos;
	}

	public void setChecklistsProcedimentos(
			Set<ChecklistProcedimento> checklistsProcedimentos) {
		this.checklistsProcedimentos = checklistsProcedimentos;
	}
	
	public Set<ClassificacaoProcedimento> getClassificacoesProcedimentos() {
		return classificacoesProcedimentos;
	}
	
	public void setClassificacoesProcedimentos(
			Set<ClassificacaoProcedimento> classificacoesProcedimentos) {
		this.classificacoesProcedimentos = classificacoesProcedimentos;
	}
	
	public Set<ProcedimentoMensagem> getProcedimentosMensagens() {
		return procedimentosMensagens;
	}
	
	public void setProcedimentosMensagens(
			Set<ProcedimentoMensagem> procedimentosMensagens) {
		this.procedimentosMensagens = procedimentosMensagens;
	}
	
	public Set<ProcedimentoCliente> getProcedimentosClientes() {
		return procedimentosClientes;
	}
	
	public void setProcedimentosClientes(
			Set<ProcedimentoCliente> procedimentosClientes) {
		this.procedimentosClientes = procedimentosClientes;
	}

	public Contratante getContratante() {
		return contratante;
	}

	public void setContratante(Contratante contratante) {
		this.contratante = contratante;
	}
	
}
