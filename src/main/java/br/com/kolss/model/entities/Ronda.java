package br.com.kolss.model.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author weverton
 */
@Entity
@Table(name = "ronda")
public class Ronda implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;

    @Column(name = "descricao")
    private String descricao;

    @Column(name = "fim")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fim;

    @Basic(optional = false)
    @Column(name = "inicio")
    @Temporal(TemporalType.TIMESTAMP)
    private Date inicio;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "ronda_pessoa", joinColumns = @JoinColumn(name = "id_ronda"), inverseJoinColumns = @JoinColumn(name = "id_pessoa"))
    private List<Pessoa> tripulantes = new ArrayList<>();

    @ManyToOne(optional = false)
    @JoinColumn(name = "condutor_id_pessoa",nullable = true)
    private Usuario responsavelRonda= new Usuario();

    @ManyToOne
    @JoinColumn(name = "setor_id_setor", referencedColumnName = "id_setor")
    private Setor setor = new Setor();

    @ManyToOne(optional = false)
    @JoinColumn(name = "local_id_local", referencedColumnName = "id_local")
    private Local local = new Local();

    @JoinColumn(name = "veiculo_id_veiculo", referencedColumnName = "id_veiculo")
    @ManyToOne
    private Veiculo veiculo = new Veiculo();

    @JoinColumn(name = "id_tipo_ronda", referencedColumnName = "id")
    @ManyToOne
    private TipoRonda tipoRonda = new TipoRonda();

    @JoinColumn(name = "id_cliente", referencedColumnName = "id_cliente")
    @ManyToOne(optional = false)
    private Cliente cliente = new Cliente();

    public Ronda() {
    }

    public Ronda(Long id) {
        this.id = id;
    }

    public Ronda(Long id, Date inicio) {
        this.id = id;
        this.inicio = inicio;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Date getFim() {
        return fim;
    }

    public void setFim(Date fim) {
        this.fim = fim;
    }

    public Date getInicio() {
        return inicio;
    }

    public void setInicio(Date inicio) {
        this.inicio = inicio;
    }

    public List<Pessoa> getTripulantes() {
        return tripulantes;
    }

    public void setTripulantes(List<Pessoa> tripulantes) {
        this.tripulantes = tripulantes;
    }


    public Setor getSetor() {
        return setor;
    }

    public void setSetor(Setor setor) {
        this.setor = setor;
    }

    public Local getLocal() {
        return local;
    }

    public void setLocal(Local local) {
        this.local = local;
    }

    public Veiculo getVeiculo() {
        return veiculo;
    }

    public Usuario getResponsavelRonda() {
        return responsavelRonda;
    }

    public void setResponsavelRonda(Usuario responsavelRonda) {
        this.responsavelRonda = responsavelRonda;
    }

    public void setVeiculo(Veiculo veiculo) {
        this.veiculo = veiculo;
    }

    public TipoRonda getTipoRonda() {
        return tipoRonda;
    }

    public void setTipoRonda(TipoRonda tipoRonda) {
        this.tipoRonda = tipoRonda;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are
        // not set
        if (!(object instanceof Ronda)) {
            return false;
        }
        Ronda other = (Ronda) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.com.nicbrain.kolss.model.entities.Ronda[ id=" + id + " ]";
    }
}
