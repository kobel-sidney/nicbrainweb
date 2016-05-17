package br.com.kolss.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.annotation.PostConstruct;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

import br.com.kolss.service.UsuarioService;
import org.primefaces.event.SelectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.Ronda;
import br.com.kolss.service.PessoaService;
import br.com.kolss.service.RondaService;
import br.com.kolss.util.FacesUtil;

@Controller("rondaBean")
@Scope("session")
public class RondaController {

    private Ronda ronda;
    private Pessoa pessoa;

    private List<Pessoa> tripulantes;

    @Autowired
    private PessoaService pessoaService;

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private RondaService rondaService;

    @Autowired
    private BbUsuarioLogado usuarioLogado;

    @PostConstruct
    public void init() {
        ronda = new Ronda();
        pessoa = new Pessoa();
        tripulantes = new ArrayList<>();
    }

    public Ronda getRonda() {
        return ronda;
    }

    public void adicionarTripulante() {
        if (pessoa.getId() == -1) {
            FacesUtil.addErrorMessage("Selecione um tripulante.");
        } else {
            Pessoa tripulante = pessoaService.obter(pessoa.getId());

            if (pessoa != null && !pessoa.isNew()) {
                if (pessoa.getId() == usuarioLogado.getUserSession().getPessoa().getId()) {
                    FacesUtil.addErrorMessage("Você não pode ser um tripulante.");
                } else if (ronda.getResponsavelRonda().getId() == pessoa.getId()) {
                    FacesUtil.addErrorMessage(tripulante.getNome() + " é um condutor.");
                } else if (contemTripulante()) {
                    FacesUtil.addErrorMessage(tripulante.getNome() + " já foi adicionado como tripulante.");
                } else {
                    tripulantes.add(tripulante);
                }
            }
        }
    }

    public void removerTripulante() {
        tripulantes.remove(pessoa);
    }

    private boolean contemTripulante() {
        for (Pessoa pessoa : tripulantes) {
            if (pessoa.getId() == this.pessoa.getId()) {
                return true;
            }
        }

        return false;
    }

    public void iniciarRonda() {
        if (isViaturaEmRonda()) {
            FacesUtil.addErrorMessage(
                    "Viatura já está em ronda");
        } else if (contemUsuario()) {
            ronda.setTripulantes(tripulantes);
            ronda.setCliente(usuarioLogado.getUserSession().getCliente());
            rondaService.salvar(ronda);

            FacesContext fc = FacesContext.getCurrentInstance();
            NavigationHandler nh = fc.getApplication().getNavigationHandler();
            nh.handleNavigation(fc, null, "/restrict/ListaRonda.nicbrain?faces-redirect=true");
        } else {
            FacesUtil.addErrorMessage(
                    "Para iniciar uma ronda é obrigatório que pelo menos um tripulante ou o condutor seja um usuário");
        }
    }

    public boolean isViaturaEmRonda() {
        List<Ronda> rondas = rondaService.obterEmAndamento(usuarioLogado.getUserSession());
        for (Ronda rondaEmAndamento : rondas) {
            if (Objects.equals(rondaEmAndamento.getVeiculo().getId(), ronda.getVeiculo().getId())) {
                if (ronda.getInicio() == null || rondaEmAndamento.getInicio().compareTo(ronda.getInicio()) != 0) {
                    return true;
                }
            }
        }
        return false;
    }

    public void finalizarRonda() {
        Ronda rondaASerFinalizada = rondaService.obterRonda(ronda.getId());
        rondaASerFinalizada.setFim(new Date());
        rondaService.salvar(rondaASerFinalizada);

        FacesContext fc = FacesContext.getCurrentInstance();
        NavigationHandler nh = fc.getApplication().getNavigationHandler();
        nh.handleNavigation(fc, null, "/restrict/ListaRonda.nicbrain?faces-redirect=true");
    }

    private boolean contemUsuario() {
        ronda.setResponsavelRonda(usuarioService.obter(ronda.getResponsavelRonda().getId()));
        if (ronda.getResponsavelRonda() != null) {
            return true;
        }

        return false;
    }

    public void cancelar() {
        ronda = new Ronda();
        pessoa = new Pessoa();
        tripulantes = new ArrayList<>();

        FacesContext fc = FacesContext.getCurrentInstance();
        NavigationHandler nh = fc.getApplication().getNavigationHandler();
        nh.handleNavigation(fc, null, "/restrict/ListaRonda.nicbrain?faces-redirect=true");
    }

    public void novo() {
        ronda = new Ronda();
        pessoa = new Pessoa();
        tripulantes = new ArrayList<>();

        FacesContext fc = FacesContext.getCurrentInstance();
        NavigationHandler nh = fc.getApplication().getNavigationHandler();
        nh.handleNavigation(fc, null, "/restrict/Ronda.nicbrain?faces-redirect=true");
    }

    public void rowSelect(SelectEvent event) {
        ronda = new Ronda();
        pessoa = new Pessoa();
        tripulantes = new ArrayList<>();

        ronda = (Ronda) event.getObject();
        tripulantes.addAll(ronda.getTripulantes());

        FacesContext fc = FacesContext.getCurrentInstance();
        NavigationHandler nh = fc.getApplication().getNavigationHandler();
        nh.handleNavigation(fc, null, "/restrict/Ronda.nicbrain?faces-redirect=true");
    }

    public void setRonda(Ronda ronda) {
        this.ronda = ronda;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    public List<Pessoa> getTripulantes() {
        return tripulantes;
    }

    public void setTripulantes(List<Pessoa> tripulantes) {
        this.tripulantes = tripulantes;
    }

}
