package br.com.kolss.controller;

import java.io.IOException;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

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
import br.com.kolss.datamodel.ProcedimentoDataModel;
import br.com.kolss.filtro.ChecklistFiltro;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Procedimento;
import br.com.kolss.service.ChecklistService;
import br.com.kolss.service.MensagemService;

import com.lowagie.text.Document;
import com.lowagie.text.PageSize;


@Controller(value = "listaRelatorioChecklistBean")
@Scope("request")
public class ListaRelatorioChecklistController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	protected ChecklistService service;
	
	@Autowired
	protected BbUsuarioLogado bbUsuarioLogado;
	
	private Checklist model = new Checklist();
	private Evento eventoSelecionado = null;
	private String observacao;

	private ChecklistDataModel dataModel;
//	private ChecklistMensagemDataModel checklistMensagemDataModel;

	private String paginaLista = "ListaRelatorioChecklist.nicbrain";

	private ProcedimentoDataModel procedimentoDataModel;
	
	protected MensagemService mensagemService;

	private Integer totalChecklist;

	// Filtros:
	private Serializable filtroIdLocal;
	private Serializable filtroIdResponsavel;
	private Integer filtroIdSuperior;
	private Date filtroDataHoraInicio;
	private Serializable filtroIdStatus;
	
	
	/** Metodo construtor padrao. */
	public ListaRelatorioChecklistController() {
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

	public String cancel() {
		logger.info("Cancela a operacao de adicao/edicao");
		this.limpar();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect(paginaLista);
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
//		getDAO().save(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		logger.info("Atualizar: " + this.model);
//		getDAO().update(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public void delete() {
		logger.info("Excluir: " + this.model);
//		getDAO().remove(model);

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

	public void cancelarChecklist() {
		logger.info("Cancelar Checklist: " + this.model);

		service.cancelarChecklist(this.getModel().getId(),
				this.getObservacao(),
				bbUsuarioLogado.getUserSession().getId());

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.CANCEL_SUCCESSFULLY), ""));
	}

	public Checklist getModel() {
		logger.info("Obter: " + this.model);
		return model;
	}

	public void setModel(Checklist checklist) {
		logger.info("Selecionar: " + checklist);
		this.model = checklist;
	}

	public ChecklistDataModel getDataModel() {

		Serializable idEvento = null;
		if (getEventoSelecionado() != null) {
			idEvento = eventoSelecionado.getId();
		}
		
		ChecklistFiltro checklistFiltro = new  ChecklistFiltro();
		checklistFiltro.setIdEvento(idEvento);
		checklistFiltro.setIdLocal(getFiltroIdLocal());
		checklistFiltro.setIdStatus(getFiltroIdStatus());
		checklistFiltro.setIdUsuarioContexto(bbUsuarioLogado.getUserSession().getId());
		checklistFiltro.setIdUsuarioResponsavel(getFiltroIdResponsavel());

		List<Checklist> lst = service.obterEmAbertoPorFiltro(checklistFiltro);

		this.dataModel = new ChecklistDataModel(lst);
		return this.dataModel;
	}

	public ChecklistDataModel getAllDataModel() {

		Serializable idEvento = null;
		if (getEventoSelecionado() != null) {
			idEvento = eventoSelecionado.getId();
		}
		
		ChecklistFiltro checklistFiltro = new  ChecklistFiltro();
		checklistFiltro.setIdEvento(idEvento);
		checklistFiltro.setIdLocal(getFiltroIdLocal());
		checklistFiltro.setIdStatus(getFiltroIdStatus());
		checklistFiltro.setIdUsuarioContexto(bbUsuarioLogado.getUserSession().getId());
		checklistFiltro.setIdUsuarioResponsavel(getFiltroIdResponsavel());

		List<Checklist> lst = service.obterEmAbertoPorFiltro(checklistFiltro);
		
		this.dataModel = new ChecklistDataModel(lst);
		return this.dataModel;
	}

