package br.com.kolss.model.entities;

import java.io.Serializable;
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
@Table(name = "resposta")
public class Resposta implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", nullable = false, unique = true)
	private Long id;
	
	@Column(name = "descricao", nullable = false)
	private String descricao;
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="resposta")
	private Set<RelacionamentoPerfilFormulario> listRelacionamento;
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="resposta")
	private Set<SubQuestao> listSubQuestao;
	
	@ManyToOne
	@JoinColumn(name = "id_contratante", nullable = true)
	private Contratante contratante;
	

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((descricao == null) ? 0 : descricao.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Resposta other = (Resposta) obj;
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
		return true;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Resposta [id=" + id + ", descricao=" + descricao + "]";
	}

	public Long getId() {
		return id;
	}

	/**
	 * @return the descricao
	 */
	public String getDescricao() {
		return descricao;
	}

	/**
	 * @param descricao the descricao to set
	 */
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the listRelacionamento
	 */
	public Set<RelacionamentoPerfilFormulario> getListRelacionamento() {
		return listRelacionamento;
	}

	/**
	 * @param listRelacionamento the listRelacionamento to set
	 */
	public void setListRelacionamento(
			Set<RelacionamentoPerfilFormulario> listRelacionamento) {
		this.listRelacionamento = listRelacionamento;
	}

	/**
	 * @return the listSubQuestao
	 */
	public Set<SubQuestao> getListSubQuestao() {
		return listSubQuestao;
	}

	/**
	 * @param listSubQuestao the listSubQuestao to set
	 */
	public void setListSubQuestao(Set<SubQuestao> listSubQuestao) {
		this.listSubQuestao = listSubQuestao;
	}

	public Contratante getContratante() {
		return contratante;
	}

	public void setContratante(Contratante contratante) {
		this.contratante = contratante;
	}
}
