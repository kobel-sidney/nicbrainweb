package br.com.kolss.controller;

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
import br.com.kolss.model.entities.Endereco;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.OperacaoChecklist;
import br.com.kolss.model.entities.Procedimento;
import br.com.kolss.service.ChecklistService;
import br.com.kolss.service.MensagemService;

import com.lowagie.text.Document;
import com.lowagie.text.PageSize;


@Controller(value = "listaDeChecklistsDoRastreamentoDeChecklist")
@Scope("session")
public class ListaDeChecklistsDoRastreamentoDeChecklist {
	
	private Logger logger = Logger.getLogger(this.getClass());
	private Checklist model = new Checklist();
	private Evento eventoSelecionado = null;
	private String observacao;
	private String comentario;
	private Date dataHoraComentario;

	@Autowired
	RastreamentoDeOperacoesDoChecklistController rastreamentoDeOperacoesDoChecklistController;
	
	@Autowired
	private BbUsuarioLogado bbUsuarioLogado;
	
	@Autowired
	protected MensagemService mensagemService;

	@Autowired
	protected ChecklistService service;
	

	private ChecklistDataModel dataModel;
	private ChecklistMensagemDataModel checklistMensagemDataModel;

	private String paginaLista = "ListaChecklist.nicbrain?faces-redirect=true";

	private ProcedimentoDataModel procedimentoDataModel;


	private Integer totalChecklist;

	// Filtros:
	private Long filtroIdLocal;
	private Integer filtroIdResponsavel;
	private Integer filtroIdSuperior;
	private Date filtroDataHoraInicio;
	private Integer filtroIdStatus;

	/** Metodo construtor padrao. */
	public ListaDeChecklistsDoRastreamentoDeChecklist() {
	}

	public String search() {
		logger.info("Pesquisar");

		this.getDataModel();
		return null;
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

		Long idEvento = null;
		
		if (getEventoSelecionado() != null) {
			idEvento = eventoSelecionado.getId();
		}

		long idDoUsuarioDoContexto = bbUsuarioLogado.getUserSession().getId();
		
		ChecklistFiltro checklistFiltro = new ChecklistFiltro();
		checklistFiltro.setIdEvento(idEvento);
		checklistFiltro.setIdUsuarioContexto(idDoUsuarioDoContexto);
		
		List<Checklist> lst = service.obterNaoCanceladoPorFiltro(checklistFiltro);
		
		this.dataModel = new ChecklistDataModel(lst);
		return this.dataModel;
	}

