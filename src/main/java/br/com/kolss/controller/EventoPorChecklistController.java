package br.com.kolss.controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.datamodel.EventoDataModel;
import br.com.kolss.model.dao.HibernateDAO;
import br.com.kolss.model.dao.InterfaceDAO;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Local;
import br.com.kolss.service.EventoService;
import br.com.kolss.util.FacesContextUtil;
import org.apache.log4j.Logger;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;
import org.primefaces.event.map.OverlaySelectEvent;
import org.primefaces.model.map.Marker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import java.io.IOException;


@Controller(value = "eventoPorChecklistBean")
@Scope("request")
public class EventoPorChecklistController {

    private Logger logger = Logger.getLogger(this.getClass());
    private Evento model;
    private EventoDataModel dataModel;

    private String paginaLista = "ListaLocal.nicbrain";
    private String proximaPagina =
            "ListaChecklist.nicbrain?faces-redirect=true" +
                    "";    // "/restrict/Local.nicbrain"

    private Long filtroIdLocal;
    private Long filtroIdPessoaResponsavel;
    private Long filtroIdCliente;

    @Autowired
    protected EventoService eventoService;

    @Autowired
    protected BbUsuarioLogado bbUsuarioLogado;


    /**
     * Metodo construtor padrao.
     */
    public EventoPorChecklistController() {
    }

    private InterfaceDAO<Evento> getDAO() {
        logger.info("Obter DAO");
        InterfaceDAO<Evento> dao = new HibernateDAO<Evento>(Evento.class,
                FacesContextUtil.getRequestSession());
        return dao;
    }

    public String novo() {
        logger.info("Criando novo Evento");
        limpar();
        avancaPagina();
        return null;
    }

    public String limpar() {
        logger.info("Limpar dados do evento");
        model = new Evento();
        return null;
    }

    public String cancel() {
        logger.info("Cancela a operacao de adicao/edicao");
        model = new Evento();
        try {
            FacesContext.getCurrentInstance().getExternalContext().redirect(
                    paginaLista);
        } catch (IOException e) {

            e.printStackTrace();
        }
        return null;
    }

    public String add(ActionEvent evento) {
        logger.info("Salvar/Atualizar [ActionEvent]: " + evento);
        return add();
    }

    public String add() {
        logger.info("Salvar/Atualizar: " + this.model);

        if (model.getId() == null || model.getId() == 0) {
            insert();
        } else {
            update();
        }

        limpar();
        return "/restrict/" + this.paginaLista;
    }

    private void insert() {
        logger.info("Salvar: " + this.model);
        getDAO().save(model);

        FacesContext.getCurrentInstance().addMessage(
                null,
                new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
                        .getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
    }

    private void update() {
        logger.info("Atualizar: " + this.model);
        getDAO().update(model);

        FacesContext.getCurrentInstance().addMessage(
                null,
                new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
                        .getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
    }

    public void delete() {
        logger.info("Excluir: " + this.model);
        getDAO().remove(model);

        FacesContext.getCurrentInstance().addMessage(
                null,
                new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
                        .getI18nMessage(BbLocale.DELETE_SUCCESSFULLY), ""));
    }

    public String search() {
        logger.info("Pesquisar");

        this.getDataModel();
        return null;
    }

    public Evento getModel() {
        logger.info("Obter evento: " + this.model);
        return model;
    }

    public void setModel(Evento evento) {
        logger.info("Selecionar evento: " + evento);
        this.model = evento;
    }

    public void setDataModel(EventoDataModel dataModel) {
        this.dataModel = dataModel;
    }

    public EventoService getEventoService() {
        return eventoService;
    }

    public void setEventoService(EventoService eventoService) {
        this.eventoService = eventoService;
    }

    public Long getFiltroIdLocal() {
        return filtroIdLocal;
    }

    public void setFiltroIdLocal(Long filtroIdLocal) {
        this.filtroIdLocal = filtroIdLocal;
    }

    public Long getFiltroIdPessoaResponsavel() {
        return filtroIdPessoaResponsavel;
    }

    public void setFiltroIdPessoaResponsavel(Long filtroIdPessoaResponsavel) {
        this.filtroIdPessoaResponsavel = filtroIdPessoaResponsavel;
    }

    public Long getFiltroIdCliente() {
        return filtroIdCliente;
    }

    public void setFiltroIdCliente(Long filtroIdCliente) {
        this.filtroIdCliente = filtroIdCliente;
    }

    public String getProximaPagina() {
        return proximaPagina;
    }

    public void setProximaPagina(String proximaPagina) {
        this.proximaPagina = proximaPagina;
    }


    /**
     * Limpa os dados dos filtros.
     */
    private void limparFiltros() {
        logger.info("Limpa os filtros da tela");
        this.setFiltroIdLocal(null);
        this.setFiltroIdPessoaResponsavel(null);
        this.setFiltroIdCliente(null);
        this.dataModel = null;
    }

    public EventoDataModel getDataModel() {

        // TODO: PORQUE PRECISO USAR @RequestScoped
        Object obj = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("IdLocal");
        if (obj != null) {

            try {
                Long idLocal = Long.parseLong(obj.toString());
                setFiltroIdLocal(idLocal);
            } catch (Exception e) {
                logger.error("Não é um número!");
            }

        }

        if (this.dataModel == null) {
            this.dataModel = new EventoDataModel(
                    eventoService.getEventosPorChecklist(
                            getFiltroIdLocal(),
                            getFiltroIdPessoaResponsavel(),
                            getFiltroIdCliente(),
                            null,
                            bbUsuarioLogado.getUserSession().getId()));
        }
        return this.dataModel;
    }

    /**
     * Seleciona o Local para exibir a lista de Eventos já filtrados por local.
     *
     * @param event
     */
    public void onMarkerSelect(OverlaySelectEvent event) {
        logger.info("Seleciona o Local com Checklist(s) ativo(s)");

        Marker marker = (Marker) event.getOverlay();
        Local localSelecionado = (Local) marker.getData();
        this.setFiltroIdLocal(localSelecionado.getId());

        logger.info("Avancando para a pagina de 'Eventos X Checklist'");
        FacesContext fc = FacesContext.getCurrentInstance();
        NavigationHandler nh = fc.getApplication().getNavigationHandler();
        nh.handleNavigation(fc, null, "/restrict/ListaEventoPorChecklist.nicbrain"
                + "?faces-redirect=true&IdLocal=" + localSelecionado.getId());
    }

    public void avancaPagina() {
        logger.info("Avancando para a pagina de edicao/adicao");
        limparFiltros();

        FacesContext fc = FacesContext.getCurrentInstance();
        NavigationHandler nh = fc.getApplication().getNavigationHandler();
        nh.handleNavigation(fc, null, "/restrict/" + getProximaPagina());
    }

    public void onRowSelect(SelectEvent event) {
        logger.info("Seta o objeto selecionado na lista");
        setModel((Evento) event.getObject());
        avancaPagina();
    }

    public void onRowUnselect(UnselectEvent event) {
        logger.info("Seta o objeto selecionado na lista");
        setModel((Evento) event.getObject());
        avancaPagina();
    }

    /**
     * Retorna o texto do cabeçalho da página.
     *
     * @return
     */
    public String getCabecalho() {
        return BbLocale.getI18nMessage("label.events");
    }

}
