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
@Table(name = "clas_ocor_msg_grupo")
public class ClassificacaoOcorrenciaMensagemGrupo extends AbstractEntity<Long>
		implements UsuarioResponsavel {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -3909770305434504972L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_clas_ocor_msg_grp", nullable = false, unique = true)
	private Long id;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_tipo_envio", nullable = false)
	private TipoEnvio tipoEnvio = new TipoEnvio();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_grupo", nullable = false)
	private Grupo grupo = new Grupo();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_clas_ocor_mgs", nullable = false)
	private ClassificacaoOcorrenciaMensagem classificacaoOcorrenciaMensagem = 
			new ClassificacaoOcorrenciaMensagem();
	
	
	/** Método Construtor padrão. */
	public ClassificacaoOcorrenciaMensagemGrupo() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param tipoEnvio
	 * @param grupo
	 * @param classificacaoOcorrenciaMensagem
	 */
	public ClassificacaoOcorrenciaMensagemGrupo(Long id, TipoEnvio tipoEnvio,
			Grupo grupo,
			ClassificacaoOcorrenciaMensagem classificacaoOcorrenciaMensagem) {
		this();
		this.id = id;
		this.tipoEnvio = tipoEnvio;
		this.grupo = grupo;
		this.classificacaoOcorrenciaMensagem = classificacaoOcorrenciaMensagem;
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
				+ ((classificacaoOcorrenciaMensagem == null) ? 0
						: classificacaoOcorrenciaMensagem.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		ClassificacaoOcorrenciaMensagemGrupo other = (ClassificacaoOcorrenciaMensagemGrupo) obj;
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
		if (classificacaoOcorrenciaMensagem == null) {
			if (other.classificacaoOcorrenciaMensagem != null)
				return false;
		} else if (!classificacaoOcorrenciaMensagem.equals(other.classificacaoOcorrenciaMensagem))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "ClassificacaoOcorrenciaMensagemGrupo [id=" + "id"
				+ ", tipoEnvio=" + tipoEnvio
				+ ", grupo=" + grupo
				+ ", classificacaoOcorrenciaMensagem=" + classificacaoOcorrenciaMensagem
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
	
	public ClassificacaoOcorrenciaMensagem getClassificacaoOcorrenciaMensagem() {
		return classificacaoOcorrenciaMensagem;
	}
	
	public void setClassificacaoOcorrenciaMensagem(
			ClassificacaoOcorrenciaMensagem classificacaoOcorrenciaMensagem) {
		this.classificacaoOcorrenciaMensagem = classificacaoOcorrenciaMensagem;
	}
	
}
