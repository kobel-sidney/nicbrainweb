package br.com.kolss.dto;

import java.util.List;

public class ListaOperacaoAtividadeCoordenadasDTO {

	private String duracao;
	private String inicio;
	private String fim;
	private List<OperacaoAtividadeCoordenadasDTO> coordenadas;

	public String getDuracao() {
		return duracao;
	}

	public void setDuracao(String duracao) {
		this.duracao = duracao;
	}

	public String getInicio() {
		return inicio;
	}

	public void setInicio(String inicio) {
		this.inicio = inicio;
	}

	public String getFim() {
		return fim;
	}

	public void setFim(String fim) {
		this.fim = fim;
	}

	public List<OperacaoAtividadeCoordenadasDTO> getCoordenadas() {
		return coordenadas;
	}

	public void setCoordenadas(List<OperacaoAtividadeCoordenadasDTO> coordenadas) {
		this.coordenadas = coordenadas;
	}
}
