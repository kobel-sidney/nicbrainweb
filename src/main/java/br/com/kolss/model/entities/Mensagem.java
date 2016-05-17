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
@Table(name = "mensagem")
public class Mensagem extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 5185913117782807723L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_mensagem", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "descricao_mensagem", nullable = true)
	private String descricao;
	
	
	@Column(name = "checklist", nullable = false)
	private boolean checklist = false;
	
	
	@Column(name = "atividade", nullable = false)
	private boolean atividade = false;
	
	
	@Column(name = "ocorrencia", nullable = false)
	private boolean ocorrencia = false;
	
	
	@Column(name = "atividade_ocorrencia", nullable = false)
	private boolean atividadeOcorrencia = false;
	
	
	@Column(name = "ativo", nullable = false)
	private boolean ativo = false;
	
	
	@Column(name = "template", nullable = false)
	private boolean template = false;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_tipo_mensagem", nullable = true)
	private TipoMensagem tipoMensagem = new TipoMensagem();
	
	@OneToMany(mappedBy = "mensagem", fetch = FetchType.LAZY)
	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
	private Set<ClienteMensagem> clientesMensagens = new HashSet<ClienteMensagem>(0);
	
	/** Método Construtor padrão. */
	public Mensagem() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param descricao
	 * @param checklist
	 * @param atividade
	 * @param ocorrencia
	 * @param atividadeOcorrencia
	 * @param ativo
	 */
	public Mensagem(Long id, String descricao, boolean checklist,
			boolean atividade, boolean ocorrencia, boolean atividadeOcorrencia,
			boolean ativo) {
		this(id, null, checklist, atividade, ocorrencia, atividadeOcorrencia,
				ativo, false, null);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param descricao
	 * @param checklist
	 * @param atividade
	 * @param ocorrencia
	 * @param atividadeOcorrencia
	 * @param ativo
	 * @param tipoMensagem
	 */
	public Mensagem(Long id, String descricao, boolean checklist,
			boolean atividade, boolean ocorrencia, boolean atividadeOcorrencia,
			boolean ativo, TipoMensagem tipoMensagem) {
		this(id, descricao, checklist, atividade, ocorrencia,
				atividadeOcorrencia, ativo, false, tipoMensagem);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param descricao
	 * @param checklist
	 * @param atividade
	 * @param ocorrencia
	 * @param atividadeOcorrencia
	 * @param ativo
	 * @param template
	 * @param tipoMensagem
	 */
	public Mensagem(Long id, String descricao, boolean checklist,
			boolean atividade, boolean ocorrencia, boolean atividadeOcorrencia,
			boolean ativo, boolean template, TipoMensagem tipoMensagem) {
		this();
		this.id = id;
		this.descricao = descricao;
		this.checklist = checklist;
		this.atividade = atividade;
		this.ocorrencia = ocorrencia;
		this.atividadeOcorrencia = atividadeOcorrencia; 
		this.ativo = ativo;
		this.template = template;
		this.tipoMensagem = tipoMensagem;
	}
	
	
	@Override
	public boolean isNew() {
		return !isNumeroNatural(this.id);
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (atividade ? 1231 : 1237);
		result = prime * result + (atividadeOcorrencia ? 1231 : 1237);
		result = prime * result + (ativo ? 1231 : 1237);
		result = prime * result + (template ? 1231 : 1237);
		result = prime * result + (checklist ? 1231 : 1237);
		result = prime * result
				+ ((descricao == null) ? 0 : descricao.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + (ocorrencia ? 1231 : 1237);
		result = prime * result
				+ ((tipoMensagem == null) ? 0 : tipoMensagem.hashCode());
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
		Mensagem other = (Mensagem) obj;
		if (atividade != other.atividade)
			return false;
		if (atividadeOcorrencia != other.atividadeOcorrencia)
			return false;
		if (ativo != other.ativo)
			return false;
		if (template != other.template)
			return false;
		if (checklist != other.checklist)
			return false;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (ocorrencia != other.ocorrencia)
			return false;
		if (tipoMensagem == null) {
			if (other.tipoMensagem != null)
				return false;
		} else if (!tipoMensagem.equals(other.tipoMensagem))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Mensagem [id=" + id
				+ ", descricao=" + descricao
				+ ", checklist=" + checklist
				+ ", atividade=" + atividade
				+ ", ocorrencia=" + ocorrencia
				+ ", atividadeOcorrencia=" + atividadeOcorrencia
				+ ", ativo=" + ativo
				+ ", template=" + template
				+ ", tipoMensagem=" + tipoMensagem
				+ "]";
	}
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getDescricao() {
		return descricao;
	}
	
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public boolean isChecklist() {
		return checklist;
	}
	
	public void setChecklist(boolean checklist) {
		this.checklist = checklist;
	}
	
	public boolean isAtividade() {
		return atividade;
	}
	
	public void setAtividade(boolean atividade) {
		this.atividade = atividade;
	}
	
	public boolean isOcorrencia() {
		return ocorrencia;
	}
	
	public void setOcorrencia(boolean ocorrencia) {
		this.ocorrencia = ocorrencia;
	}
	
	public boolean isAtividadeOcorrencia() {
		return atividadeOcorrencia;
	}
	
	public void setAtividadeOcorrencia(boolean atividadeOcorrencia) {
		this.atividadeOcorrencia = atividadeOcorrencia;
	}
	
	public boolean isAtivo() {
		return ativo;
	}
	
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	
	public boolean isTemplate() {
		return template;
	}
	
	public void setTemplate(boolean template) {
		this.template = template;
	}
	
	public TipoMensagem getTipoMensagem() {
		return tipoMensagem;
	}
	
	public void setTipoMensagem(TipoMensagem tipoMensagem) {
		this.tipoMensagem = tipoMensagem;
	}
	
	public Set<ClienteMensagem> getClientesMensagens() {
		return clientesMensagens;
	}
	
	public void setClientesMensagens(Set<ClienteMensagem> clientesMensagens) {
		this.clientesMensagens = clientesMensagens;
	}

}
