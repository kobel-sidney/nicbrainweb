package br.com.kolss.model.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "operacao_atividade")
public class OperacaoAtividade extends AbstractEntity<Long> {

    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = -6713564086536408545L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false, unique = true)
    private Long id;

    @Temporal(TemporalType.TIMESTAMP)

    @Column(name = "data_hora_status", nullable = false)
    private Date dataStatus;

    @Column(name = "justificativa", nullable = true)
    private String justificativa;

    @Embedded
    private CoordenadaGeografica coordenadas = new CoordenadaGeografica();

    @ManyToOne(fetch = FetchType.LAZY, optional = true)
    @JoinColumn(name = "id_status", nullable = true)
    private Status status = new Status();

    @ManyToOne(fetch = FetchType.LAZY, optional = true)
    @JoinColumn(name = "id_usuario", nullable = true)
    private Usuario usuario = new Usuario();

    @ManyToOne(fetch = FetchType.LAZY, optional = true)
    @JoinColumn(name = "id_atividade", nullable = true)
    private Atividade atividade = new Atividade();

    /**
     * Método Construtor padrão.
     */
    public OperacaoAtividade() {
        super();
    }

    /**
     * Método Construtor
     *
     * @param id
     * @param dataStatus
     */
    public OperacaoAtividade(Long id, Date dataStatus) {
        this(id, dataStatus, null, null, null, null, null, null);
    }

    /**
     * Método Construtor
     *
     * @param id
     * @param dataStatus
     * @param justificativa
     * @param latitude
     * @param longitude
     * @param status
     * @param usuario
     * @param atividade
     */
    public OperacaoAtividade(Long id, Date dataStatus, String justificativa,
            String latitude, String longitude, Status status, Usuario usuario,
            Atividade atividade) {
        this();
        this.id = id;
        this.dataStatus = dataStatus;
        this.justificativa = justificativa;
        this.coordenadas.setLatitude(latitude);
        this.coordenadas.setLongitude(longitude);
        this.status = status;
        this.usuario = usuario;
        this.atividade = atividade;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result
                + ((dataStatus == null) ? 0 : dataStatus.hashCode());
        result = prime * result
                + ((justificativa == null) ? 0 : justificativa.hashCode());
        result = prime * result
                + ((coordenadas == null) ? 0 : coordenadas.hashCode());
        result = prime * result + ((status == null) ? 0 : status.hashCode());
        result = prime * result + ((usuario == null) ? 0 : usuario.hashCode());
        result = prime * result
                + ((atividade == null) ? 0 : atividade.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        OperacaoAtividade other = (OperacaoAtividade) obj;
        if (dataStatus == null) {
            if (other.dataStatus != null) {
                return false;
            }
        } else if (!dataStatus.equals(other.dataStatus)) {
            return false;
        }
        if (justificativa == null) {
            if (other.justificativa != null) {
                return false;
            }
        } else if (!justificativa.equals(other.justificativa)) {
            return false;
        }
        if (coordenadas == null) {
            if (other.coordenadas != null) {
                return false;
            }
        } else if (!coordenadas.equals(other.coordenadas)) {
            return false;
        }
        if (status == null) {
            if (other.status != null) {
                return false;
            }
        } else if (!status.equals(other.status)) {
            return false;
        }
        if (usuario == null) {
            if (other.usuario != null) {
                return false;
            }
        } else if (!usuario.equals(other.usuario)) {
            return false;
        }
        if (atividade == null) {
            if (other.atividade != null) {
                return false;
            }
        } else if (!atividade.equals(other.atividade)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "OperacaoAtividade [id=" + id
                + ", dataStatus=" + dataStatus
                + ", justificativa=" + justificativa
                + ", " + coordenadas
                + ", status=" + status
                + ", usuario=" + usuario
                + ", atividade=" + atividade
                + "]";
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDataStatus() {
        return dataStatus;
    }

    public void setDataStatus(Date dataStatus) {
        this.dataStatus = dataStatus;
    }

    public String getJustificativa() {
        return justificativa;
    }

    public void setJustificativa(String justificativa) {
        this.justificativa = justificativa;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Atividade getAtividade() {
        return atividade;
    }

    public void setAtividade(Atividade atividade) {
        this.atividade = atividade;
    }

    public String getLatitude() {

        if (this.coordenadas == null) {
            return null;
        } else {
            return this.coordenadas.getLatitude();
        }

    }

    public void setLatitude(String latitude) {

        if (this.coordenadas == null) {
            this.coordenadas = new CoordenadaGeografica();
        }
        this.coordenadas.setLatitude(latitude);
    }

    public String getLongitude() {

        if (this.coordenadas == null) {
            return null;
        } else {
            return this.coordenadas.getLongitude();
        }

    }

    public void setLongitude(String longitude) {

        if (this.coordenadas == null) {
            this.coordenadas = new CoordenadaGeografica();
        }
        this.coordenadas.setLongitude(longitude);

    }

}
