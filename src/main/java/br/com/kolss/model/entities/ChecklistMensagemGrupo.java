package br.com.kolss.model.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "checklist_msg_grupo")
public class ChecklistMensagemGrupo extends AbstractEntity<Long>implements UsuarioResponsavel, IMensagemGrupo {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 9106497309309364338L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_chk_msg_grp", nullable = false, unique = true)
	private Long id;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_tipo_envio", nullable = false)
	private TipoEnvio tipoEnvio = new TipoEnvio();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_grupo", nullable = false)
	private Grupo grupo = new Grupo();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_chk_mgs", nullable = false)
	private ChecklistMensagem checklistMensagem = new ChecklistMensagem();
	
	
	/** Método Construtor padrão. */
	public ChecklistMensagemGrupo() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param tipoEnvio
	 * @param grupo
	 * @param checklistMensagem
	 */
	public ChecklistMensagemGrupo(Long id, TipoEnvio tipoEnvio,
			Grupo grupo, ChecklistMensagem checklistMensagem) {
		this();
		this.id = id;
		this.tipoEnvio = tipoEnvio;
		this.grupo = grupo;
		this.checklistMensagem = checklistMensagem;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((grupo == null) ? 0 : grupo.hashCode());
		result = prime * result
				+ ((tipoEnvio == null) ? 0 : tipoEnvio.hashCode());
		result = prime * result
				+ ((checklistMensagem == null) ? 0
						: checklistMensagem.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		ChecklistMensagemGrupo other = (ChecklistMensagemGrupo) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (grupo == null) {
			if (other.grupo != null)
				return false;
		} else if (!grupo.equals(other.grupo))
			return false;
		if (tipoEnvio == null) {
			if (other.tipoEnvio != null)
				return false;
		} else if (!tipoEnvio.equals(other.tipoEnvio))
			return false;
		if (checklistMensagem == null) {
			if (other.checklistMensagem != null)
				return false;
		} else if (!checklistMensagem.equals(other.checklistMensagem))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "ChecklistMensagemGrupo [id=" + "id"
				+ ", tipoEnvio=" + tipoEnvio
				+ ", grupo=" + grupo
				+ ", checklistMensagem=" + checklistMensagem
				+ "]";
	}
	
	@Override
	public Usuario getUsuarioResponsavel() {
		return (this.getGrupo() != null
				? this.getGrupo().getUsuarioResponsavel()
				: null);
	}
	
	@Override
	public void setUsuarioResponsavel(Usuario usuario) {
		if (getGrupo() == null) {
			setGrupo(new Grupo());
		}
		
		this.getGrupo().setUsuarioResponsavel(usuario);
	}

	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public TipoEnvio getTipoEnvio() {
		return tipoEnvio;
	}
	
	public void setTipoEnvio(TipoEnvio tipoEnvio) {
		this.tipoEnvio = tipoEnvio;
	}
	
	public Grupo getGrupo() {
		return grupo;
	}
	
	public void setGrupo(Grupo grupoUsuario) {
		this.grupo = grupoUsuario;
	}
	
	public ChecklistMensagem getChecklistMensagem() {
		return checklistMensagem;
	}
	
	public void setChecklistMensagem(ChecklistMensagem checklistMensagem) {
		this.checklistMensagem = checklistMensagem;
	}
	
}
