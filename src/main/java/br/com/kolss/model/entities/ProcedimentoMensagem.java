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
@Table(name = "procedimento_mensagem")
public class ProcedimentoMensagem extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -1917931971407831229L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_prc_mgs", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "tempo_escala", nullable = false)
	private Integer tempoEscala;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_mensagem", nullable = true)
	private Mensagem mensagem = new Mensagem();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_procedimento", nullable = true)
	private Procedimento procedimento = new Procedimento();
	
	
	/** Método Construtor padrão. */
	public ProcedimentoMensagem() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param tempoEscala
	 */
	public ProcedimentoMensagem(Long id, Integer tempoEscala) {
		this(id, tempoEscala, null, null);
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param tempoEscala
	 * @param mensagem
	 * @param procedimento
	 */
	public ProcedimentoMensagem(Long id, Integer tempoEscala,
			Mensagem mensagem, Procedimento procedimento) {
		this();
		this.id = id;
		this.tempoEscala = tempoEscala;
		this.mensagem = mensagem;
		this.procedimento = procedimento;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((mensagem == null) ? 0 : mensagem.hashCode());
		result = prime * result
				+ ((procedimento == null) ? 0
						: procedimento.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		ProcedimentoMensagem other = (ProcedimentoMensagem) obj;
		if (mensagem == null) {
			if (other.mensagem != null)
				return false;
		} else if (!mensagem.equals(other.mensagem))
			return false;
		if (procedimento == null) {
			if (other.procedimento != null)
				return false;
		} else if (!procedimento.equals(other.procedimento))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "ClassificacaoOcorrenciaMensagem [id=" + id
				+ ", tempoEscala=" + tempoEscala
				+ ", mensagem=" + mensagem
				+ ", procedimento=" + procedimento
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
	
	public String getTempoEscalaAsString() {
		return (tempoEscala + 0) + "";
	}
	
	public void setTempoEscalaAsString(String tempoEscala) {
		try {
			this.tempoEscala = Integer.valueOf(tempoEscala);
		} catch (Exception e) {
			this.tempoEscala = Integer.valueOf(0);
		}
	}
	
	public Mensagem getMensagem() {
		return mensagem;
	}
	
	public void setMensagem(Mensagem mensagem) {
		this.mensagem = mensagem;
	}
	
	public Procedimento getProcedimento() {
		return procedimento;
	}
	
	public void setProcedimento(Procedimento procedimento) {
		this.procedimento = procedimento;
	}
	
}
