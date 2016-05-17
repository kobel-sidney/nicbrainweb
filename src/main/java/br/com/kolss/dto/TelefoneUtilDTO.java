package br.com.kolss.dto;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * 
 * @author luis.costa
 * 
 */
@XmlRootElement
public class TelefoneUtilDTO {

	private String idTelefoneUtil;
	private String nrTelefoneUtil;
	private String nomeTelefoneUtil;

	public TelefoneUtilDTO() {
	}

	public TelefoneUtilDTO(String idTelefoneUtil, String nrTelefoneUtil,
			String nomeTelefoneUtil) {
		this.idTelefoneUtil = idTelefoneUtil;
		this.nrTelefoneUtil = nrTelefoneUtil;
		this.nomeTelefoneUtil = nomeTelefoneUtil;
	}

	public String getIdTelefoneUtil() {
		return idTelefoneUtil;
	}

	public void setIdTelefoneUtil(String idTelefoneUtil) {
		this.idTelefoneUtil = idTelefoneUtil;
	}

	public String getNrTelefoneUtil() {
		return nrTelefoneUtil;
	}

	public void setNrTelefoneUtil(String nrTelefoneUtil) {
		this.nrTelefoneUtil = nrTelefoneUtil;
	}

	public String getNomeTelefoneUtil() {
		return nomeTelefoneUtil;
	}

	public void setNomeTelefoneUtil(String nomeTelefoneUtil) {
		this.nomeTelefoneUtil = nomeTelefoneUtil;
	}

	@Override
	public boolean equals(Object o) {
		TelefoneUtilDTO vo = (TelefoneUtilDTO) o;
		return (this.idTelefoneUtil.equals(vo.getIdTelefoneUtil())
				&& this.nrTelefoneUtil.equals(vo.getNrTelefoneUtil()) && this.nomeTelefoneUtil
					.equals(vo.getNomeTelefoneUtil()));
	}

}