//	@SuppressWarnings("unchecked")
//	public ChecklistMensagemDataModel getChecklistMensagemDataModel() {
//		logger.debug("ChecklistController.getChecklistMensagemDataModel");
//
//		List<ChecklistMensagem> lst = Collections
//				.<ChecklistMensagem> emptyList();
//		if (this.model != null) {
//
//			// FIXME: ARRUMAR A INJEÇÃO DE DEPENDENCIA:
//			// lst = mensagemService.obterAlertaChecklistMensagem(
//			// this.model.getIdChecklist(),
//			// this.model.getId().getIdEvento(),
//			// this.model.getId().getIdLocal(),
//			// this.model.getId().getIdCliente(),
//			// this.model.getId().getIdContratante());
//
//			// FIXME: REMOVE APÓS A CORREÇÃO DA INJEÇÃO DE DEPENDENCIA:
//			Session currentSession = FacesContextUtil.getRequestSession();
//			Criteria criteria = currentSession
//					.createCriteria(ChecklistMensagem.class);
//			criteria.addOrder(Order.desc("dtHrEnvioMsg"));
//			criteria.add(Restrictions.isNotNull("dtHrEnvioMsg"));
////			criteria.add(Restrictions.eq("id.idCheckList",
////					this.model.getIdChecklist()));
////			criteria.add(Restrictions.eq("id.idEvento", this.model.getId()
////					.getIdEvento()));
////			criteria.add(Restrictions.eq("id.idLocal", this.model.getId()
////					.getIdLocal()));
////			criteria.add(Restrictions.eq("id.idCliente", this.model.getId()
////					.getIdCliente()));
////			criteria.add(Restrictions.eq("id.idContratante", this.model.getId()
////					.getIdContratante()));
//			criteria.add(Restrictions.eq("ativo", true));
//
//			criteria.createAlias("mensagem", "msg");
//			criteria.createAlias("msg.tipoMensagem", "tMsg");
//			criteria.add(Restrictions.eq("tMsg.idTipoMsg",
//					TipoMensagem.ID_TIPO_ALERTA));
//
//			lst = criteria.list();
//		}
//
//		checklistMensagemDataModel = new ChecklistMensagemDataModel(lst);
//		return checklistMensagemDataModel;
//	}

//	public void setChecklistMensagemDataModel(
//			ChecklistMensagemDataModel checklistMensagemDataModel) {
//		this.checklistMensagemDataModel = checklistMensagemDataModel;
//	}

	public ProcedimentoDataModel getProcedimentoDataModel() {
		return procedimentoDataModel;
	}

	public void setProcedimentoDataModel(
			ProcedimentoDataModel procedimentoDataModel) {
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

	public Serializable getFiltroIdResponsavel() {
		return filtroIdResponsavel;
	}

	public void setFiltroIdResponsavel(Serializable filtroIdResponsavel) {
		this.filtroIdResponsavel = filtroIdResponsavel;
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

	public ChecklistService getService() {
		return service;
	}

	public void setService(ChecklistService service) {
		this.service = service;
	}

	public MensagemService getMensagemService() {
		return mensagemService;
	}

	public void setMensagemService(MensagemService mensagemService) {
		this.mensagemService = mensagemService;
	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaRelatorioAtividade.nicbrain");
	}

	public void voltaPagina() {
		logger.info("Volta para a seleção de Checklist x Eventos");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/RelatorioChecklist.nicbrain?faces-redirect=true");
	};

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
		// Checklist model = (Checklist) event.getData();
		List<Procedimento> lst = null;
		// if (model != null && model.getProcedimentos() != null) {
		//
		// InterfaceDAO<Procedimento> dao = new HibernateDAO<Procedimento>(
		// Procedimento.class, FacesContextUtil.getRequestSession());
		// lst = dao.getListByHQLQuery(
		// "SELECT cp.procedimentoPadrao FROM ChecklistProcedimento cp WHERE cp.id.idCheckList = "
		// + model.getIdCheckList());
		// } else {
		// lst = Collections.emptyList();
		// }

		this.procedimentoDataModel = new ProcedimentoDataModel(lst);
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

}
