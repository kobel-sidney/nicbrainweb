package br.com.kolss.dto;

import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
public class RespostaAlternativaDTO {

	private String idRespostaAlternativa;
	private String descricaoRespostaAlternativa;
	
	public String getIdRespostaAlternativa() {
		return idRespostaAlternativa;
	}
	public void setIdRespostaAlternativa(String idRespostaAlternativa) {
		this.idRespostaAlternativa = idRespostaAlternativa;
	}
	public String getDescricaoRespostaAlternativa() {
		return descricaoRespostaAlternativa;
	}
	public void setDescricaoRespostaAlternativa(String descricaoRespostaAlternativa) {
		this.descricaoRespostaAlternativa = descricaoRespostaAlternativa;
	}
	
	
}
