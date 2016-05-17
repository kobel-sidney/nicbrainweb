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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="troca_veiculo")
public class TrocaVeiculo extends AbstractEntity<Long> {
	
	private static final long serialVersionUID = -6204981766206737850L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_troca_veiculo")
	private Long id;

	@Column(name="data_cadastro")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataCadastro;

	@Column(name="tipo_troca")
	private String tipoTroca;

	//bi-directional many-to-one association to Veiculo
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_veiculo")
	private Veiculo veiculo;
	
	//bi-directional many-to-many association to Pessoa
	@ManyToMany
	@JoinTable(name="troca_veiculo_pessoa", joinColumns={@JoinColumn(name="id_troca_veiculo")}, inverseJoinColumns={@JoinColumn(name="id_pessoa")})
	private Set<Pessoa> pessoas= new HashSet<>(0);


	public TrocaVeiculo() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long  idTrocaVeiculo) {
		this.id = idTrocaVeiculo;
	}

	public Date getDataCadastro() {
		return this.dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public String getTipoTroca() {
		return this.tipoTroca;
	}

	public void setTipoTroca(String tipoTroca) {
		this.tipoTroca = tipoTroca;
	}

	public Set<Pessoa> getPessoas() {
		return this.pessoas;
	}

	public void setPessoas(Set<Pessoa> pessoas) {
		this.pessoas = pessoas;
	}

	public Veiculo getVeiculo() {
		return this.veiculo;
	}

	public void setVeiculo(Veiculo veiculo) {
		this.veiculo = veiculo;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		TrocaVeiculo other = (TrocaVeiculo) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "TrocaVeiculo [id=" + id + ", dataCadastro=" + dataCadastro
				+ ", tipoTroca=" + tipoTroca + ", pessoas=" + pessoas
				+ ", veiculo=" + veiculo + ", trocaVeiculoPessoas="
				+ "]";
	}

	

}