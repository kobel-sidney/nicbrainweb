package br.com.kolss.model.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "veiculo")
public class Veiculo extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -4171366877446631850L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_veiculo", nullable = false, unique = true)
	private Long id;

	
	@Column(name = "nome", nullable = false)
	private String nome;
	
	
	@Column(name = "marca_veiculo", nullable = true)
	private String marca;
	
	
	@Column(name = "modelo_veiculo", nullable = true)
	private String modelo;
	
	
	@Column(name = "ano_fabricacao", nullable = true)
	private Integer anoFabricacao;
	
	
	@Column(name = "ano_modelo", nullable = true)
	private Integer anoModelo;
	
	
	@Column(name = "cor_veiculo", nullable = true)
	private String cor;
	
	
	@Column(name = "placa_veiculo", nullable = true)
	private String placa;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_cadastro", nullable = false)
	private Date dataCadastro;

	
	@Column(name = "veiculo_atual", nullable = false)
	private boolean atual = false;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_veiculo_tipo", nullable=false)
	private TipoVeiculo veiculoTipo = new TipoVeiculo();
	
	@ManyToOne
	@JoinColumn(name = "id_contratante", nullable = true)
	private Contratante contratante;
	
	
	
	
	/** Método Construtor padrão. */
	public Veiculo() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param marca
	 * @param modelo
	 * @param anoFabricacao
	 * @param anoModelo
	 * @param cor
	 * @param placa
	 * @param dataCadastro
	 * @param pessoa
	 * @param atual
	 */
	public Veiculo(Long id, String marca, String modelo, Integer anoFabricacao,
			Integer anoModelo, String cor, String placa, Date dataCadastro,
			Pessoa pessoa, boolean atual) {
		this();
		this.id = id;
		this.marca = marca;
		this.modelo = modelo;
		this.anoFabricacao = anoFabricacao;
		this.anoModelo = anoModelo;
		this.cor = cor;
		this.placa = placa;
		this.dataCadastro = dataCadastro;
		this.atual = atual;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((placa == null) ? 0 : placa.hashCode());
		return result;
	}



	@Override
	public String toString() {
		return "Veiculo [id=" + id
				+",nome="+nome
				+ ", marca=" + marca
				+ ", modelo=" + modelo
				+ ", anoFabricacao=" + anoFabricacao
				+ ", anoModelo=" + anoModelo
				+ ", cor=" + cor
				+ ", placa=" + placa
				+ ", dataCadastro=" + dataCadastro
				+ ", atual=" + atual
				+ "]";
	}
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getMarca() {
		return marca;
	}
	
	public void setMarca(String marca) {
		this.marca = marca;
	}
	
	public String getModelo() {
		return modelo;
	}
	
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	
	public Integer getAnoFabricacao() {
		return anoFabricacao;
	}
	
	public void setAnoFabricacao(Integer anoFabricacao) {
		this.anoFabricacao = anoFabricacao;
	}
	
	public Integer getAnoModelo() {
		return anoModelo;
	}
	
	public void setAnoModelo(Integer anoModelo) {
		this.anoModelo = anoModelo;
	}
	
	public String getCor() {
		return cor;
	}
	
	public void setCor(String cor) {
		this.cor = cor;
	}
	
	public String getPlaca() {
		return placa;
	}
	
	public void setPlaca(String placa) {
		this.placa = placa;
	}
	
	public Date getDataCadastro() {
		return dataCadastro;
	}
	
	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	
	public boolean isAtual() {
		return atual;
	}
	
	public void setAtual(boolean atual) {
		this.atual = atual;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String descricao) {
		this.nome = descricao;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Veiculo other = (Veiculo) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (placa == null) {
			if (other.placa != null)
				return false;
		} else if (!placa.equals(other.placa))
			return false;
		return true;
	}

	public TipoVeiculo getVeiculoTipo() {
		return veiculoTipo;
	}

	public void setVeiculoTipo(TipoVeiculo veiculoTipo) {
		this.veiculoTipo = veiculoTipo;
	}

	public Contratante getContratante() {
		return contratante;
	}

	public void setContratante(Contratante contratante) {
		this.contratante = contratante;
	}
	
}
