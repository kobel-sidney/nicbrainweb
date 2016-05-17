package br.com.kolss.dto;
import br.com.kolss.enums.RetornoEnum;


/**
 *
 * @author adansbento
 */
public class RetornoAberturaOcorrenciaDTO {


	/**
     *
     */
	private String idOcorrencia;
    private RetornoEnum retornoEnum;

    public RetornoAberturaOcorrenciaDTO() {
    }
    
    public RetornoAberturaOcorrenciaDTO(RetornoEnum retornoEnum) {
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
    
    public String getIdOcorrencia() {
		return idOcorrencia;
	}

	public void setIdOcorrencia(String idOcorrencia) {
		this.idOcorrencia = idOcorrencia;
	}
}
