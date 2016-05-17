package br.com.kolss.dto;

import br.com.kolss.model.entities.TipoClassificacao;

public class TipoClassificacaoOcorrenciaDTO {

	private String id;
	private String prefixo;
	private String nome;
	private String idGravidade;
	private String idClassificacao;

	public TipoClassificacaoOcorrenciaDTO() {
	}

	public TipoClassificacaoOcorrenciaDTO(TipoClassificacao tipoClassificacao) {
		this.id = tipoClassificacao.getId().toString();
		this.nome = tipoClassificacao.getNome();
		this.prefixo = tipoClassificacao.getPrefixo();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPrefixo() {
		return prefixo;
	}

	public void setPrefixo(String prefixo) {
		this.prefixo = prefixo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getIdGravidade() {
		return idGravidade;
	}

	public void setIdGravidade(String idGravidade) {
		this.idGravidade = idGravidade;
	}

	public String getIdClassificacao() {
		return idClassificacao;
	}

	public void setIdClassificacao(String idClassificacao) {
		this.idClassificacao = idClassificacao;
	}
	
	

}
