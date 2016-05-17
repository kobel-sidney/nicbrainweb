package br.com.kolss.dto;

import java.io.Serializable;


public class PendenciaOcorrenciaDTO implements Serializable {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -1647823958452553594L;
	
	private String idOcorrencia;
	private String nomeLocal;
	private String nomeEvento;
	private String nomeClassificacaoOcorrencia;
	private String nivelGravidade;
	private String descricao;
	private String dtInicio;
	private String descricaoStatus;
	private String nomeTipoClassificacao;
	
	public PendenciaOcorrenciaDTO() {
	}

	public PendenciaOcorrenciaDTO(String idOcorrencia, String nomeLocal, String nomeEvento,
			String nomeClassificacaoOcorrencia, String nivelGravidade,
			String descricao, String dtInicio, String descricaoStatus) {
		super();
		this.setIdOcorrencia(idOcorrencia);
		this.nomeLocal = nomeLocal;
		this.nomeEvento = nomeEvento;
		this.nomeClassificacaoOcorrencia = nomeClassificacaoOcorrencia;
		this.nivelGravidade = nivelGravidade;
		this.descricao = descricao;
		this.dtInicio = dtInicio;
		this.descricaoStatus = descricaoStatus;
	}

	public String getNomeLocal() {
		return nomeLocal;
	}

	public void setNomeLocal(String nomeLocal) {
		this.nomeLocal = nomeLocal;
	}

	public String getNomeEvento() {
		return nomeEvento;
	}

	public void setNomeEvento(String nomeEvento) {
		this.nomeEvento = nomeEvento;
	}

	public String getNomeClassificacaoOcorrencia() {
		return nomeClassificacaoOcorrencia;
	}

	public void setNomeClassificacaoOcorrencia(String nomeClassificacaoOcorrencia) {
		this.nomeClassificacaoOcorrencia = nomeClassificacaoOcorrencia;
	}

	public String getNivelGravidade() {
		return nivelGravidade;
	}

	public void setNivelGravidade(String nivelGravidade) {
		this.nivelGravidade = nivelGravidade;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDtInicio() {
		return dtInicio;
	}

	public void setDtInicio(String dtInicio) {
		this.dtInicio = dtInicio;
	}

	public String getDescricaoStatus() {
		return descricaoStatus;
	}

	public void setDescricaoStatus(String descricaoStatus) {
		this.descricaoStatus = descricaoStatus;
	}

	public String getIdOcorrencia() {
		return idOcorrencia;
	}

	public void setIdOcorrencia(String idOcorrencia) {
		this.idOcorrencia = idOcorrencia;
	}

	public String getNomeTipoClassificacao() {
		return nomeTipoClassificacao;
	}

	public void setNomeTipoClassificacao(String nomeTipoClassificacao) {
		this.nomeTipoClassificacao = nomeTipoClassificacao;
	}

}