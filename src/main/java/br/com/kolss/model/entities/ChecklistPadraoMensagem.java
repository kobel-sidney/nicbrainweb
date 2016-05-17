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
@Table(name = "checklist_padrao_mensagem")
public class ChecklistPadraoMensagem extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 8338898603690558261L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_chk_pdr_mgs", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "tempo_escala", nullable = false)
	private Integer tempoEscala;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_mensagem", nullable = true)
	private Mensagem mensagem = new Mensagem();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_checklist_padrao", nullable = true)
	private ChecklistPadrao checklistPadrao = new ChecklistPadrao();
	
	
	/** Método Construtor padrão. */
	public ChecklistPadraoMensagem() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param tempoEscala
	 */
	public ChecklistPadraoMensagem(Long id, Integer tempoEscala) {
		this(id, tempoEscala, null, null);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param tempoEscala
	 * @param mensagem
	 * @param checklistPadrao
	 */
	public ChecklistPadraoMensagem(Long id, Integer tempoEscala,
			Mensagem mensagem, ChecklistPadrao checklistPadrao) {
		this();
		this.id = id;
		this.tempoEscala = tempoEscala;
		this.mensagem = mensagem;
		this.checklistPadrao = checklistPadrao;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((mensagem == null) ? 0 : mensagem.hashCode());
		result = prime * result
				+ ((tempoEscala == null) ? 0 : tempoEscala.hashCode());
		result = prime * result
				+ ((checklistPadrao == null) ? 0
						: checklistPadrao.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		ChecklistPadraoMensagem other = (ChecklistPadraoMensagem) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
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
		if (checklistPadrao == null) {
			if (other.checklistPadrao != null)
				return false;
		} else if (!checklistPadrao.equals(other.checklistPadrao))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "ChecklistPadraoMensagem [id=" + id
				+ ", tempoEscala=" + tempoEscala
				+ ", mensagem=" + mensagem
				+ ", checklistPadrao=" + checklistPadrao
				+ "]";
	}
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Integer getTempoEscala() {
		return tempoEscala;
	}
	
	public void setTempoEscala(Integer tempoEscala) {
		this.tempoEscala = tempoEscala;
	}
	
	public Mensagem getMensagem() {
		return mensagem;
	}
	
	public void setMensagem(Mensagem mensagem) {
		this.mensagem = mensagem;
	}
	
	public ChecklistPadrao getChecklistPadrao() {
		return checklistPadrao;
	}
	
	public void setChecklistPadrao(ChecklistPadrao checklistPadrao) {
		this.checklistPadrao = checklistPadrao;
	}
	
}
