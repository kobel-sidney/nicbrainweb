package br.com.kolss.controller;

import java.io.Serializable;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

import org.apache.log4j.Logger;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.ToggleEvent;
import org.primefaces.event.UnselectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.datamodel.ChecklistDataModel;
import br.com.kolss.datamodel.ChecklistMensagemDataModel;
import br.com.kolss.datamodel.ProcedimentoDataModel;
import br.com.kolss.filtro.ChecklistFiltro;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.ChecklistMensagem;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Procedimento;
import br.com.kolss.service.ChecklistService;

import com.lowagie.text.Document;
import com.lowagie.text.PageSize;

@Controller(value = "checklistBean")
@Scope("session")
public class ChecklistController {

    private Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    protected ChecklistService service;

    private Checklist model = new Checklist();
    private Evento eventoSelecionado = null;
    private String observacao;
    private String comentario;
    private Date dataHoraComentario;

    private ChecklistDataModel dataModel;
    private ChecklistMensagemDataModel checklistMensagemDataModel;

//	private String paginaLista = "ListaChecklist.nicbrain?faces-redirect=true";
    private ProcedimentoDataModel procedimentoDataModel;

    private Integer totalChecklist;

    // Filtros:
    private Serializable filtroIdLocal;
    private Serializable filtroIdUsuarioResponsavel;
    private Integer filtroIdSuperior;
    private Date filtroDataHoraInicio;
    private Serializable filtroIdStatus;

    @Autowired
    protected BbUsuarioLogado bbUsuarioLogado;

    /**
     * Metodo construtor padrao.
     */
    public ChecklistController() {
    }

    public String novo() {
        logger.info("Criando novo Checklist");
        limpar();
        avancaPagina();
        return null;
    }

    public String limpar() {
        logger.info("Limpar dados do Checklist");
        model = new Checklist();
        return null;
    }

    public void delete() {
        logger.info("Excluir: " + this.model);

//		FacesContext.getCurrentInstance().addMessage(
//				null,
//				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
//						.getI18nMessage(BbLocale.DELETE_SUCCESSFULLY), ""));
    }

    public String search() {
        logger.info("Pesquisar");

        this.getDataModel();
        return null;
    }

    public void cancelarChecklist() {
        logger.info("Cancelar Checklist: " + this.model);

        String message = "";
        try {

            service.cancelarChecklist(this.getModel().getId(),
                    this.getObservacao(),
                    bbUsuarioLogado.getUserSession().getId());

            message = BbLocale.getI18nMessage(BbLocale.CANCEL_SUCCESSFULLY);
        } catch (Exception e) {

            message = BbLocale.getI18nMessage(BbLocale.OPERATION_NOT_ALLOWED);
        } finally {

            FacesContext.getCurrentInstance().addMessage(
                    null,
                    new FacesMessage(FacesMessage.SEVERITY_INFO, message, ""));
        }

    }

