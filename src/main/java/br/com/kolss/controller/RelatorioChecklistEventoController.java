package br.com.kolss.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.faces.application.NavigationHandler;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.ToggleEvent;
import org.primefaces.event.UnselectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lowagie.text.Document;
import com.lowagie.text.PageSize;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.datamodel.ChecklistComentarioDataModel;
import br.com.kolss.datamodel.ChecklistDataModel;
import br.com.kolss.datamodel.ChecklistMensagemDataModel;
import br.com.kolss.datamodel.ProcedimentoDataModel;
import br.com.kolss.dto.RelatorioDTO;
import br.com.kolss.enums.TipoExportRelatorioEnum;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.filtro.ChecklistFiltro;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.ChecklistComentario;
import br.com.kolss.model.entities.ChecklistMensagem;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Procedimento;
import br.com.kolss.service.ChecklistService;
import br.com.kolss.service.MensagemService;
import br.com.kolss.service.RelatorioService;
import br.com.kolss.service.regras.SinalizadorCorService;
import br.com.kolss.util.FacesContextUtil;
import br.com.kolss.wrapper.AlertaWrapper;
import br.com.kolss.wrapper.ComentarioWrapper;
import br.com.kolss.wrapper.RelatorioChecklistWrapper;


@Controller(value = "relatorioChecklistEventoBean")
@Scope("session")
public class RelatorioChecklistEventoController{
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired private ChecklistService checklistService;
	@Autowired private SinalizadorCorService sinalizadorCorService;
	@Autowired private BbUsuarioLogado usuarioLogado;
	@Autowired private RelatorioService relatorioService; 
	
	private ChecklistDataModel dataModel;
	private ChecklistMensagemDataModel checklistMensagemDataModel;
	private ChecklistComentarioDataModel checklistComentarioDataModel;
	private String paginaLista = "ListaConsultaChecklist.nicbrain";
	private ProcedimentoDataModel procedimentoDataModel;
	private MensagemService mensagemService;
	private Integer totalChecklist;
	private String observacao;
	private Checklist model = new Checklist();
	private List<Checklist> checklists = Collections.emptyList();
	private Evento eventoSelecionado = new Evento();
	
	// Filtros:
	private Long filtroIdLocal;
	private Long filtroIdResponsavel;
	private Long filtroIdSuperior;
	private Date filtroDataHoraInicio;
	private Long filtroIdStatus;
	
	
	/** Metodo construtor padrao. */
	public RelatorioChecklistEventoController() {
		filtroDataHoraInicio = horaAtual();
	}


