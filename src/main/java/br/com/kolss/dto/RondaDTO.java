/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.kolss.dto;

import java.util.List;

import br.com.kolss.enums.RetornoEnum;

/**
 *
 * @author weverton
 */
public class RondaDTO extends RetornoDTO {

    private Long idLocal;
    private String descricaoLocal;
    private Long idSetor;
    private String descricaoSetor;
    private Long idUsuario;
    private String nomeUsuario;
    private Long idVeiculo;
    private String descricaoVeiculo;
    private LocationDTO locationDTO;
    private String date;
    private List<GuarnicaoDTO> guarnicoes;

    public RondaDTO() {
    }

    public RondaDTO(final RetornoEnum retornoEnum) {
        this.setRetornoEnum(retornoEnum);
    }

    /**
     * @return the idLocal
     */
    public Long getIdLocal() {
        return idLocal;
    }

    /**
     * @param idLocal the idLocal to set
     */
    public void setIdLocal(Long idLocal) {
        this.idLocal = idLocal;
    }

    /**
     * @return the idSetor
     */
    public Long getIdSetor() {
        return idSetor;
    }

    /**
     * @param idSetor the idSetor to set
     */
    public void setIdSetor(Long idSetor) {
        this.idSetor = idSetor;
    }

    /**
     * @return the idUsuario
     */
    public Long getIdUsuario() {
        return idUsuario;
    }

    /**
     * @param idUsuario the idUsuario to set
     */
    public void setIdUsuario(Long idUsuario) {
        this.idUsuario = idUsuario;
    }

    /**
     * @return the idVeiculo
     */
    public Long getIdVeiculo() {
        return idVeiculo;
    }

    /**
     * @param idVeiculo the idVeiculo to set
     */
    public void setIdVeiculo(Long idVeiculo) {
        this.idVeiculo = idVeiculo;
    }

    /**
     * @return the locationDTO
     */
    public LocationDTO getLocationDTO() {
        return locationDTO;
    }

    /**
     * @param locationDTO the locationDTO to set
     */
    public void setLocationDTO(LocationDTO locationDTO) {
        this.locationDTO = locationDTO;
    }

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the descricaoLocal
     */
    public String getDescricaoLocal() {
        return descricaoLocal;
    }

    /**
     * @param descricaoLocal the descricaoLocal to set
     */
    public void setDescricaoLocal(String descricaoLocal) {
        this.descricaoLocal = descricaoLocal;
    }

    /**
     * @return the descricaoSetor
     */
    public String getDescricaoSetor() {
        return descricaoSetor;
    }

    /**
     * @param descricaoSetor the descricaoSetor to set
     */
    public void setDescricaoSetor(String descricaoSetor) {
        this.descricaoSetor = descricaoSetor;
    }

    /**
     * @return the nomeUsuario
     */
    public String getNomeUsuario() {
        return nomeUsuario;
    }

    /**
     * @param nomeUsuario the nomeUsuario to set
     */
    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    /**
     * @return the descricaoVeiculo
     */
    public String getDescricaoVeiculo() {
        return descricaoVeiculo;
    }

    /**
     * @param descricaoVeiculo the descricaoVeiculo to set
     */
    public void setDescricaoVeiculo(String descricaoVeiculo) {
        this.descricaoVeiculo = descricaoVeiculo;
    }

    /**
     * 
     * @return
     */
	public List<GuarnicaoDTO> getGuarnicoes() {
		return guarnicoes;
	}

	/**
	 * 
	 * @param guarnicoes
	 */
	public void setGuarnicoes(List<GuarnicaoDTO> guarnicoes) {
		this.guarnicoes = guarnicoes;
	}
    
}
