package br.com.kolss.dto;

import br.com.kolss.model.entities.Ocorrencia;
import br.com.kolss.util.DataUtil;

/**
 *
 * @author weverton
 */
public class OcorrenciaRondaDTO {

	private Long idOcorrencia;
	private String descricaoOcorrencia;
	private String dataInicio;
	private String horaInicio;
	private String latitude;
	private String longitude;
	private ClassificacaoOcorrenciaRondaDTO classificacao;
	private TipoClassificacaoOcorrenciaDTO tipoClassificacao;
	private String gravidade;
	private Long idResponsavel;
	private byte[] foto;

	public OcorrenciaRondaDTO() {
	}

	public OcorrenciaRondaDTO(Ocorrencia occurrence) {
		this.idOcorrencia = occurrence.getId();
		this.descricaoOcorrencia = occurrence.getDescricaoOcorrencia();
		this.dataInicio = DataUtil.getSomenteData(occurrence.getDataInicio());
		this.horaInicio = DataUtil.getSomenteHora(occurrence.getDataInicio());
		this.latitude = occurrence.getLatitude();
		this.longitude = occurrence.getLongitude();
		this.classificacao = new ClassificacaoOcorrenciaRondaDTO(occurrence.getClassificacaoOcorrencia());
		this.tipoClassificacao = new TipoClassificacaoOcorrenciaDTO(occurrence.getTipoClassificacao());
		this.gravidade = occurrence.getGravidadeOcorrencia().getNome();
		this.idResponsavel = occurrence.getUsuarioResponsavel().getId();
		this.foto = occurrence.getFoto();
	}

	public Long getIdOcorrencia() {
		return idOcorrencia;
	}

	public void setIdOcorrencia(Long idOcorrencia) {
		this.idOcorrencia = idOcorrencia;
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

	public ClassificacaoOcorrenciaRondaDTO getClassificacao() {
		return classificacao;
	}

	public void setClassificacao(ClassificacaoOcorrenciaRondaDTO classificacao) {
		this.classificacao = classificacao;
	}

	public TipoClassificacaoOcorrenciaDTO getTipoClassificacao() {
		return tipoClassificacao;
	}

	public void setTipoClassificacao(TipoClassificacaoOcorrenciaDTO tipoClassificacao) {
		this.tipoClassificacao = tipoClassificacao;
	}

	public String getGravidade() {
		return gravidade;
	}

	public void setGravidade(String gravidade) {
		this.gravidade = gravidade;
	}

	public String getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(String dataInicio) {
		this.dataInicio = dataInicio;
	}

	public String getHoraInicio() {
		return horaInicio;
	}

	public void setHoraInicio(String horaInicio) {
		this.horaInicio = horaInicio;
	}

	public Long getIdResponsavel() {
		return idResponsavel;
	}

	public void setIdResponsavel(Long idResponsavel) {
		this.idResponsavel = idResponsavel;
	}

	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

}
