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
@Table(name = "atividade_msg_grupo")
public class AtividadeMensagemGrupo extends AbstractEntity<Long>
		implements UsuarioResponsavel, IMensagemGrupo {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -291032912596599052L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_atv_msg_grp", nullable = false, unique = true)
	private Long id;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_tipo_envio", nullable = false)
	private TipoEnvio tipoEnvio = new TipoEnvio();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_grupo", nullable = false)
	private Grupo grupo = new Grupo();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_atv_mgs", nullable = false)
	private AtividadeMensagem atividadeMensagem = new AtividadeMensagem();
	
	
	/** Método Construtor padrão. */
	public AtividadeMensagemGrupo() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param tipoEnvio
	 * @param grupo
	 * @param atividadeMensagem
	 */
	public AtividadeMensagemGrupo(Long id, TipoEnvio tipoEnvio,
			Grupo grupo, AtividadeMensagem atividadeMensagem) {
		this();
		this.id = id;
		this.tipoEnvio = tipoEnvio;
		this.grupo = grupo;
		this.atividadeMensagem = atividadeMensagem;
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
				+ ((atividadeMensagem == null) ? 0
						: atividadeMensagem.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		AtividadeMensagemGrupo other = (AtividadeMensagemGrupo) obj;
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
		if (atividadeMensagem == null) {
			if (other.atividadeMensagem != null)
				return false;
		} else if (!atividadeMensagem.equals(other.atividadeMensagem))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "AtividadeMensagemGrupo [id=" + "id"
				+ ", tipoEnvio=" + tipoEnvio
				+ ", grupo=" + grupo
				+ ", atividadeMensagem=" + atividadeMensagem
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
	
	public void setGrupo(Grupo grupo) {
		this.grupo = grupo;
	}
	
	public AtividadeMensagem getAtividadeMensagem() {
		return atividadeMensagem;
	}
	
	public void setAtividadeMensagem(AtividadeMensagem atividadeMensagem) {
		this.atividadeMensagem = atividadeMensagem;
	}
	
}
