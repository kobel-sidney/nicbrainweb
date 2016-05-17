package br.com.kolss.wrapper;

import java.text.SimpleDateFormat;
import java.util.List;

public class RelatorioAtividadeChecklistWrapper {
	
	private String numeroItem;
	private String nomeStatus;
	private String nomeLocal;
	private String nomeAtividade;
	private String nomeEvento;
	private String dataInicioPrevisto;
	private String dataFimPrevisto;
	private String dataInicioRealizado;
	private String dataFimRealizado;
	private String nomeOperador;
	private String telefoneOperador;
	private String nomeImagem;
	private List listaAlertas;
	private List listaComentarios;
	private String observacao;
	
	
	public String getNomeStatus() {
		return nomeStatus;
	}
	public String getNumeroItem() {
		return numeroItem;
	}
	public void setNumeroItem(String numeroItem) {
		this.numeroItem = numeroItem;
	}
	public void setNomeStatus(String nomeStatus) {
		this.nomeStatus = nomeStatus;
	}
	public String getNomeLocal() {
		return nomeLocal;
	}
	public void setNomeLocal(String nomeLocal) {
		this.nomeLocal = nomeLocal;
	}
	public String getNomeAtividade() {
		return nomeAtividade;
	}
	public void setNomeAtividade(String nomeAtividade) {
		this.nomeAtividade = nomeAtividade;
	}
	public String getNomeEvento() {
		return nomeEvento;
	}
	public void setNomeEvento(String nomeEvento) {
		this.nomeEvento = nomeEvento;
	}
	public String getDataInicioPrevisto() {
		return dataInicioPrevisto;
	}
	public void setDataInicioPrevisto(String dataInicioPrevisto) {
		this.dataInicioPrevisto = dataInicioPrevisto;
	}
	public String getDataFimPrevisto() {
		return dataFimPrevisto;
	}
	public void setDataFimPrevisto(String dataFimPrevisto) {
		this.dataFimPrevisto = dataFimPrevisto;
	}
	public String getDataInicioRealizado() {
		return dataInicioRealizado;
	}
	public void setDataInicioRealizado(String dataInicioRealizado) {
		this.dataInicioRealizado = dataInicioRealizado;
	}
	public String getDataFimRealizado() {
		return dataFimRealizado;
	}
	public void setDataFimRealizado(String dataFimRealizado) {
		this.dataFimRealizado = dataFimRealizado;
	}
	public String getNomeOperador() {
		return nomeOperador;
	}
	public void setNomeOperador(String nomeOperador) {
		this.nomeOperador = nomeOperador;
	}
	public String getTelefoneOperador() {
		return telefoneOperador;
	}
	public void setTelefoneOperador(String telefoneOperador) {
		this.telefoneOperador = telefoneOperador;
	}
	public String getNomeImagem() {
		return nomeImagem;
	}
	public void setNomeImagem(String nomeImagem) {
		this.nomeImagem = nomeImagem;
	}
	public List getListaAlertas() {
		return listaAlertas;
	}
	public void setListaAlertas(List listaAlertas) {
		this.listaAlertas = listaAlertas;
	}
	public String getObservacao() {
		return observacao;
	}
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	public List getListaComentarios() {
		return listaComentarios;
	}
	public void setListaComentarios(List listaComentarios) {
		this.listaComentarios = listaComentarios;
	}
	
	
	
}