	private Date horaAtual() {
		Calendar dataInicio = Calendar.getInstance();
		dataInicio.set(Calendar.HOUR_OF_DAY, 0);
		dataInicio.set(Calendar.MINUTE, 0);
		dataInicio.set(Calendar.SECOND, 0);
		
		return dataInicio.getTime();
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
			FacesContext.getCurrentInstance().getExternalContext().redirect(paginaLista);
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
		checklistService.salvar(model);
		FacesContextUtil.addMessageInfo("", BbLocale.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY));
	}

	private void update() {
		logger.info("Atualizar: " + this.model);
		checklistService.atualizar(model);
		FacesContextUtil.addMessageInfo("",BbLocale.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY));
	}
	
	public void delete() {
		logger.info("Excluir: " + this.model);
		checklistService.remover(model);
		FacesContextUtil.addMessageInfo("",BbLocale.getI18nMessage(BbLocale.DELETE_SUCCESSFULLY));
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
			idEvento = getEventoSelecionado().getId();
		}
		
		ChecklistFiltro checklistFiltro = new  ChecklistFiltro();
		checklistFiltro.setIdEvento(idEvento);
		checklistFiltro.setIdLocal(getFiltroIdLocal());
		checklistFiltro.setIdStatus(getFiltroIdStatus());
		checklistFiltro.setIdUsuarioContexto(usuarioLogado.getUserSession().getId());
		checklistFiltro.setIdUsuarioResponsavel(getFiltroIdResponsavel());
		checklistFiltro.setDataHoraInicio(getFiltroDataHoraInicio());
		
		checklists = checklistService.obterPorFiltro(checklistFiltro);
		
		this.dataModel = new ChecklistDataModel(checklists);
		return this.dataModel;
	}
	
	@SuppressWarnings("unchecked")
	public ChecklistMensagemDataModel getChecklistMensagemDataModel() {
		
		logger.debug("ChecklistController.getChecklistMensagemDataModel");
		
		List<ChecklistMensagem> checklistMensagems = Collections.emptyList();
		
		if (this.model != null) {
			
			Session currentSession = FacesContextUtil.getRequestSession();
			Criteria criteria = currentSession.createCriteria(ChecklistMensagem.class);
			checklistMensagems = criteria.list();
		}
		
		checklistMensagemDataModel = new ChecklistMensagemDataModel(checklistMensagems);
		return checklistMensagemDataModel;
	}

	public void setChecklistMensagemDataModel(ChecklistMensagemDataModel checklistMensagemDataModel) {
		this.checklistMensagemDataModel = checklistMensagemDataModel;
	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		filtroDataHoraInicio = horaAtual();
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/ListaConsultaAtividade.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		logger.info("Volta para a seleção de Checklist x Eventos");
		filtroDataHoraInicio = horaAtual();
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/ConsultaChecklist.nicbrain?faces-redirect=true");
	}
	
	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		Checklist checklist = (Checklist) event.getObject();	
		FacesContextUtil.setSessionAttributeFlash("checklistSelecionado", checklist);
		setModel(checklist);
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		Checklist checklist = (Checklist) event.getObject();	
		setModel(checklist);
		avancaPagina();
	}
	
	public void onRowToggle(ToggleEvent event) {
		logger.info("Exibe os Procedimentos de um Checklist");
		List<Procedimento> lst = null;
		this.procedimentoDataModel = new ProcedimentoDataModel(lst);
	}

	public String getCabecalho() {
		
		StringBuilder cabecalho = new StringBuilder();
		cabecalho.append(BbLocale.getI18nMessage("label.event"));
		
		if (getEventoSelecionado() != null) {
			cabecalho.append(": ");
			cabecalho.append(getEventoSelecionado().getNome());
			
			if (getEventoSelecionado().getLocal() != null) {
				cabecalho.append(" / ");
				cabecalho.append(BbLocale.getI18nMessage("label.venue"));
				cabecalho.append(": ");
				cabecalho.append(getEventoSelecionado().getLocal().getNome());
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
	public String obterTotalChecklist(String status) {
		
		this.totalChecklist = 0;
		
		for(Checklist p : (List<Checklist>) dataModel.getWrappedData()) {
			
			if (p.getStatus().getNome().equalsIgnoreCase(status)) {
				this.totalChecklist ++;
			}
			
		}
		
		return this.totalChecklist.toString();		
	}	
	
	public String exportarRelatorioPdf() {
	
		List<Checklist> listaChecklist = checklists;
		
		ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();   
		String realPath = externalContext.getRealPath("/relatorios/");
		
		List<RelatorioChecklistWrapper> relatorioChecklistWrappers = preencherRelatorioChecklistWrapper(listaChecklist, realPath);

		long millis = System.currentTimeMillis();
		String nomeRelatorio = "checklist_" + String.valueOf(millis) + ".pdf";
		String caminhoCompleto =  System.getProperty("jboss.server.temp.dir")+"/"+ nomeRelatorio;

		HashMap<String, Object> params = new HashMap<String, Object>(); 
		params.put("LOGOTIPO", realPath + "/logo_nic_brain_relatorio.png");
		params.put("LEGENDA", realPath + "/legenda.png");
		params.put("SUBREPORT_DIR", realPath); 
		
		RelatorioDTO relatorioDTO = new RelatorioDTO();
		relatorioDTO.setParametros(params);
		relatorioDTO.setConteudo(relatorioChecklistWrappers);
		relatorioDTO.setTipoExportRelatorioEnum(TipoExportRelatorioEnum.PDF);
		relatorioDTO.setRealPath(realPath+ "/checklistTemplate.jasper");
		relatorioDTO.setDestino(caminhoCompleto);

		if(relatorioService.criarRelatorio(relatorioDTO)){
			exibir(caminhoCompleto);
		}

		return null;
	}

	private List<RelatorioChecklistWrapper> preencherRelatorioChecklistWrapper(	List<Checklist> listaChecklist, String realPath) {
		
		List<RelatorioChecklistWrapper> relatorioChecklistWrappers = new ArrayList<>(0);
		
		for (Checklist objChecklist : listaChecklist) {
			
			RelatorioChecklistWrapper checklistWraper = new RelatorioChecklistWrapper();
			checklistWraper.setNomeChecklist(objChecklist.getNome());
			checklistWraper.setNomeStatus(objChecklist.getStatus().getNome());
			checklistWraper.setNomeEvento(objChecklist.getEvento().getNome());
			checklistWraper.setNomeLocal(objChecklist.getEvento().getLocal().getNome());
			checklistWraper.setDataInicioPrevisto(String.valueOf(objChecklist.getDataInicioPrevisto()));
			checklistWraper.setDataFimPrevisto(String.valueOf(objChecklist.getDataFimPrevisto()));
			
			if(objChecklist.getDataInicioRealizado() != null){
				checklistWraper.setDataInicioRealizado(String.valueOf(objChecklist.getDataInicioRealizado()));
			}else{
				checklistWraper.setDataInicioRealizado("");
			}
			if(objChecklist.getDataFimRealizado() != null){
				checklistWraper.setDataFimRealizado(String.valueOf(objChecklist	.getDataFimRealizado()));
			}else{
				checklistWraper.setDataFimRealizado("");
			}
			
			checklistWraper.setNomeOperador(objChecklist.getUsuarioResponsavel().getPessoa().getNome());
			if(objChecklist.getObservacao() != null){
				checklistWraper.setObservacao(objChecklist.getObservacao());
			}else{
				checklistWraper.setObservacao("");
			}
			
			List<AlertaWrapper> listaAlerta = preencherAlertaWrapper(objChecklist);
			
			checklistWraper.setListaAlertas(listaAlerta);
			checklistWraper.setNomeImagem(realPath + "/imagens/"+ getImage(objChecklist));
			
			List<ComentarioWrapper> listaComentarioWrapper = new ArrayList<>(0);
			
			if(getListaComentariosChecklist(objChecklist.getId()) != null || getListaComentariosChecklist(objChecklist.getId()).isEmpty()){
				
				List<ChecklistComentario> listaComentarios = getListaComentariosChecklist(objChecklist.getId());
				
				for (ChecklistComentario checklistComentario : listaComentarios) {
					ComentarioWrapper comentario = new ComentarioWrapper();
					comentario.setComentario(checklistComentario.getComentario());
					comentario.setNomeResponsavel(checklistComentario.getUsuario().getPessoa().getNome());
					comentario.setDataComentario(String.valueOf(checklistComentario.getDataComentario()));
					listaComentarioWrapper.add(comentario);
				}
				
			}
			checklistWraper.setListaComentarios(listaComentarioWrapper);
			
			relatorioChecklistWrappers.add(checklistWraper);
		}
		return relatorioChecklistWrappers;
	}
	
	public String getImage(Checklist checklist) {
		
		String nomeImagem = null;
		
		Checklist chk = checklistService.obter(checklist.getId());
		
		switch (chk.getSituacao()) {
		case ALERTA_OCORRIDO:
			nomeImagem = "icone_amarelo.png";
			break;
		case ALERTA_VIGENTE:
			nomeImagem = "icone_vermelho.png";
			break;
		case SEM_ALERTA:
			nomeImagem = "icone_verde.png";
			break;
		case CANCELADA:
			nomeImagem = "icone_roxo.png";
			break;
		case AGENDADO:
		default:
			nomeImagem = "icone_branco.png";
			break;
		}
		
		return nomeImagem;
	}

	public void exibir(String pathPdf) {

		try {
			File file = new File(pathPdf);
			byte[] b = fileToByte(file);
			HttpServletResponse res = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
			res.setContentType("application/pdf");
			res.setHeader("Content-disposition","attachment;filename=" + file.getName());
			res.getOutputStream().write(b);
			res.getCharacterEncoding();
			FacesContext.getCurrentInstance().responseComplete();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static byte[] fileToByte(File imagem) throws Exception {
		@SuppressWarnings("resource")
		FileInputStream fis = new FileInputStream(imagem);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int bytesRead = 0;
		while ((bytesRead = fis.read(buffer, 0, 8192)) != -1) {
			baos.write(buffer, 0, bytesRead);
		}
		return baos.toByteArray();
	}
	
	private List<AlertaWrapper> preencherAlertaWrapper(Checklist checklist){

		List<AlertaWrapper> listaWrapper = new ArrayList<>(0);
		List<ChecklistMensagem> checklistMensagems = checklistService.obterChecklistMensagensPorId(checklist.getId());

		if(checklistMensagems.isEmpty()){
			checklistMensagems = Collections.emptyList();
		}
		
		for (ChecklistMensagem checklistMensagem : checklistMensagems) {
			AlertaWrapper alerta = new AlertaWrapper();
			alerta.setMensagem(checklistMensagem.getMensagem().getDescricao());
			listaWrapper.add(alerta);
		}
		
		return listaWrapper;
	}

	public List<ChecklistMensagem> obterChecklistMensagens(Integer idCheckList, Integer idEvento, Integer idLocal,
			Integer idCliente, Integer idContratante, Integer idTipoMensagem) throws ServiceException {
		
		logger.debug("MensagemServiceImpl.obterAlertaAtividadeMensagem");
		List<ChecklistMensagem> lista = new ArrayList<ChecklistMensagem>();
		lista = mensagemService.obterChecklistMensagensRelatorio(idCheckList, idEvento, idLocal,idCliente, idContratante, idTipoMensagem);
		return lista;
	}
	
	public ChecklistComentarioDataModel getChecklistComentarioDataModel() {
		
		logger.debug("RelatorioChecklistEventoController.getChecklistComentarioDataModel");
		
		if (model!=null && model.getId() != null && model.getId().intValue() > 0) {
			List<ChecklistComentario> lst = checklistService.obterChecklistsComentarios(model.getId());
			this.checklistComentarioDataModel = new ChecklistComentarioDataModel(lst);
		}
		
		return checklistComentarioDataModel;
	}
	
	public List<ChecklistComentario> getListaComentarios(Serializable idChecklist) {
		
		logger.debug("RelatorioChecklistEventoController.getListaComentarios");
		List<ChecklistComentario> lista = Collections.emptyList(); 
		
		if(model.getId() != null && model.getId().intValue() > 0){
			lista = checklistService.obterChecklistsComentarios(idChecklist);
		}
		
		return lista;
	}
	
	public List<ChecklistComentario> getListaComentariosChecklist(Serializable idChecklist) {
		
		logger.debug("RelatorioChecklistEventoController.getListaComentariosChecklist");
		List<ChecklistComentario> lista = checklistService.obterChecklistsComentarios(idChecklist);
		
		return lista;
	}
	
	public Integer getTotalChecklist() {
		return totalChecklist;
	}

	public void setTotalChecklist(Integer totalChecklist) {
		this.totalChecklist = totalChecklist;
	}

	public ProcedimentoDataModel getProcedimentoDataModel() {
		return procedimentoDataModel;
	}

	public void setProcedimentoDataModel(ProcedimentoDataModel procedimentoDataModel) {
		this.procedimentoDataModel = procedimentoDataModel;
	}
	
	public Long getFiltroIdLocal() {
		return filtroIdLocal;
	}

	public void setFiltroIdLocal(Long filtroIdLocal) {
		this.filtroIdLocal = filtroIdLocal;
	}

	public Long getFiltroIdResponsavel() {
		return filtroIdResponsavel;
	}

	public void setFiltroIdResponsavel(Long filtroIdResponsavel) {
		this.filtroIdResponsavel = filtroIdResponsavel;
	}

	public Long getFiltroIdSuperior() {
		return filtroIdSuperior;
	}

	public void setFiltroIdSuperior(Long filtroIdSuperior) {
		this.filtroIdSuperior = filtroIdSuperior;
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
	
	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public ChecklistService getChecklistService() {
		return checklistService;
	}

	public void setChecklistService(ChecklistService service) {
		this.checklistService = service;
	}

	public MensagemService getMensagemService() {
		return mensagemService;
	}

	public void setMensagemService(MensagemService mensagemService) {
		this.mensagemService = mensagemService;
	}

	public Evento getEventoSelecionado() {
		return eventoSelecionado;
	}


	public void setEventoSelecionado(Evento eventoSelecionado) {
		this.eventoSelecionado = eventoSelecionado;
	}
}
