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


@Entity
@Table(name = "modelo_equipamento")
public class ModeloEquipamento extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -8176882897401295159L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_modelo_equipamento", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_modelo_equipamento", nullable = false)
	private String nome;
	
	@Column(name = "observacao", nullable = true)
	private String observacao;
	
	@Column(name = "homologado", nullable = false)
	private boolean homologado = false;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_tipo_equipamento", nullable = true)
	private TipoEquipamento tipoEquipamento = new TipoEquipamento();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_fornecedor", nullable = true)
	private Fornecedor fornecedor = new Fornecedor();
	
	@OneToMany(mappedBy = "modeloEquipamento", fetch = FetchType.LAZY)
	private Set<Equipamento> equipamentos = new HashSet<Equipamento>(0);

	/** Método Construtor Padrão. */
	public ModeloEquipamento() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 * @param observacao
	 * @param homologado
	 */
	public ModeloEquipamento(Long id, String nome, String observacao,
			boolean homologado) {
		this(id, nome, observacao, homologado, null,
				null);
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 * @param observacao
	 * @param homologado
	 * @param tipoEquipamento
	 * @param fornecedor
	 */
	public ModeloEquipamento(Long id, String nome, String observacao,
			boolean homologado, TipoEquipamento tipoEquipamento,
			Fornecedor fornecedor) {
		this();
		this.id = id;
		this.nome = nome;
		this.observacao = observacao;
		this.homologado = homologado;
		this.tipoEquipamento = tipoEquipamento;
		this.fornecedor = fornecedor;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((fornecedor == null) ? 0 : fornecedor.hashCode());
		result = prime * result + (homologado ? 1231 : 1237);
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result
				+ ((observacao == null) ? 0 : observacao.hashCode());
		result = prime * result
				+ ((tipoEquipamento == null) ? 0 : tipoEquipamento.hashCode());
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
		ModeloEquipamento other = (ModeloEquipamento) obj;
		if (fornecedor == null) {
			if (other.fornecedor != null)
				return false;
		} else if (!fornecedor.equals(other.fornecedor))
			return false;
		if (homologado != other.homologado)
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (observacao == null) {
			if (other.observacao != null)
				return false;
		} else if (!observacao.equals(other.observacao))
			return false;
		if (tipoEquipamento == null) {
			if (other.tipoEquipamento != null)
				return false;
		} else if (!tipoEquipamento.equals(other.tipoEquipamento))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "ModeloEquipamento [id=" + id
				+ ", nome=" + nome
				+ ", observacao=" + observacao
				+ ", homologado=" + homologado
				+ ", tipoEquipamento=" + tipoEquipamento
				+ ", fornecedor=" + fornecedor
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
	
	public String getObservacao() {
		return observacao;
	}
	
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	
	public boolean isHomologado() {
		return homologado;
	}
	
	public void setHomologado(boolean homologado) {
		this.homologado = homologado;
	}
	
	public TipoEquipamento getTipoEquipamento() {
		return tipoEquipamento;
	}
	
	public void setTipoEquipamento(TipoEquipamento tipoEquipamento) {
		this.tipoEquipamento = tipoEquipamento;
	}
	
	public Fornecedor getFornecedor() {
		return fornecedor;
	}
	
	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}
	
	public Set<Equipamento> getEquipamentos() {
		return equipamentos;
	}
	
	public void setEquipamentos(Set<Equipamento> equipamentos) {
		this.equipamentos = equipamentos;
	}
}
