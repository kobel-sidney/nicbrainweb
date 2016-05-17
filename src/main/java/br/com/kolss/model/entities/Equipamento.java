package br.com.kolss.model.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "equipamento")
public class Equipamento extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -8197238321487859662L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_equipamento", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_equipamento", nullable = true)
	private String nome;
	
	
	@Column(name = "nr_serie_equipamento", nullable = true)
	private String numeroSerie;
	
	
	@Column(name = "ip_equipamento", nullable = true)
	private String ipEquipamento;
	
	
	@Column(name = "usuario_acesso", nullable = true)
	private String usuario;
	
	
	@Column(name = "senha", nullable = true)
	private String senha;
	
	@Embedded
	private CoordenadaGeografica coordenadas = new CoordenadaGeografica();
	
	@Temporal(TemporalType.TIMESTAMP)
	
	@Column(name = "data_cadastro", nullable = true)
	private Date dataCadastro;
	
	
	@Column(name = "ativo", nullable = false)
	private boolean ativo = false;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_setor", nullable = true)
	private Setor setor = new Setor();
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_modelo_equipamento", nullable = true)
	private ModeloEquipamento modeloEquipamento = new ModeloEquipamento();
	
	@OneToMany(mappedBy = "equipamento", fetch = FetchType.LAZY)
	private Set<VeiculoAleatorio> veiculosAleatorios =
			new HashSet<VeiculoAleatorio>();
	
	
	/** Método Construtor padrão. */
	public Equipamento() {
		super();
	}
	
	/**
	 * Método Construtor
	 * 
	 * @param id
	 * @param nome
	 * @param numeroSerie
	 * @param ipEquipamento
	 * @param usuario
	 * @param senha
	 * @param latitude
	 * @param longitude
	 * @param dataCadastro
	 * @param ativo
	 * @param setor
	 * @param modeloEquipamento
	 */
	public Equipamento(Long id, String nome, String numeroSerie,
			String ipEquipamento, String usuario, String senha,
			String latitude, String longitude, Date dataCadastro,
			boolean ativo, Setor setor, ModeloEquipamento modeloEquipamento) {
		super();
		this.id = id;
		this.nome = nome;
		this.numeroSerie = numeroSerie;
		this.ipEquipamento = ipEquipamento;
		this.usuario = usuario;
		this.senha = senha;
		this.coordenadas.setLatitude(latitude);
		this.coordenadas.setLongitude(longitude);
		this.dataCadastro = dataCadastro;
		this.ativo = ativo;
		this.setor = setor;
		this.modeloEquipamento = modeloEquipamento;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (ativo ? 1231 : 1237);
		result = prime * result
				+ ((dataCadastro == null) ? 0 : dataCadastro.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((ipEquipamento == null) ? 0 : ipEquipamento.hashCode());
		result = prime * result
				+ ((coordenadas == null) ? 0 : coordenadas.hashCode());
		result = prime * result
				+ ((modeloEquipamento == null) ? 0
						: modeloEquipamento.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result
				+ ((numeroSerie == null) ? 0 : numeroSerie.hashCode());
		result = prime * result + ((senha == null) ? 0 : senha.hashCode());
		result = prime * result + ((setor == null) ? 0 : setor.hashCode());
		result = prime * result + ((usuario == null) ? 0 : usuario.hashCode());
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
		Equipamento other = (Equipamento) obj;
		if (ativo != other.ativo)
			return false;
		if (dataCadastro == null) {
			if (other.dataCadastro != null)
				return false;
		} else if (!dataCadastro.equals(other.dataCadastro))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (ipEquipamento == null) {
			if (other.ipEquipamento != null)
				return false;
		} else if (!ipEquipamento.equals(other.ipEquipamento))
			return false;
		if (coordenadas == null) {
			if (other.coordenadas != null)
				return false;
		} else if (!coordenadas.equals(other.coordenadas))
			return false;
		if (modeloEquipamento == null) {
			if (other.modeloEquipamento != null)
				return false;
		} else if (!modeloEquipamento.equals(other.modeloEquipamento))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (numeroSerie == null) {
			if (other.numeroSerie != null)
				return false;
		} else if (!numeroSerie.equals(other.numeroSerie))
			return false;
		if (senha == null) {
			if (other.senha != null)
				return false;
		} else if (!senha.equals(other.senha))
			return false;
		if (setor == null) {
			if (other.setor != null)
				return false;
		} else if (!setor.equals(other.setor))
			return false;
		if (usuario == null) {
			if (other.usuario != null)
				return false;
		} else if (!usuario.equals(other.usuario))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Equipamento [id=" + id
				+ ", nome=" + nome
				+ ", numeroSerie=" + numeroSerie
				+ ", ipEquipamento=" + ipEquipamento
				+ ", usuario=" + usuario
				+ ", senha=" + senha
				+ ", " + coordenadas
				+ ", dataCadastro=" + dataCadastro
				+ ", ativo=" + ativo
				+ ", setor=" + setor
				+ ", modeloEquipamento=" + modeloEquipamento
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
	
	public String getNumeroSerie() {
		return numeroSerie;
	}
	
	public void setNumeroSerie(String numeroSerie) {
		this.numeroSerie = numeroSerie;
	}
	
	public String getIpEquipamento() {
		return ipEquipamento;
	}
	
	public void setIpEquipamento(String ipEquipamento) {
		this.ipEquipamento = ipEquipamento;
	}
	
	public String getUsuario() {
		return usuario;
	}
	
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	
	public String getSenha() {
		return senha;
	}
	
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public String getLatitude() {
		return this.coordenadas.getLatitude();
	}
	
	public void setLatitude(String latitude) {
		this.coordenadas.setLatitude(latitude);
	}
	
	public String getLongitude() {
		return this.coordenadas.getLongitude();
	}
	
	public void setLongitude(String longitude) {
		this.coordenadas.setLongitude(longitude);
	}
	
	public Date getDataCadastro() {
		return dataCadastro;
	}
	
	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	
	public boolean isAtivo() {
		return ativo;
	}
	
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	
	public Setor getSetor() {
		return setor;
	}
	
	public void setSetor(Setor setor) {
		this.setor = setor;
	}
	
	public ModeloEquipamento getModeloEquipamento() {
		return modeloEquipamento;
	}
	
	public void setModeloEquipamento(ModeloEquipamento modeloEquipamento) {
		this.modeloEquipamento = modeloEquipamento;
	}
	
	public Set<VeiculoAleatorio> getVeiculosAleatorios() {
		return veiculosAleatorios;
	}
	
	public void setVeiculosAleatorios(Set<VeiculoAleatorio> veiculosAleatorios) {
		this.veiculosAleatorios = veiculosAleatorios;
	}
	
}