    /**
     * Adiciona um novo comentário ao Checklist.
     */
    public void novoComentario() {
        logger.info("ChecklistController.novoComentario");

        String message = "";
        try {

            if (!this.getComentario().isEmpty()
                    || !"".equalsIgnoreCase(this.getComentario())) {

                service.novoComentario(this.getModel().getId(),
                        this.getComentario(),
                        this.getDataHoraComentario(),
                        bbUsuarioLogado.getUserSession().getId());

                message = BbLocale.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY);
            }
        } catch (Exception e) {

            message = BbLocale.getI18nMessage(BbLocale.OPERATION_NOT_ALLOWED);
        } finally {

            FacesContext.getCurrentInstance().addMessage(
                    null,
                    new FacesMessage(FacesMessage.SEVERITY_INFO, message, ""));
        }
    }

    public Checklist getModel() {
        logger.info("Obter: " + this.model);
        return model;
    }

    public void setModel(Checklist checklist) {
        logger.info("Selecionar: " + checklist);
        this.setDataHoraComentario(new Date());
        this.setComentario("");
        this.model = checklist;
    }

    public ChecklistDataModel getDataModel() {

        Serializable idEvento = null;
        if (getEventoSelecionado() != null) {
            idEvento = eventoSelecionado.getId();
        }


        ChecklistFiltro checklistFiltro = new ChecklistFiltro();
        checklistFiltro.setIdEvento(idEvento);
        checklistFiltro.setIdLocal(getFiltroIdLocal());
        checklistFiltro.setIdStatus(getFiltroIdStatus());
        checklistFiltro.setIdUsuarioResponsavel(getFiltroIdUsuarioResponsavel());
        checklistFiltro.setIdUsuarioContexto(bbUsuarioLogado.getUserSession().getId());
        checklistFiltro.setDataHoraInicio(getFiltroDataHoraInicio());

        List<Checklist> lst = service.obterEmAbertoPorFiltro(checklistFiltro);

        this.dataModel = new ChecklistDataModel(lst);
        return this.dataModel;
    }

    public ChecklistDataModel getAllDataModel() {

        Serializable idEvento = null;
        if (getEventoSelecionado() != null) {
            idEvento = eventoSelecionado.getId();
        }

        ChecklistFiltro checklistFiltro = new ChecklistFiltro();
        checklistFiltro.setIdEvento(idEvento);
        checklistFiltro.setIdLocal(getFiltroIdLocal());
        checklistFiltro.setIdStatus(getFiltroIdStatus());
        checklistFiltro.setIdUsuarioContexto(bbUsuarioLogado.getUserSession().getId());

        List<Checklist> lst = service.obterNaoCanceladoPorFiltro(checklistFiltro);

        this.dataModel = new ChecklistDataModel(lst);
        return this.dataModel;
    }

    public ChecklistMensagemDataModel getChecklistMensagemDataModel() {
        logger.debug("ChecklistController.getChecklistMensagemDataModel");

        List<ChecklistMensagem> lst = null;
        if (this.model == null || this.model.getId() == null
                || this.model.getId().intValue() <= 0) {
            lst = Collections.<ChecklistMensagem>emptyList();
        } else {
            lst = service.obterChecklistMensagensPorId(model.getId());
        }

        checklistMensagemDataModel = new ChecklistMensagemDataModel(lst);
        return checklistMensagemDataModel;
    }

    public void setChecklistMensagemDataModel(
            ChecklistMensagemDataModel checklistMensagemDataModel) {
        this.checklistMensagemDataModel = checklistMensagemDataModel;
    }

    public ProcedimentoDataModel getProcedimentoDataModel() {
        return procedimentoDataModel;
    }

    public void setProcedimentoDataModel(ProcedimentoDataModel procedimentoDataModel) {
        this.procedimentoDataModel = procedimentoDataModel;
    }

    public Evento getEventoSelecionado() {
        return eventoSelecionado;
    }

    public void setEventoSelecionado(Evento eventoSelecionado) {
        this.eventoSelecionado = eventoSelecionado;

        /* 
		 * Define o local 'default' para o filtro de locais quando houver um
		 * Evento for selecionado previamente.
         */
        if (this.eventoSelecionado == null) {
            this.setFiltroIdLocal(null);
        } else {
            this.setFiltroIdLocal(
                    this.getEventoSelecionado().getLocal().getId());
        }
    }

    public Serializable getFiltroIdLocal() {
        return filtroIdLocal;
    }

    public void setFiltroIdLocal(Serializable filtroIdLocal) {
        this.filtroIdLocal = filtroIdLocal;
    }

    public Serializable getFiltroIdUsuarioResponsavel() {
        return filtroIdUsuarioResponsavel;
    }

    public void setFiltroIdUsuarioResponsavel(
            Serializable filtroIdUsuarioResponsavel) {
        this.filtroIdUsuarioResponsavel = filtroIdUsuarioResponsavel;
    }

    public Integer getFiltroIdSuperior() {
        return filtroIdSuperior;
    }

    public void setFiltroIdSuperior(Integer filtroIdSuperior) {
        this.filtroIdSuperior = filtroIdSuperior;
    }

    public Date getFiltroDataHoraInicio() {
        return filtroDataHoraInicio;
    }

    public void setFiltroDataHoraInicio(Date filtroDataHoraInicio) {
        this.filtroDataHoraInicio = filtroDataHoraInicio;
    }

    public Serializable getFiltroIdStatus() {
        return filtroIdStatus;
    }

    public void setFiltroIdStatus(Serializable filtroIdStatus) {
        this.filtroIdStatus = filtroIdStatus;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public void avancaPagina() {
        logger.info("Avancando para a pagina de edicao/adicao");
        FacesContext fc = FacesContext.getCurrentInstance();
        NavigationHandler nh = fc.getApplication().getNavigationHandler();
        nh.handleNavigation(fc, null, "/restrict/ListaAtividade.nicbrain?faces-redirect=true");
    }

    public void voltaPagina() {
        logger.info("Volta para a seleção de Checklist x Eventos");
        FacesContext fc = FacesContext.getCurrentInstance();
        NavigationHandler nh = fc.getApplication().getNavigationHandler();
        nh.handleNavigation(fc, null, "/restrict/ListaEventoPorChecklist.nicbrain?faces-redirect=true");
    }

    public void onRowSelect(SelectEvent event) {
        logger.info("Seta o objeto selecionado na lista");
        setModel((Checklist) event.getObject());
        avancaPagina();
    }

    public void onRowUnselect(UnselectEvent event) {
        logger.info("Seta o objeto selecionado na lista");
        setModel((Checklist) event.getObject());
        avancaPagina();
    }

    public void onRowToggle(ToggleEvent event) {
        logger.info("Exibe os Procedimentos de um Checklist");
//		Checklist model = (Checklist) event.getData();
        List<Procedimento> lst = null;
//		if (model != null && model.getProcedimentos() != null) {
//
//			InterfaceDAO<Procedimento> dao = new HibernateDAO<Procedimento>(
//					Procedimento.class, FacesContextUtil.getRequestSession());
//			lst = dao.getListByHQLQuery(
//					"SELECT cp.procedimentoPadrao FROM ChecklistProcedimento cp WHERE cp.id.idCheckList = "
//							+ model.getIdCheckList());
//		} else {
//			lst = Collections.emptyList();
//		}

        this.procedimentoDataModel = new ProcedimentoDataModel(lst);
    }

    /**
     * Define a data atual para a 'DataHoraComentario' para ser exibido na tela.
     */
    public void limparComentario() {
        logger.debug("ChecklistController.limparComentario");
        this.setComentario("");
        this.setDataHoraComentario(new Date());
    }

    /**
     * Retorna o texto do cabeçalho da página.
     *
     * @return
     */
    public String getCabecalho() {

        StringBuilder cabecalho = new StringBuilder();
        cabecalho.append(BbLocale.getI18nMessage("label.event"));

        if (this.eventoSelecionado != null) {
            cabecalho.append(": ");
            cabecalho.append(this.eventoSelecionado.getNome());

            if (this.eventoSelecionado.getLocal() != null) {
                cabecalho.append(" / ");
                cabecalho.append(BbLocale.getI18nMessage("label.venue"));
                cabecalho.append(": ");
                cabecalho.append(this.eventoSelecionado.getLocal().getNome());
            }
        }

        return cabecalho.toString();
    }

    public void preProcessPDF(Object document) {
        Document pdf = (Document) document;
        pdf.setPageSize(PageSize.A4.rotate());
        pdf.open();
    }

    @SuppressWarnings("unchecked")
    public String getCountChecklist(String status) {

        this.totalChecklist = 0;

        for (Checklist p : (List<Checklist>) dataModel.getWrappedData()) {

            if (p.getStatus().getNome().equalsIgnoreCase(status)) {
                this.totalChecklist++;
            }

        }

        return this.totalChecklist.toString();

    }

    public Integer getTotalChecklist() {
        return totalChecklist;
    }

    public void setTotalChecklist(Integer totalChecklist) {
        this.totalChecklist = totalChecklist;
    }

    public Date getDataHoraComentario() {
        return dataHoraComentario;
    }

    public void setDataHoraComentario(Date dataHoraComentario) {
        this.dataHoraComentario = dataHoraComentario;
    }

}
