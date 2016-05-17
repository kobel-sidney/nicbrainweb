package br.com.kolss.dto;

import java.io.Serializable;
import java.util.Date;

public class OcorrenciaDTO implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;


	private String id;
	private String idOcorrencia;
	private String idUsuario;
	private String idEvento;
	private String idAtividade;
	private String idClassificacaoOcorrencia;
	private String idGravidadeOcorrencia;
	private String idTipoClassificacaoOcorrencia;
	private String idStatus;
	private String descricaoOcorrencia;
	private String latitude;
	private String longitude;
	private Date dataInicio;
	private Date dataFim;
	private Date dataUltimaAtualizacao;
	private String photoUpload;
	

	public OcorrenciaDTO() {
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getIdOcorrencia() {
		return idOcorrencia;
	}


	public void setIdOcorrencia(String idOcorrencia) {
		this.idOcorrencia = idOcorrencia;
	}


	public String getIdUsuario() {
		return idUsuario;
	}


	public void setIdUsuario(String idUsuario) {
		this.idUsuario = idUsuario;
	}


	public String getIdEvento() {
		return idEvento;
	}


	public void setIdEvento(String idEvento) {
		this.idEvento = idEvento;
	}


	public String getIdAtividade() {
		return idAtividade;
	}


	public void setIdAtividade(String idAtividade) {
		this.idAtividade = idAtividade;
	}


	public String getIdClassificacaoOcorrencia() {
		return idClassificacaoOcorrencia;
	}


	public void setIdClassificacaoOcorrencia(String idClassificacaoOcorrencia) {
		this.idClassificacaoOcorrencia = idClassificacaoOcorrencia;
	}


	public String getIdGravidadeOcorrencia() {
		return idGravidadeOcorrencia;
	}


	public void setIdGravidadeOcorrencia(String idGravidadeOcorrencia) {
		this.idGravidadeOcorrencia = idGravidadeOcorrencia;
	}


	public String getIdTipoClassificacaoOcorrencia() {
		return idTipoClassificacaoOcorrencia;
	}


	public void setIdTipoClassificacaoOcorrencia(String idTipoClassificacaoOcorrencia) {
		this.idTipoClassificacaoOcorrencia = idTipoClassificacaoOcorrencia;
	}


	public String getIdStatus() {
		return idStatus;
	}


	public void setIdStatus(String idStatus) {
		this.idStatus = idStatus;
	}


	public String getDescricaoOcorrencia() {
		return descricaoOcorrencia;
	}


	public void setDescricaoOcorrencia(String descricaoOcorrencia) {
		this.descricaoOcorrencia = descricaoOcorrencia;
	}


	public String getLatitude() {
		return latitude;
	}


	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}


	public String getLongitude() {
		return longitude;
	}


	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}


	public Date getDataInicio() {
		return dataInicio;
	}


	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}


	public Date getDataFim() {
		return dataFim;
	}


	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}


	public Date getDataUltimaAtualizacao() {
		return dataUltimaAtualizacao;
	}


	public void setDataUltimaAtualizacao(Date dataUltimaAtualizacao) {
		this.dataUltimaAtualizacao = dataUltimaAtualizacao;
	}


	public String getPhotoUpload() {
		return photoUpload;
	}


	public void setPhotoUpload(String photoUpload) {
		this.photoUpload = photoUpload;
	}
	
	
	

	
}
