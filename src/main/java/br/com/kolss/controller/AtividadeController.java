package br.com.kolss.controller;

import java.io.IOException;
import java.io.Serializable;
import java.util.Collections;
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
import br.com.kolss.datamodel.AtividadeComentarioDataModel;
import br.com.kolss.datamodel.AtividadeDataModel;
import br.com.kolss.datamodel.AtividadeMensagemDataModel;
import br.com.kolss.model.dao.HibernateDAO;
import br.com.kolss.model.dao.InterfaceDAO;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.AtividadeComentario;
import br.com.kolss.model.entities.AtividadeMensagem;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.service.AtividadeChecklistService;
import br.com.kolss.service.MensagemService;
import br.com.kolss.util.HibernateUtil;


@Controller(value = "atividadeBean")
@Scope("session")
public class AtividadeController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	private Atividade model = new Atividade();

	private AtividadeDataModel dataModel;
	private String paginaLista = "ListaAtividade.nicbrain?faces-redirect=true";
	private Checklist checklistSelecionado = null;
	private String observacao;
	private String comentario;
	private String justificativa;
	private AtividadeMensagemDataModel atividadeMensagemDataModel;
	private AtividadeComentarioDataModel atividadeComentarioDataModel;
	
	@Autowired
	protected AtividadeChecklistService service;
	
	@Autowired
	protected MensagemService mensagemService;
	
	@Autowired
	protected BbUsuarioLogado usuarioLogado;
	
	
	// Filtros:
	private Long filtroIdResponsavel;
	private Date filtroDataHoraInicio;
	private Long filtroIdStatus;
	private Long filtroIdSetor;
	private Long filtroIdSala;
	
	
	/** Metodo construtor padrao. */
	public AtividadeController() {
	}

	private InterfaceDAO<Atividade> getDAO() {
		logger.info("Obter DAO");
		InterfaceDAO<Atividade> dao = new HibernateDAO<Atividade>(
				Atividade.class, HibernateUtil.getCurrentSession());
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
		
		String message = "";
		try {
			
			service.iniciarAtividade(this.getModel().getId(),
					justificativa, null,null,
					usuarioLogado.getUserSession().getId());
			model = service.obter(this.getModel().getId());
			
			message = model.isCampoCheck()
					? BbLocale.getI18nMessage(BbLocale.COMPLETE_SUCCESSFULLY)
					: BbLocale.getI18nMessage(BbLocale.START_SUCCESSFULLY);
		} catch (Exception e) {
			
			message = BbLocale.getI18nMessage(BbLocale.OPERATION_NOT_ALLOWED);
		} finally {
			
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, message, ""));
		}
	}
	
	public void concluirAtividade() {
		logger.info("Concluir Atividade: " + this.model);
		
		String message = "";
		try {
			
			service.concluirAtividade(this.getModel().getId(),
					this.getObservacao(), null, null,
					usuarioLogado.getUserSession().getId());
			message = BbLocale.getI18nMessage(BbLocale.COMPLETE_SUCCESSFULLY); 
		} catch (Exception e) {
			
			message = BbLocale.getI18nMessage(BbLocale.OPERATION_NOT_ALLOWED);
		} finally {
			
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, message, ""));
		}
	}

	public void cancelarAtividade() {
		logger.info("Cancelar Atividade: " + this.model);
		
		String message = "";
		try {
			
			if (!this.getObservacao().isEmpty()
					|| !"".equalsIgnoreCase(this.getObservacao())) {
				
				service.cancelarAtividade(this.getModel().getId(),
						this.getObservacao(), null,null, true,
						usuarioLogado.getUserSession().getId());
				
				message = BbLocale.getI18nMessage(BbLocale.CANCEL_SUCCESSFULLY);
			}
		} catch (Exception e) {

			message = BbLocale.getI18nMessage(BbLocale.OPERATION_NOT_ALLOWED);
		} finally {

			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, message, ""));
		}
	}
	
	public void novoComentario() {
		logger.info("AtividadeController.novoComentario");
		
		String message = "";
		try {
			
			if (!this.getComentario().isEmpty()
					|| !"".equalsIgnoreCase(this.getComentario())) {
				
				service.novoComentario(this.getModel().getId(),
						this.getComentario(),
						usuarioLogado.getUserSession().getId());
				
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
		if (checklistSelecionado != null && checklistSelecionado.getId() != null) {
			idChecklist = checklistSelecionado.getId();
		}
		
		List<Atividade> lst = service.getAtividadesEmAberto(
				idChecklist,
				getFiltroIdResponsavel(),
				getFiltroIdStatus(),
				null,
				getFiltroDataHoraInicio(),
				usuarioLogado.getUserSession().getId());
		
		this.dataModel = new AtividadeDataModel(lst);
		return this.dataModel;
	}

	
	public Checklist getChecklistSelecionado() {
		return checklistSelecionado;
	}

	public void setChecklistSelecionado(Checklist checklistSelecionado) {
		this.checklistSelecionado = checklistSelecionado;
	}

	public Long getFiltroIdResponsavel() {
		return filtroIdResponsavel;
	}

	public void setFiltroIdResponsavel(Long filtroIdResponsavel) {
		this.filtroIdResponsavel = filtroIdResponsavel;
	}

	public Date getFiltroDataHoraInicio() {
		return filtroDataHoraInicio;
	}

	public void setFiltroDataHoraInicio(Date filtroDataHoraInicio) {
		this.filtroDataHoraInicio = filtroDataHoraInicio;
	}

	public Long getFiltroIdStatus() {
		return filtroIdStatus;
	}

	public void setFiltroIdStatus(Long filtroIdStatus) {
		this.filtroIdStatus = filtroIdStatus;
	}

	public Long getFiltroIdSetor() {
		return filtroIdSetor;
	}

	public void setFiltroIdSetor(Long filtroIdSetor) {
		this.filtroIdSetor = filtroIdSetor;
	}

	public Long getFiltroIdSala() {
		return filtroIdSala;
	}

	public void setFiltroIdSala(Long filtroIdSala) {
		this.filtroIdSala = filtroIdSala;
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
	
	public String getJustificativa() {
		return justificativa;
	}
	
	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
	}
	
	public AtividadeMensagemDataModel getAtividadeMensagemDataModel() {
		logger.debug("AtividadeController.getAtividadeMensagemDataModel");
		
		List<AtividadeMensagem> lst = null;
		if (this.model == null || this.model.getId() == null
				|| this.model.getId().intValue() <= 0) {
			lst = Collections.<AtividadeMensagem>emptyList();
		} else {
			lst = mensagemService.obterAlertasMensagensEnviadas(this.model);
		}
		
		this.atividadeMensagemDataModel = new AtividadeMensagemDataModel(lst);
		return atividadeMensagemDataModel;
	}

	public AtividadeComentarioDataModel getAtividadeComentarioDataModel() {
		logger.debug("AtividadeController.getAtividadeComentarioDataModel");
		
		List<AtividadeComentario> lst = null;
		if (this.model == null || this.model.getId() == null
				|| this.model.getId().intValue() <= 0) {
			lst = Collections.<AtividadeComentario>emptyList();
		} else {
			lst = service.getAtividadesComentarios(model.getId());
		}
		
		this.atividadeComentarioDataModel = new AtividadeComentarioDataModel(
				lst);
		return atividadeComentarioDataModel;
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
		nh.handleNavigation(fc, null, "/restrict/Checklist.nicbrain");
	}

	public void voltaPagina() {
		logger.info("Volta para a lista de Checklist");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/ListaChecklist.nicbrain?faces-redirect=true");
	}
	
	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Atividade) event.getObject());
//		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Atividade) event.getObject());
//		avancaPagina();
	}
	
	public void onRowToggle(ToggleEvent event) {
		logger.info("Exibe os Procedimentos de um Checklist");
//		Checklist model = (Checklist) event.getData();
//		List<Procedimento> lst = null;
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

//		this.procedimentoDataModel = new ProcedimentoDataModel(lst);
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
			cabecalho.append(this.checklistSelecionado.getEvento().getNome());
			
			if (this.checklistSelecionado.getEvento().getLocal() != null) {
				cabecalho.append(" / ");
				cabecalho.append(BbLocale.getI18nMessage("label.venue"));
				cabecalho.append(": ");
				cabecalho.append(this.checklistSelecionado.getEvento().getLocal().getNome());
				
				cabecalho.append(" / ");
				cabecalho.append(BbLocale.getI18nMessage("label.checklist"));
				cabecalho.append(": ");				
				cabecalho.append(this.checklistSelecionado.getNome());
			}
		}
		
		return cabecalho.toString();
	}
	
}
