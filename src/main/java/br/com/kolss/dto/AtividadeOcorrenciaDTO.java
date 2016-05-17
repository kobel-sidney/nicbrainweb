package br.com.kolss.dto;


import java.io.Serializable;

public class AtividadeOcorrenciaDTO implements Serializable {

	/**
	 * serialVersionUID	
	 */
	private static final long serialVersionUID = -9132670269858861527L;
	
		private String idAtividadeOcorrencia;
		private Long idOcorrencia;
		private String dtInicioAtividade;
		private String dtFimExecucaoAtividade;
		private String observacao;
		private String descricaoStatus;
		private String descricaoProcedimentoOcorrencia;
		private String grResponsavel;
	
		
	public AtividadeOcorrenciaDTO(String idAtividadeOcorrencia,
			Long idOcorrencia, String dtInicioAtividade,
			String dtFimExecucaoAtividade, String observacao,
			String descricaoStatus, String descricaoProcedimentoOcorrencia,
			String grResponsavel) {
		super();
		this.idAtividadeOcorrencia = idAtividadeOcorrencia;
		this.idOcorrencia = idOcorrencia;
		this.dtInicioAtividade = dtInicioAtividade;
		this.dtFimExecucaoAtividade = dtFimExecucaoAtividade;
		this.observacao = observacao;
		this.descricaoStatus = descricaoStatus;
		this.descricaoProcedimentoOcorrencia = descricaoProcedimentoOcorrencia;
		this.grResponsavel = grResponsavel;
	}



	public String getIdAtividadeOcorrencia() {
		return idAtividadeOcorrencia;
	}



	public void setIdAtividadeOcorrencia(String idAtividadeOcorrencia) {
		this.idAtividadeOcorrencia = idAtividadeOcorrencia;
	}



	public String getDtFimExecucaoAtividade() {
		return dtFimExecucaoAtividade;
	}



	public void setDtFimExecucaoAtividade(String dtFimExecucaoAtividade) {
		this.dtFimExecucaoAtividade = dtFimExecucaoAtividade;
	}


	public AtividadeOcorrenciaDTO() {
	}



	



	public Long getIdOcorrencia() {
		return idOcorrencia;
	}

	public void setIdOcorrencia(Long idOcorrencia) {
		this.idOcorrencia = idOcorrencia;
	}

	public String getDtInicioAtividade() {
		return dtInicioAtividade;
	}

	public void setDtInicioAtividade(String dtInicioAtividade) {
		this.dtInicioAtividade = dtInicioAtividade;
	}


	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public String getDescricaoStatus() {
		return descricaoStatus;
	}

	public void setDescricaoStatus(String descricaoStatus) {
		this.descricaoStatus = descricaoStatus;
	}

	public String getDescricaoProcedimentoOcorrencia() {
		return descricaoProcedimentoOcorrencia;
	}

	public void setDescricaoProcedimentoOcorrencia(
			String descricaoProcedimentoOcorrencia) {
		this.descricaoProcedimentoOcorrencia = descricaoProcedimentoOcorrencia;
	}

	public String getGrResponsavel() {
		return grResponsavel;
	}

	public void setGrResponsavel(String grResponsavel) {
		this.grResponsavel = grResponsavel;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime
				* result
				+ ((descricaoProcedimentoOcorrencia == null) ? 0
						: descricaoProcedimentoOcorrencia.hashCode());
		result = prime * result
				+ ((descricaoStatus == null) ? 0 : descricaoStatus.hashCode());
		result = prime
				* result
				+ ((dtFimExecucaoAtividade == null) ? 0
						: dtFimExecucaoAtividade.hashCode());
		result = prime
				* result
				+ ((dtInicioAtividade == null) ? 0 : dtInicioAtividade
						.hashCode());
		result = prime * result
				+ ((grResponsavel == null) ? 0 : grResponsavel.hashCode());
		result = prime
				* result
				+ ((idAtividadeOcorrencia == null) ? 0 : idAtividadeOcorrencia
						.hashCode());
		result = prime * result
				+ ((idOcorrencia == null) ? 0 : idOcorrencia.hashCode());
		result = prime * result
				+ ((observacao == null) ? 0 : observacao.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AtividadeOcorrenciaDTO other = (AtividadeOcorrenciaDTO) obj;
		if (descricaoProcedimentoOcorrencia == null) {
			if (other.descricaoProcedimentoOcorrencia != null)
				return false;
		} else if (!descricaoProcedimentoOcorrencia
				.equals(other.descricaoProcedimentoOcorrencia))
			return false;
		if (descricaoStatus == null) {
			if (other.descricaoStatus != null)
				return false;
		} else if (!descricaoStatus.equals(other.descricaoStatus))
			return false;
		if (dtFimExecucaoAtividade == null) {
			if (other.dtFimExecucaoAtividade != null)
				return false;
		} else if (!dtFimExecucaoAtividade.equals(other.dtFimExecucaoAtividade))
			return false;
		if (dtInicioAtividade == null) {
			if (other.dtInicioAtividade != null)
				return false;
		} else if (!dtInicioAtividade.equals(other.dtInicioAtividade))
			return false;
		if (grResponsavel == null) {
			if (other.grResponsavel != null)
				return false;
		} else if (!grResponsavel.equals(other.grResponsavel))
			return false;
		if (idAtividadeOcorrencia == null) {
			if (other.idAtividadeOcorrencia != null)
				return false;
		} else if (!idAtividadeOcorrencia.equals(other.idAtividadeOcorrencia))
			return false;
		if (idOcorrencia == null) {
			if (other.idOcorrencia != null)
				return false;
		} else if (!idOcorrencia.equals(other.idOcorrencia))
			return false;
		if (observacao == null) {
			if (other.observacao != null)
				return false;
		} else if (!observacao.equals(other.observacao))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "AtividadeOcorrenciaREST [idAtividadeOcorrencia="
				+ idAtividadeOcorrencia + ", idOcorrencia=" + idOcorrencia
				+ ", dtInicioAtividade=" + dtInicioAtividade
				+ ", dtFimExecucaoAtividade=" + dtFimExecucaoAtividade
				+ ", observacao=" + observacao + ", descricaoStatus="
				+ descricaoStatus + ", descricaoProcedimentoOcorrencia="
				+ descricaoProcedimentoOcorrencia + ", grResponsavel="
				+ grResponsavel + "]";
	}

}
