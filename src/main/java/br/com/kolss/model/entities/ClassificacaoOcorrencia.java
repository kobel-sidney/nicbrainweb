package br.com.kolss.model.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name = "classificacao_ocorrencia")
public class ClassificacaoOcorrencia extends AbstractEntity<Long> {

	/** serialVersionUID */
	private static final long serialVersionUID = 8317704012185133210L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_classificacao_ocorrencia", nullable = false, unique = true)
	private Long id;

	@Column(name = "nome_classificacao_ocorrencia", nullable = false)
	private String nome;

	@Lob
	@Basic(optional = true, fetch = FetchType.LAZY)
	@Column(name = "icone", nullable = true)
	private byte[] icone;

	@Lob
	@Basic(optional = true, fetch = FetchType.LAZY)
	@Column(name = "pin", nullable = true)
	private byte[] pin;

	@Column(name = "url_imagem_classificacao", nullable = true)
	private String urlImagemClassificacao;

	@OneToMany(mappedBy = "classificacaoOcorrencia", fetch = FetchType.LAZY)
	private Set<TipoClassificacao> tiposClassificacoes = new HashSet<TipoClassificacao>(0);

	@OneToMany(mappedBy = "classificacaoOcorrencia", fetch = FetchType.LAZY)
	@Cascade({ CascadeType.SAVE_UPDATE, CascadeType.DELETE })
	private Set<ClassificacaoProcedimento> classificacoesProcedimentos = new HashSet<ClassificacaoProcedimento>(0);

	@OneToMany(mappedBy = "classificacaoOcorrencia", fetch = FetchType.LAZY)
	private Set<ClassificacaoOcorrenciaMensagem> classificacoesOcorrenciasMensagens = new HashSet<ClassificacaoOcorrenciaMensagem>(
			0);

	@ManyToMany
	@JoinTable(name = "cliente_class_ocorr", joinColumns = @JoinColumn(name = "id_classificacao_ocorrencia") , inverseJoinColumns = @JoinColumn(name = "id_cliente") )
	private Set<Cliente> clientes = new HashSet<Cliente>(0);

	@ManyToOne
	@JoinColumn(name = "id_contratante", nullable = true)
	private Contratante contratante;

	/** Método Construtor padrão. */
	public ClassificacaoOcorrencia() {
		super();
	}

	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 */
	public ClassificacaoOcorrencia(Long id, String nome) {
		this(id, nome, null);
	}

	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 * @param icone
	 */
	public ClassificacaoOcorrencia(Long id, String nome, byte[] icone) {
		this();
		this.id = id;
		this.nome = nome;
		this.icone = icone;
	}

	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 * @param icone
	 */
	public ClassificacaoOcorrencia(Long id, String nome, byte[] icone, String urlImagemClassificacao) {
		this();
		this.id = id;
		this.nome = nome;
		this.icone = icone;
		this.urlImagemClassificacao = urlImagemClassificacao;
	}

	public ClassificacaoOcorrencia(Long id) {
		this.id = id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
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
		ClassificacaoOcorrencia other = (ClassificacaoOcorrencia) obj;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ClassificacaoOcorrencia [id=" + id + ", nome=" + nome + "]";
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

	public byte[] getIcone() {
		return icone;
	}

	public void setIcone(byte[] icone) {
		this.icone = icone;
	}

	public byte[] getPin() {
		return pin;
	}

	public void setPin(byte[] pin) {
		this.pin = pin;
	}

	public String getUrlImagemClassificacao() {
		return urlImagemClassificacao;
	}

	public void setUrlImagemClassificacao(String urlImagemClassificacao) {
		this.urlImagemClassificacao = urlImagemClassificacao;
	}

	public Set<TipoClassificacao> getTiposClassificacoes() {
		return tiposClassificacoes;
	}

	public void setTiposClassificacoes(Set<TipoClassificacao> tiposClassificacoes) {
		this.tiposClassificacoes = tiposClassificacoes;
	}

	public Set<ClassificacaoProcedimento> getClassificacoesProcedimentos() {
		return classificacoesProcedimentos;
	}

	public void setClassificacoesProcedimentos(Set<ClassificacaoProcedimento> classificacoesProcedimentos) {
		this.classificacoesProcedimentos = classificacoesProcedimentos;
	}

	public Set<ClassificacaoOcorrenciaMensagem> getClassificacoesOcorrenciasMensagens() {
		return classificacoesOcorrenciasMensagens;
	}

	public void setClassificacoesOcorrenciasMensagens(
			Set<ClassificacaoOcorrenciaMensagem> classificacoesOcorrenciasMensagens) {
		this.classificacoesOcorrenciasMensagens = classificacoesOcorrenciasMensagens;
	}

	public Set<Cliente> getClientes() {
		return clientes;
	}

	public void setClientes(Set<Cliente> clientes) {
		this.clientes = clientes;
	}

	public Contratante getContratante() {
		return contratante;
	}

	public void setContratante(Contratante contratante) {
		this.contratante = contratante;
	}

}
