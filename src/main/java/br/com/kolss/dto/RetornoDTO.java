/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.kolss.dto;


import br.com.kolss.enums.RetornoEnum;

/**
 *
 * @author weverton
 */
public class RetornoDTO {

    /**
     *
     */
    private RetornoEnum retornoEnum;

    public RetornoDTO() {
    }
    
    public RetornoDTO(RetornoEnum retornoEnum) {
        this.retornoEnum = retornoEnum;
    }

    /**
     * @return the retornoEnum
     */
    public RetornoEnum getRetornoEnum() {
        return retornoEnum;
    }

    /**
     * @param retornoEnum the retornoEnum to set
     */
    public void setRetornoEnum(RetornoEnum retornoEnum) {
        this.retornoEnum = retornoEnum;
    }
}
