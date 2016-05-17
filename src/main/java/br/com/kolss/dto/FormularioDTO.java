package br.com.kolss.dto;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class FormularioDTO {
		
	private String idFormulario;
	private String nomeFormulario;
	private String descricaoFormulario;
	private List<TopicoDTO> listaDeTopicosDTO;
	

	public FormularioDTO() {
	}
	
	public String getIdFormulario() {
		return idFormulario;
	}
	public void setIdFormulario(String idFormulario) {
		this.idFormulario = idFormulario;
	}
	public String getNomeFormulario() {
		return nomeFormulario;
	}
	public void setNomeFormulario(String nomeFormulario) {
		this.nomeFormulario = nomeFormulario;
	}
	public String getDescricaoFormulario() {
		return descricaoFormulario;
	}
	public void setDescricaoFormulario(String descricaoFormulario) {
		this.descricaoFormulario = descricaoFormulario;
	}

	public List<TopicoDTO> getListaDeTopicosDTO() {
		return listaDeTopicosDTO;
	}

	public void setListaDeTopicosDTO(List<TopicoDTO> listaDeTopicosDTO) {
		this.listaDeTopicosDTO = listaDeTopicosDTO;
	}

	
}