	public ChecklistDataModel getAllDataModel() {

		Long idEvento = null;
		if (getEventoSelecionado() != null) {
			idEvento = eventoSelecionado.getId();
		}

		/* Pega os Checklists Ativos por Evento */
		ChecklistFiltro checklistFiltro = new ChecklistFiltro();

		checklistFiltro.setIdEvento(idEvento);
		checklistFiltro.setIdLocal(getFiltroIdLocal());
		checklistFiltro.setIdUsuarioResponsavel(getFiltroIdResponsavel());
		checklistFiltro.setIdStatus(getFiltroIdStatus());
		checklistFiltro.setDataHoraInicio(getFiltroDataHoraInicio());
		checklistFiltro.setIdUsuarioContexto(bbUsuarioLogado.getUserSession());
		
		List<Checklist> lst = service.obterNaoCanceladoPorFiltro(checklistFiltro);

		this.dataModel = new ChecklistDataModel(lst);
		return this.dataModel;
	}

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
			this.setFiltroIdLocal(this.getEventoSelecionado().getLocal().getId());
		}
	}

	public Long getFiltroIdLocal() {
		return filtroIdLocal;
	}

	public void setFiltroIdLocal(Long filtroIdLocal) {
		this.filtroIdLocal = filtroIdLocal;
	}

	public Integer getFiltroIdResponsavel() {
		return filtroIdResponsavel;
	}

	public void setFiltroIdResponsavel(Integer filtroIdResponsavel) {
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

	public Integer getFiltroIdStatus() {
		return filtroIdStatus;
	}

	public void setFiltroIdStatus(Integer filtroIdStatus) {
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
				"/restrict/RastreamentoDeOperacoesDoChecklist.nicbrain?faces-redirect=true");

	}

	public void voltaPagina() {
		logger.info("Volta para a seleção de Checklist x Eventos");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(
				fc,
				null,
				"/restrict/ListaDeEventosDoRastreamentoDoChecklist.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		
		setModel((Checklist) event.getObject());

		boolean oEventoSelecionadoPossuiLatitudeLongitude = false;
		boolean oCheckListSelecionadoPossuiLatitudeLongitude = false;
		boolean oCheckListPossuiOperacoesOuAtividades = false;
		
		Checklist checklistBuffer = (Checklist) event.getObject();
		rastreamentoDeOperacoesDoChecklistController.setChecklist(checklistBuffer);

		// FIXME: É preciso tratar o checklist quando ele vem com latitudes e
		// longitudes nulas, isso não pode acontecer
		// endereco.setLatitude(checklistBuffer.getLatitude());
		// endereco.setLongitude(checklistBuffer.getLongitude());
		
		Local localDaPrimeiraOperacaoChecklist = new Local();
		Local localDaUltimoOperacaoChecklist = new Local();
		
		if (checklistBuffer.getLatitude() == null || checklistBuffer.getLongitude() == null) {
			
			oEventoSelecionadoPossuiLatitudeLongitude = false;
			
		} else {
		
			if (checklistBuffer.getOperacoesChecklists().size() <= 0) {
				
				if (checklistBuffer.getEvento().getLocal().getLatitude() == null || checklistBuffer.getEvento().getLocal().getLongitude() == null) {
					
					oEventoSelecionadoPossuiLatitudeLongitude = false;
					
				} else {
					
					oEventoSelecionadoPossuiLatitudeLongitude = true;
				
					// Se o checklist não possui Latitude/Longitude, pega a mesma do Evento
					localDaPrimeiraOperacaoChecklist.setLatitude(checklistBuffer.getEvento().getLocal().getLatitude());
					localDaPrimeiraOperacaoChecklist.setLongitude(checklistBuffer.getEvento().getLocal().getLongitude());
	
					localDaUltimoOperacaoChecklist.setLatitude(checklistBuffer.getEvento().getLocal().getLatitude());
					localDaUltimoOperacaoChecklist.setLongitude(checklistBuffer.getEvento().getLocal().getLongitude());
	
				}
				
			} else {
	
				oCheckListPossuiOperacoesOuAtividades = true;
	
				for (OperacaoChecklist operacaoChecklist : checklistBuffer.getOperacoesChecklists()) {
	
					if (operacaoChecklist.getLatitude() == null || operacaoChecklist.getLongitude() == null) {
	
						oCheckListSelecionadoPossuiLatitudeLongitude = false;
						
						if (checklistBuffer.getEvento().getLocal().getLatitude() == null || checklistBuffer.getEvento().getLocal().getLongitude() == null) {
							
							oEventoSelecionadoPossuiLatitudeLongitude = false;
							
						} else {
							
							oEventoSelecionadoPossuiLatitudeLongitude = true;
						
							// Se o checklist não possui Latitude/Longitude, pega a mesma do Evento
							localDaPrimeiraOperacaoChecklist.setLatitude(checklistBuffer.getEvento().getLocal().getLatitude());
							localDaPrimeiraOperacaoChecklist.setLongitude(checklistBuffer.getEvento().getLocal().getLongitude());
	
							localDaUltimoOperacaoChecklist.setLatitude(checklistBuffer.getEvento().getLocal().getLatitude());
							localDaUltimoOperacaoChecklist.setLongitude(checklistBuffer.getEvento().getLocal().getLongitude());
	
						}
						
						break;
						
					} else {
	
						oCheckListSelecionadoPossuiLatitudeLongitude = true;
						oEventoSelecionadoPossuiLatitudeLongitude = true;
						
						if (operacaoChecklist.getStatus().getId() == 2) {
							localDaPrimeiraOperacaoChecklist
									.setLatitude(operacaoChecklist.getLatitude());
							localDaPrimeiraOperacaoChecklist
									.setLongitude(operacaoChecklist.getLongitude());
						}
		
						if (operacaoChecklist.getStatus().getId() == 6) {
							localDaUltimoOperacaoChecklist
									.setLatitude(operacaoChecklist.getLatitude());
							localDaUltimoOperacaoChecklist
									.setLongitude(operacaoChecklist.getLongitude());
						}
						
					}
	
				}
							
			}
			
		}
		
		if (!oEventoSelecionadoPossuiLatitudeLongitude){
			
			// 	Caso nem um dos Checklists ou o Evento não possua Latitude/Longitude,
			//	vamos pegar a Latitude/Longitude do Endereço do Local, simplesmente para
			// 	que o mapa seja mostrado
			
			Endereco enderecoDoLocalDoEvento = null;
			for(Endereco enderecoBuffer : checklistBuffer.getEvento().getLocal().getEnderecos()){
				if (enderecoBuffer.isEnderecoAtual()) {
					enderecoDoLocalDoEvento = enderecoBuffer;
				}
			}
						
			Local localBufferParaCentralizacaoDoMapaNoEnderecoDoLocalDoEvento = new Local();
			localBufferParaCentralizacaoDoMapaNoEnderecoDoLocalDoEvento.setLatitude(enderecoDoLocalDoEvento.getLatitude());
			localBufferParaCentralizacaoDoMapaNoEnderecoDoLocalDoEvento.setLongitude(enderecoDoLocalDoEvento.getLongitude());
			
			rastreamentoDeOperacoesDoChecklistController.setLocalDaPrimeiraOperacaoDoCheckList(localBufferParaCentralizacaoDoMapaNoEnderecoDoLocalDoEvento);
			rastreamentoDeOperacoesDoChecklistController.setLocalDaUltimaOperacaoDoCheckList(localBufferParaCentralizacaoDoMapaNoEnderecoDoLocalDoEvento);
				
		} else {
			
			rastreamentoDeOperacoesDoChecklistController.setLocalDaPrimeiraOperacaoDoCheckList(localDaPrimeiraOperacaoChecklist);
			rastreamentoDeOperacoesDoChecklistController.setLocalDaUltimaOperacaoDoCheckList(localDaUltimoOperacaoChecklist);
			
		}
		
		rastreamentoDeOperacoesDoChecklistController.setEventoSelecionadoPossuiLatitudeLongitude(oEventoSelecionadoPossuiLatitudeLongitude);
		
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
	 * Define a data atual para a 'DataHoraComentario' para ser exibido na tela.
	 */
	public void dataAtualComentario() {
		logger.debug("ChecklistController.dataAtualComentario");
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


	
	private void mostraMensagemDeFaltaDeOperacoesOuAtividadesNoCheckList(){
		
		FacesContext
		.getCurrentInstance()
		.addMessage(
				null,
				new FacesMessage(
						FacesMessage.SEVERITY_ERROR,
						"Esse CheckList não possui uma Operação ou Atividades "
								+ "para serem visualizadas no Rastreamento!",
						""));
		
	}

}
