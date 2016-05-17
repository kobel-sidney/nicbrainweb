package br.com.kolss.controller;

import java.io.IOException;
import java.io.Serializable;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.inject.Named;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.ToggleEvent;
import org.primefaces.event.UnselectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.datamodel.AtividadeDataModel;
import br.com.kolss.datamodel.AtividadeMensagemDataModel;
import br.com.kolss.model.dao.HibernateDAO;
import br.com.kolss.model.dao.InterfaceDAO;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.AtividadeMensagem;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.TipoMensagem;
import br.com.kolss.service.AtividadeChecklistService;
import br.com.kolss.service.MensagemService;
import br.com.kolss.util.FacesContextUtil;

import com.lowagie.text.Document;
import com.lowagie.text.PageSize;


@Controller(value = "listaRelatorioAtividadeBean")
@Scope("request")
public class ListaRelatorioAtividadeController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	private Atividade model = new Atividade();

	private AtividadeDataModel dataModel;
	private String paginaLista = "ListaRelatorioAtividade.nicbrain";
	private Checklist checklistSelecionado = null;
	private String observacao;
	private AtividadeMensagemDataModel atividadeMensagemDataModel;
	
	@Autowired
	protected AtividadeChecklistService service;
	
	@Autowired
	protected BbUsuarioLogado bbUsuarioLogado;
	
	protected MensagemService mensagemService;

	private Integer totalAtividades;

	// Filtros:
	private Serializable filtroIdResponsavel;
	private Date filtroDataHoraInicio;
	private Serializable filtroIdStatus;
	private Integer filtroIdSetor;
	private Integer filtroIdSala;

	/** Metodo construtor padrao. */
	public ListaRelatorioAtividadeController() {
	}

	private InterfaceDAO<Atividade> getDAO() {
		logger.info("Obter DAO");
		InterfaceDAO<Atividade> dao = new HibernateDAO<Atividade>(
				Atividade.class, FacesContextUtil.getRequestSession());
		return dao;
	}

	public String novo() {
		logger.info("Criando novo Checklist");
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		logger.info("Limpar dados do Checklist");
		model = new Atividade();
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

	public void iniciarAtividade() {
		logger.info("Iniciar Atividade: " + this.model);

		service.iniciarAtividade(this.getModel().getId(),
				null, null,null,
				bbUsuarioLogado.getUserSession().getId());
		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.START_SUCCESSFULLY), ""));
	}

	public void concluirAtividade() {
		logger.info("Concluir Atividade: " + this.model);

		service.concluirAtividade(this.getModel().getId(),
				this.getObservacao(), null, null,
				bbUsuarioLogado.getUserSession().getId());
		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.COMPLETE_SUCCESSFULLY), ""));
	}

	public void cancelarAtividade() {
		logger.info("Cancelar Atividade: " + this.model);

		if (!this.getObservacao().isEmpty()
				|| !"".equalsIgnoreCase(this.getObservacao())) {
			service.cancelarAtividade(this.getModel().getId(),
					this.getObservacao(), null,null,
					true,
					bbUsuarioLogado.getUserSession().getId());
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
							.getI18nMessage(BbLocale.CANCEL_SUCCESSFULLY), ""));
		} else {
			FacesContext
					.getCurrentInstance()
					.addMessage(
							null,
							new FacesMessage(
									FacesMessage.SEVERITY_INFO,
									"Você precisa digitar o motivo do cancelamento",
									""));
		}

	}

	public Atividade getModel() {
		logger.info("Obter: " + this.model);
		return model;
	}

	public void setModel(Atividade atividade) {
		logger.info("Selecionar: " + atividade);
		this.model = atividade;
	}

	public AtividadeDataModel getDataModel() {

		Serializable idChecklist = null;
		if (checklistSelecionado != null
				&& checklistSelecionado.getId() != null) {
			idChecklist = checklistSelecionado.getId();
		}

		List<Atividade> lst = service.getAtividades(idChecklist,
				null,
				getFiltroIdStatus(),
				null,
				getFiltroDataHoraInicio(),
				bbUsuarioLogado.getUserSession().getId());
		
		this.dataModel = new AtividadeDataModel(lst);
		return this.dataModel;
	}

	public Checklist getChecklistSelecionado() {
		return checklistSelecionado;
	}

	public void setChecklistSelecionado(Checklist checklistSelecionado) {
		this.checklistSelecionado = checklistSelecionado;
	}

	public Serializable getFiltroIdResponsavel() {
		return filtroIdResponsavel;
	}

	public void setFiltroIdResponsavel(Serializable filtroIdResponsavel) {
		this.filtroIdResponsavel = filtroIdResponsavel;
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

	public Integer getFiltroIdSetor() {
		return filtroIdSetor;
	}

	public void setFiltroIdSetor(Integer filtroIdSetor) {
		this.filtroIdSetor = filtroIdSetor;
	}

	public Integer getFiltroIdSala() {
		return filtroIdSala;
	}

	public void setFiltroIdSala(Integer filtroIdSala) {
		this.filtroIdSala = filtroIdSala;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	@SuppressWarnings("unchecked")
	public AtividadeMensagemDataModel getAtividadeMensagemDataModel() {
		logger.debug("ListaRelatorioAtividadeController.getAtividadeMensagemDataModel");

		List<AtividadeMensagem> lst = Collections
				.<AtividadeMensagem> emptyList();
		if (this.model != null) {

			// FIXME: ARRUMAR A INJEÇÃO DE DEPENDENCIA:
			// lst = mensagemService.obterAlertaAtividadeMensagem(
			// this.model.getIdAtividade());

			// FIXME: REMOVE APÓS A CORREÇÃO DA INJEÇÃO DE DEPENDENCIA:
			Session currentSession = FacesContextUtil.getRequestSession();
			Criteria criteria = currentSession
					.createCriteria(AtividadeMensagem.class);
			criteria.addOrder(Order.desc("dtHrEnvioMsg"));
			criteria.add(Restrictions.isNotNull("dtHrEnvioMsg"));
//			criteria.add(Restrictions.eq("id.idAtividade",
//					this.model.getIdAtividade()));
			criteria.add(Restrictions.eq("ativo", true));
			criteria.createAlias("mensagem", "msg");
			criteria.createAlias("msg.tipoMensagem", "tMsg");
			criteria.add(Restrictions.eq("tMsg.idTipoMsg",
					TipoMensagem.ID_TIPO_ALERTA));

			lst = criteria.list();
		}

		this.atividadeMensagemDataModel = new AtividadeMensagemDataModel(lst);
		return atividadeMensagemDataModel;
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
		logger.info("Volta para a lista de Checklist");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaRelatorioChecklist.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Atividade) event.getObject());
		// avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Atividade) event.getObject());
		// avancaPagina();
	}

	public void onRowToggle(ToggleEvent event) {
		logger.info("Exibe os Procedimentos de um Checklist");
		// Checklist model = (Checklist) event.getData();
		// List<Procedimento> lst = null;
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

		// this.procedimentoDataModel = new ProcedimentoDataModel(lst);
	}

	/**
	 * Retorna o texto do cabeçalho da página.
	 * 
	 * @return
	 */
	public String getCabecalho() {

		StringBuilder cabecalho = new StringBuilder();
		cabecalho.append(BbLocale.getI18nMessage("label.event"));

		if (this.checklistSelecionado != null
				&& this.checklistSelecionado.getEvento() != null) {
			cabecalho.append(": ");
			cabecalho.append(this.checklistSelecionado.getEvento()
					.getNome());

			if (this.checklistSelecionado.getEvento().getLocal() != null) {
				cabecalho.append(" / ");
				cabecalho.append(BbLocale.getI18nMessage("label.venue"));
				cabecalho.append(": ");
				cabecalho.append(
						this.checklistSelecionado.getEvento().getLocal().getNome());

				cabecalho.append(" / ");
				cabecalho.append(BbLocale.getI18nMessage("label.checklist"));
				cabecalho.append(": ");
				cabecalho.append(this.checklistSelecionado.getNome());
			}
		}

		return cabecalho.toString();
	}

	@SuppressWarnings("unchecked")
	public String getCountAtividades(String status) {

		this.totalAtividades = 0;

		for (Atividade p : (List<Atividade>) dataModel.getWrappedData()) {

			if (p.getStatus().getNome().equalsIgnoreCase(status)) {
				this.totalAtividades++;
			}
		}

		return this.totalAtividades.toString();
	}

	public void preProcessPDF(Object document) {
		Document pdf = (Document) document;
		pdf.setPageSize(PageSize.A4.rotate());
		pdf.open();
	}

}
