package br.com.kolss.dto;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class AtividadeChecklistDTO {

	/**
	 * Chave
	 */
	private String idAtividadeChecklist;

	private String nomeAtividadeCheckList;
	private String dataPrevistaInicio;
	private String nomeStatus;
	private String nomeResponsavel;
	private String nrItem;
	private String qtdAlerta;
	private String corSituacao;
	private String idFormulario;
	private Long idPerfilFormulario;
	private boolean isAtivo;
	private boolean isCampoCheck;

	private static final long serialVersionUID = 2L;

	public AtividadeChecklistDTO() {

	}

	public String getIdAtividadeChecklist() {
		return idAtividadeChecklist;
	}

	public void setIdAtividadeChecklist(String idAtividadeChecklist) {
		this.idAtividadeChecklist = idAtividadeChecklist;
	}

	public String getNomeAtividadeCheckList() {
		return nomeAtividadeCheckList;
	}

	public void setNomeAtividadeCheckList(String nomeAtividadeCheckList) {
		this.nomeAtividadeCheckList = nomeAtividadeCheckList;
	}

	public String getDataPrevistaInicio() {
		return dataPrevistaInicio;
	}

	public void setDataPrevistaInicio(String dataPrevistaInicio) {
		this.dataPrevistaInicio = dataPrevistaInicio;
	}

	public String getNomeStatus() {
		return nomeStatus;
	}

	public void setNomeStatus(String nomeStatus) {
		this.nomeStatus = nomeStatus;
	}

	public String getNomeResponsavel() {
		return nomeResponsavel;
	}

	public void setNomeResponsavel(String nomeResponsavel) {
		this.nomeResponsavel = nomeResponsavel;
	}

	public String getNrItem() {
		return nrItem;
	}

	public void setNrItem(String nrItem) {
		this.nrItem = nrItem;
	}

	public String getQtdAlerta() {
		return qtdAlerta;
	}

	public void setQtdAlerta(String qtdAlerta) {
		this.qtdAlerta = qtdAlerta;
	}

	public String getCorSituacao() {
		return corSituacao;
	}

	public void setCorSituacao(String corSituacao) {
		this.corSituacao = corSituacao;
	}

	public String getIdFormulario() {
		return idFormulario;
	}

	public void setIdFormulario(String idFormulario) {
		this.idFormulario = idFormulario;
	}

	/**
	 * @return the idPerfilFormulario
	 */
	public Long getIdPerfilFormulario() {
		return idPerfilFormulario;
	}

	/**
	 * @param idPerfilFormulario
	 *            the idPerfilFormulario to set
	 */
	public void setIdPerfilFormulario(Long idPerfilFormulario) {
		this.idPerfilFormulario = idPerfilFormulario;
	}

	public boolean isAtivo() {
		return isAtivo;
	}

	public void setAtivo(boolean isAtivo) {
		this.isAtivo = isAtivo;
	}

	public boolean isCampoCheck() {
		return isCampoCheck;
	}

	public void setCampoCheck(boolean isCampoCheck) {
		this.isCampoCheck = isCampoCheck;
	}

}
