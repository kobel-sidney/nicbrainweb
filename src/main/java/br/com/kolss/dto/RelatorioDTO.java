package br.com.kolss.dto;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

import br.com.kolss.enums.TipoExportRelatorioEnum;

public class RelatorioDTO implements Serializable{
	
	private String destino;
	private String realPath;
	private List<?> conteudo;
	private HashMap<String, Object> parametros;
	private TipoExportRelatorioEnum tipoExportRelatorioEnum;
	
	public RelatorioDTO(){}

	/**
	 * @return the destino
	 */
	public String getDestino() {
		return destino;
	}

	/**
	 * @param destino the destino to set
	 */
	public void setDestino(String destino) {
		this.destino = destino;
	}

	/**
	 * @return the realPath
	 */
	public String getRealPath() {
		return realPath;
	}

	/**
	 * @param realPath the realPath to set
	 */
	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}

	/**
	 * @return the conteudo
	 */
	public List<?> getConteudo() {
		return conteudo;
	}

	/**
	 * @param conteudo the conteudo to set
	 */
	public void setConteudo(List<?> conteudo) {
		this.conteudo = conteudo;
	}

	/**
	 * @return the parametros
	 */
	public HashMap<String, Object> getParametros() {
		return parametros;
	}

	/**
	 * @param parametros the parametros to set
	 */
	public void setParametros(HashMap<String, Object> parametros) {
		this.parametros = parametros;
	}

	/**
	 * @return the tipoExportRelatorioEnum
	 */
	public TipoExportRelatorioEnum getTipoExportRelatorioEnum() {
		return tipoExportRelatorioEnum;
	}

	/**
	 * @param tipoExportRelatorioEnum the tipoExportRelatorioEnum to set
	 */
	public void setTipoExportRelatorioEnum(
			TipoExportRelatorioEnum tipoExportRelatorioEnum) {
		this.tipoExportRelatorioEnum = tipoExportRelatorioEnum;
	}
}