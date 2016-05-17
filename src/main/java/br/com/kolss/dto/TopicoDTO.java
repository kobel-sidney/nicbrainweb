package br.com.kolss.dto;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
public class TopicoDTO {


	private String idTopico;
	private String nome;
	
	private List<PerguntaDTO> listaDePerguntas;
	
	public String getIdTopico() {
		return idTopico;
	}
	public void setIdTopico(String idTopico) {
		this.idTopico = idTopico;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public List<PerguntaDTO> getListaDePerguntas() {
		return listaDePerguntas;
	}
	public void setListaDePerguntas(List<PerguntaDTO> listaDePerguntas) {
		this.listaDePerguntas = listaDePerguntas;
	}
	
}
