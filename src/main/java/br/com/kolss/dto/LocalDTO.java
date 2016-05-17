package br.com.kolss.dto;

import javax.xml.bind.annotation.XmlRootElement;

import br.com.kolss.model.entities.Local;

@XmlRootElement
public class LocalDTO {

	private String idLocal;
	private String nomeLocal;

	public LocalDTO() {
	}

	public LocalDTO(String idLocal, String nomeLocal) {
		this.idLocal = idLocal;
		this.nomeLocal = nomeLocal;
	}

	public LocalDTO(Local local) {
		this.idLocal = local.getId().toString();
		this.nomeLocal = local.getNome();
	}

	public String getIdLocal() {
		return idLocal;
	}

	public void setIdLocal(String idLocal) {
		this.idLocal = idLocal;
	}

	public String getNomeLocal() {
		return nomeLocal;
	}

	public void setNomeLocal(String nomeLocal) {
		this.nomeLocal = nomeLocal;
	}

}
