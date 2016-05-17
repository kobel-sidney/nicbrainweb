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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "grupo")
public class Grupo extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 3629523328721739590L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_grupo", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_grupo", nullable = false)
	private String nome;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_cadastro", nullable = false)
	private Date dataCadastro;
	
	@ManyToOne(fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name = "id_usuario", nullable = true)
	private Usuario usuarioResponsavel = new Usuario();
	
	@OneToMany(mappedBy = "grupo", fetch = FetchType.LAZY)
	private Set<AtividadeMensagemGrupo> atividadesMensagensGrupos =
			new HashSet<AtividadeMensagemGrupo>(0);
	
	@OneToMany(mappedBy = "grupo", fetch = FetchType.LAZY)
	private Set<ChecklistMensagemGrupo> checklistsMensagensGrupos =
			new HashSet<ChecklistMensagemGrupo>(0);
	
	@OneToMany(mappedBy = "grupo", fetch = FetchType.LAZY)
	private Set<ClassificacaoOcorrenciaMensagemGrupo> classificacoesOcorrenciasMensagensGrupos =
			new HashSet<ClassificacaoOcorrenciaMensagemGrupo>(0);
	
	@ManyToMany
	@JoinTable(name = "grupo_usuario",
			joinColumns = @JoinColumn(name = "id_grupo"),
			inverseJoinColumns = @JoinColumn(name = "id_usuario"))
	private Set<Usuario> usuarios = new HashSet<Usuario>(0);
	
	@ManyToOne
	@JoinColumn(name = "id_contratante", nullable = true)
	private Contratante contratante;
	
	
	/** Método Construtor padrão. */
	public Grupo() {
		super();
	}
	
	public Contratante getContratante() {
		return contratante;
	}

	public void setContratante(Contratante contratante) {
		this.contratante = contratante;
	}

	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 */
	public Grupo(Long id, String nome) {
		this(id, nome, null, null);
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 * @param dataCadastro
	 * @param usuarioResponsavel
	 */
	public Grupo(Long id, String nome, Date dataCadastro,
			Usuario usuarioResponsavel) {
		this();
		this.id = id;
		this.nome = nome;
		this.dataCadastro = dataCadastro;
		this.usuarioResponsavel = usuarioResponsavel;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((dataCadastro == null) ? 0 : dataCadastro.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
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
		Grupo other = (Grupo) obj;
		if (dataCadastro == null) {
			if (other.dataCadastro != null)
				return false;
		} else if (!dataCadastro.equals(other.dataCadastro))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "Grupo [id=" + id
				+ ", nome=" + nome
				+ ", dataCadastro=" + dataCadastro
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
	
	public Date getDataCadastro() {
		return dataCadastro;
	}
	
	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	
	public Usuario getUsuarioResponsavel() {
		return usuarioResponsavel;
	}
	
	public void setUsuarioResponsavel(Usuario usuarioResponsavel) {
		this.usuarioResponsavel = usuarioResponsavel;
	}
	
	public Set<AtividadeMensagemGrupo> getAtividadesMensagensGrupos() {
		return atividadesMensagensGrupos;
	}
	
	public void setAtividadesMensagensGrupos(
			Set<AtividadeMensagemGrupo> atividadesMensagensGrupos) {
		this.atividadesMensagensGrupos = atividadesMensagensGrupos;
	}
	
	public Set<ChecklistMensagemGrupo> getChecklistsMensagensGrupos() {
		return checklistsMensagensGrupos;
	}
	
	public void setChecklistsMensagensGrupos(
			Set<ChecklistMensagemGrupo> checklistsMensagensGrupos) {
		this.checklistsMensagensGrupos = checklistsMensagensGrupos;
	}
	
	public Set<ClassificacaoOcorrenciaMensagemGrupo> getClassificacoesOcorrenciasMensagensGrupos() {
		return classificacoesOcorrenciasMensagensGrupos;
	}
	
	public void setClassificacoesOcorrenciasMensagensGrupos(
			Set<ClassificacaoOcorrenciaMensagemGrupo> classificacoesOcorrenciasMensagensGrupos) {
		this.classificacoesOcorrenciasMensagensGrupos = classificacoesOcorrenciasMensagensGrupos;
	}
	
	public Set<Usuario> getUsuarios() {
		return usuarios;
	}
	
	public void setUsuarios(Set<Usuario> usuarios) {
		this.usuarios = usuarios;
	}
	
}
