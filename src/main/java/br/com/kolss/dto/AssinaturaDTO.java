package br.com.kolss.dto;

/**
 * 
 * @author hamseshenrique
 *
 */
public class AssinaturaDTO {
	
	private byte[] assinatura;
	
	public AssinaturaDTO(){}
	
	public AssinaturaDTO(final byte[] assinatura){
		this.assinatura = assinatura;
	}

	/**
	 * @return the assinatura
	 */
	public byte[] getAssinatura() {
		return assinatura;
	}

	/**
	 * @param assinatura the assinatura to set
	 */
	public void setAssinatura(byte[] assinatura) {
		this.assinatura = assinatura;
	}
}
