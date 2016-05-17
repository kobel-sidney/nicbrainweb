package br.com.kolss.model.entities;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="resposta_alternativa")
public class RespostaAlternativa extends AbstractEntity<Long>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1394365277244756803L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_resposta_alternativa", nullable = false, unique = true)
	private Long id;
	
	@Basic(optional = false, fetch = FetchType.LAZY)
	@Column(name = "descricao_resposta_alternativa", nullable = false)
	private String descricao;
	

	@Override
	public Long getId() {
		return id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public void setId(Long id) {
		this.id = id;
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
		RespostaAlternativa other = (RespostaAlternativa) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "RespostaAlternativa [id=" + id + ", descricao=" + descricao
				+ "]";
	}
	
	

}
