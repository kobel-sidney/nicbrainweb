package br.com.kolss.dto;

import java.util.List;

import br.com.kolss.model.entities.Coordenada;

public class CercaVirtualDTO {

	private Integer idCercaVirtual;
	private Long idLocal;
	private String cor;
	private String descricao;
	private List<CoordenadaDTO> coordenadas;

	public Long getIdLocal() {
		return idLocal;
	}

	public void setIdLocal(Long idLocal) {
		this.idLocal = idLocal;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public List<CoordenadaDTO> getCoordenadas() {
		return coordenadas;
	}

	public void setCoordenadas(List<CoordenadaDTO> coordenadas) {
		this.coordenadas = coordenadas;
	}

	public Integer getIdCercaVirtual() {
		return idCercaVirtual;
	}

	public void setIdCercaVirtual(Integer idCercaVirtual) {
		this.idCercaVirtual = idCercaVirtual;
	}

}
