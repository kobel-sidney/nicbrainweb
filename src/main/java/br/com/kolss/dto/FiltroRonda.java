package br.com.kolss.dto;

/**
 * @author hamseshenrique
 */
public class FiltroRonda {

    private Long idRonda;
    private Integer idLocal;
    private Integer idSetor;
    private Integer idUsuario;
    private Integer idVeiculo;
    private LocationDTO locationDTO;
    private String raio;
    private String inicio;
    private String fim;
    private Integer maxResult;

    public FiltroRonda() {
    }

    public Long getIdRonda() {
        return idRonda;
    }

    public void setIdRonda(Long idRonda) {
        this.idRonda = idRonda;
    }

    /**
     * @return the idLocal
     */
    public Integer getIdLocal() {
        return idLocal;
    }

    /**
     * @param idLocal the idLocal to set
     */
    public void setIdLocal(Integer idLocal) {
        this.idLocal = idLocal;
    }

    /**
     * @return the idSetor
     */
    public Integer getIdSetor() {
        return idSetor;
    }

    /**
     * @param idSetor the idSetor to set
     */
    public void setIdSetor(Integer idSetor) {
        this.idSetor = idSetor;
    }

    /**
     * @return the idUsuario
     */
    public Integer getIdUsuario() {
        return idUsuario;
    }

    /**
     * @param idUsuario the idUsuario to set
     */
    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    /**
     * @return the idVeiculo
     */
    public Integer getIdVeiculo() {
        return idVeiculo;
    }

    /**
     * @param idVeiculo the idVeiculo to set
     */
    public void setIdVeiculo(Integer idVeiculo) {
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
     * @return the raio
     */
    public String getRaio() {
        return raio;
    }

    /**
     * @param raio the raio to set
     */
    public void setRaio(String raio) {
        this.raio = raio;
    }

    /**
     * @return the inicio
     */
    public String getInicio() {
        return inicio;
    }

    /**
     * @param inicio the inicio to set
     */
    public void setInicio(String inicio) {
        this.inicio = inicio;
    }

    /**
     * @return the fim
     */
    public String getFim() {
        return fim;
    }

    /**
     * @param fim the fim to set
     */
    public void setFim(String fim) {
        this.fim = fim;
    }

    /**
     * @return the maxResult
     */
    public Integer getMaxResult() {
        return maxResult;
    }

    /**
     * @param maxResult the fim to set
     */
    public void setMaxResult(Integer maxResult) {
        this.maxResult = maxResult;
    }

}
