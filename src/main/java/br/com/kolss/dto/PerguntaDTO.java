package br.com.kolss.dto;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class PerguntaDTO {
	
	private String idPergunta;
	private String nome;
	private boolean obrigatorio;
	private boolean respostaMultipla;
	private boolean tipoPontuacao;
	private int qtdVezes;
	private List<RespostaAlternativaDTO> listaDeRespostasAlternativas;
	
	
	public String getIdPergunta() {
		return idPergunta;
	}
	public void setIdPergunta(String idPergunta) {
		this.idPergunta = idPergunta;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public boolean isObrigatorio() {
		return obrigatorio;
	}
	public void setObrigatorio(boolean obrigatorio) {
		this.obrigatorio = obrigatorio;
	}
	public boolean isRespostaMultipla() {
		return respostaMultipla;
	}
	public void setRespostaMultipla(boolean respostaMultipla) {
		this.respostaMultipla = respostaMultipla;
	}
	public int getQtdVezes() {
		return qtdVezes;
	}
	public void setQtdVezes(int qtdVezes) {
		this.qtdVezes = qtdVezes;
	}
	public boolean isTipoPontuacao() {
		return tipoPontuacao;
	}
	public void setTipoPontuacao(boolean tipoPontuacao) {
		this.tipoPontuacao = tipoPontuacao;
	}
	
	public List<RespostaAlternativaDTO> getListaDeRespostasAlternativas() {
		return listaDeRespostasAlternativas;
	}
	public void setListaDeRespostasAlternativas(
			List<RespostaAlternativaDTO> listaDeRespostasAlternativas) {
		this.listaDeRespostasAlternativas = listaDeRespostasAlternativas;
	}
	
	
}
