package br.com.kolss.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import br.com.kolss.dto.RelatorioDTO;
import br.com.kolss.dto.RelatorioFormularioDTO;
import br.com.kolss.enums.TipoExportRelatorioEnum;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.dao.HibernateDAO;
import br.com.kolss.model.dao.InterfaceDAO;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.AtividadeComentario;
import br.com.kolss.model.entities.AtividadeMensagem;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.TipoMensagem;
import br.com.kolss.service.AtividadeChecklistService;
import br.com.kolss.service.MensagemService;
import br.com.kolss.service.RelatorioFormularioService;
import br.com.kolss.service.RelatorioService;
import br.com.kolss.util.FacesContextUtil;
import br.com.kolss.wrapper.AlertaWrapper;
import br.com.kolss.wrapper.ComentarioWrapper;
import br.com.kolss.wrapper.RelatorioAtividadeChecklistWrapper;

import com.lowagie.text.Document;
import com.lowagie.text.PageSize;


@Controller(value = "relatorioAtividadeBean")
@Scope("session")
public class RelatorioAtividadeController {
	
	@Autowired private AtividadeChecklistService atividadeChecklistService;
	@Autowired private BbUsuarioLogado bbUsuarioLogado;
	@Autowired private MensagemService mensagemService;
	@Autowired private RelatorioService relatorioService;
	@Autowired private RelatorioFormularioService relatorioFormularioService;
	
	private Logger logger = Logger.getLogger(this.getClass());
	private Atividade model = new Atividade();

	private AtividadeDataModel dataModel;
	private String paginaLista = "ListaConsultaAtividade.nicbrain";
	private String observacao;
	private AtividadeMensagemDataModel atividadeMensagemDataModel;
	private AtividadeComentarioDataModel atividadeComentarioDataModel;
	private Integer totalAtividades;
	private Checklist checklistSelecionado;
	
	// Filtros:
	private Long filtroIdResponsavel;
	private Date filtroDataHoraInicio;
	private Long filtroIdStatus;
	private Long filtroIdSetor;
	private Long filtroIdSala;
	
	
	/** Metodo construtor padrao. */
	public RelatorioAtividadeController() {
	}

	private InterfaceDAO<Atividade> getDAO() {
		logger.info("Obter DAO");
		InterfaceDAO<Atividade> dao = new HibernateDAO<Atividade>(Atividade.class, FacesContextUtil.getRequestSession());
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
		getDAO().save(model);
		FacesContextUtil.addMessageInfo("",BbLocale.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY));
	}

	private void update() {
		logger.info("Atualizar: " + this.model);
		getDAO().update(model);
		FacesContextUtil.addMessageInfo("",BbLocale.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY));
	}
	
	public void delete() {
		logger.info("Excluir: " + this.model);
		getDAO().remove(model);
		FacesContextUtil.addMessageInfo("",BbLocale.getI18nMessage(BbLocale.DELETE_SUCCESSFULLY));
	}

	public String search() {
		logger.info("Pesquisar");
		this.getDataModel();
		return null;
	}
	
	public void iniciarAtividade() {
		logger.info("Iniciar Atividade: " + this.model);
		FacesContextUtil.addMessageInfo("",BbLocale.getI18nMessage(BbLocale.START_SUCCESSFULLY));
	}
	
	public void concluirAtividade() {
		logger.info("Concluir Atividade: " + this.model);
		FacesContextUtil.addMessageInfo("",BbLocale.getI18nMessage(BbLocale.COMPLETE_SUCCESSFULLY));
	}
	
	public void cancelarAtividade() {
		logger.info("Cancelar Atividade: " + this.model);
		
		if(!this.getObservacao().isEmpty() || !"".equalsIgnoreCase(this.getObservacao())){
			FacesContextUtil.addMessageInfo("", BbLocale.getI18nMessage(BbLocale.CANCEL_SUCCESSFULLY));
		}else{
			FacesContextUtil.addMessageInfo("","Você precisa digitar o motivo do cancelamento");
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
	
	public boolean hasAtividadeFormularioQuestao(Long idAtividade) {
		boolean result = false;
		if(idAtividade!=null && !idAtividade.equals(0L)){
			result = atividadeChecklistService.hasAtividadeFormularioComQuestao(idAtividade);
		}
		
		return result;
	}

	public AtividadeDataModel getDataModel() {
		
		Serializable idChecklist = null;
		if (getChecklistSelecionado() != null && getChecklistSelecionado().getId().intValue() > 0) {
			idChecklist = getChecklistSelecionado().getId();
		}
		
		List<Atividade> atividades = atividadeChecklistService.getAtividades(
				idChecklist,
				filtroIdResponsavel,
				filtroIdStatus,
				null,
				filtroDataHoraInicio,
				bbUsuarioLogado.getUserSession().getId());
		
		this.dataModel = new AtividadeDataModel(atividades);
		return this.dataModel;
	}

	public AtividadeMensagemDataModel getAtividadeMensagemDataModel() {
		logger.debug("RelatorioAtividadeController.getAtividadeMensagemDataModel");
		
		List<AtividadeMensagem> lst = Collections.<AtividadeMensagem>emptyList();
//		if (this.model != null) {
//			
//			// FIXME: ARRUMAR A INJEÇÃO DE DEPENDENCIA:
////			lst = mensagemService.obterAlertaAtividadeMensagem(
////					this.model.getIdAtividade());
//			
//			// FIXME: REMOVE APÓS A CORREÇÃO DA INJEÇÃO DE DEPENDENCIA:
//			Session currentSession = FacesContextUtil.getRequestSession();
//			Criteria criteria = currentSession.createCriteria(AtividadeMensagem.class);
//			criteria.addOrder(Order.desc("dtHrEnvioMsg"));
//			criteria.add(Restrictions.isNotNull("dtHrEnvioMsg"));
//			criteria.add(Restrictions.eq("id.idAtividade", this.model.getIdAtividade()));
//			criteria.add(Restrictions.eq("ativo", true));
//			criteria.createAlias("mensagem", "msg");
//			criteria.createAlias("msg.tipoMensagem", "tMsg");
//			criteria.add(Restrictions.eq("tMsg.idTipoMsg", TipoMensagem.ID_TIPO_ALERTA));
//			
//			lst = criteria.list();
//		}
		
		this.atividadeMensagemDataModel = new AtividadeMensagemDataModel(lst);
		return atividadeMensagemDataModel;
	}
	
	public List<AtividadeComentario> getAtividadesComentarios(Serializable idAtividade) {
		logger.debug("RelatorioChecklistEventoController.getAtividadesComentarios");
		
		List<AtividadeComentario> lista = Collections.<AtividadeComentario>emptyList();
			if(model.getId() != null && model.getId().intValue() > 0){
				lista = atividadeChecklistService.getAtividadesComentarios(idAtividade);
			}
		return lista;
	}
	
	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/ListaConsultaAtividade.nicbrain");
	}

	public void voltaPagina() {
		logger.info("Volta para a lista de Checklist");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/ListaConsultaChecklist.nicbrain?faces-redirect=true");
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
	 * Retorna o texto do cabeçalho da página.atividadeChecklistService
	 * 
	 * @return
	 */
	public String getCabecalho() {
		
		StringBuilder cabecalho = new StringBuilder();
		cabecalho.append(BbLocale.getI18nMessage("label.event"));
		
		if (this.getChecklistSelecionado() != null
				&& this.getChecklistSelecionado().getEvento() != null) {
			cabecalho.append(": ");
			cabecalho.append(this.getChecklistSelecionado().getEvento().getNome());
			
			if (this.getChecklistSelecionado().getEvento().getLocal() != null) {
				cabecalho.append(" / ");
				cabecalho.append(BbLocale.getI18nMessage("label.venue"));
				cabecalho.append(": ");
				cabecalho.append(this.getChecklistSelecionado().getEvento().getLocal().getNome());
				
				cabecalho.append(" / ");
				cabecalho.append(BbLocale.getI18nMessage("label.checklist"));
				cabecalho.append(": ");				
				cabecalho.append(this.getChecklistSelecionado().getNome());
			}
		}
		
		return cabecalho.toString();
	}
	
	@SuppressWarnings("unchecked")
	public String getCountAtividades(String status) {
		
		this.totalAtividades = 0;
		
		for(Atividade p : (List<Atividade>) dataModel.getWrappedData()) {
			
			if (p.getStatus().getNome().equalsIgnoreCase(status)) {
				this.totalAtividades ++;
			}			
		}
		
		return this.totalAtividades.toString();		
	}	
	
	public void preProcessPDF(Object document) {
		Document pdf = (Document) document;
		pdf.setPageSize(PageSize.A4.rotate());
		pdf.open();
	}
	
	/**
	 * RELATORIO Formulario PDF
	 * 
	 */
	public String exportarRelatorioAtividadePdf(Atividade atividade) {
		
		ExternalContext tmpEC = FacesContext.getCurrentInstance().getExternalContext();   	
		String realPath = tmpEC.getRealPath("/relatorios/");
		long millis = System.currentTimeMillis();
		
		String nomeRelatorio = "formulario_atividade_" + String.valueOf(millis) + ".pdf";
		final RelatorioFormularioDTO relatorioFormularioDTO = relatorioFormularioService.gerarRelatorio(atividade.getId());
		relatorioFormularioDTO.setLogo(realPath + "/logo_nic_brain_relatorio.png");
		
		HashMap<String, Object> params = new HashMap<String, Object>(); 
		params.put("SUBREPORT_DIR", realPath+"/"); 
		
		String caminhoCompleto =  System.getProperty("jboss.server.temp.dir")+"/"+ nomeRelatorio;
		final List<RelatorioFormularioDTO> list = new ArrayList<RelatorioFormularioDTO>();
		list.add(relatorioFormularioDTO);

		RelatorioDTO relatorioDTO = new RelatorioDTO();
		relatorioDTO.setParametros(params);
		relatorioDTO.setConteudo(list);
		relatorioDTO.setTipoExportRelatorioEnum(TipoExportRelatorioEnum.PDF);
		relatorioDTO.setRealPath(realPath+ "/formulario.jasper");
		relatorioDTO.setDestino(caminhoCompleto);

		if(relatorioService.criarRelatorio(relatorioDTO)){
			exibir(caminhoCompleto);
		}

		return null;
		
	}
	
	/**
	 * RELATORIO CHECKLIST PDF
	 * 
	 */
	public String exportarRelatorioPdf() {
		
		List<Atividade> listaAtividadeChecklist = getListaAtividadeChecklist();
		
		String nomeChecklist = null;
		String local = null;
		String nomeEvento = null;
		String dataEvento = null;

		if(getChecklistSelecionado()!=null && !getChecklistSelecionado().getId().equals(0L)){
			nomeChecklist = getChecklistSelecionado().getNome();
			local = getChecklistSelecionado().getEvento().getLocal().getNome();
			nomeEvento = getChecklistSelecionado().getEvento().getNome();
			SimpleDateFormat sdf= new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			dataEvento =sdf.format(getChecklistSelecionado().getEvento().getDataInicio());
		}
		
//		// FIXME: ARRUMAR A INJEÇÃO DE DEPENDENCIA:

		ExternalContext tmpEC = FacesContext.getCurrentInstance().getExternalContext();   	
		String realPath = tmpEC.getRealPath("/relatorios/");
		List<RelatorioAtividadeChecklistWrapper> wrappers = preencherAtividadeWrapper(listaAtividadeChecklist,realPath);

		long millis = System.currentTimeMillis();
		
		String nomeRelatorio = "atividade_do_checklist_" + String.valueOf(millis) + ".pdf";
		
		HashMap<String, Object> params = new HashMap<String, Object>(); 
		params.put("SUBREPORT_DIR", realPath); 
		params.put("NOME_CHECKLIST", nomeChecklist); 
		params.put("LOCAL", local); 
		params.put("EVENTO", nomeEvento); 
		params.put("DATA_EVENTO", dataEvento); 
		params.put("LOGOTIPO", realPath + "/logo_nic_brain_relatorio.png");
		params.put("LEGENDA", realPath + "/legenda.png");
		
		String caminhoCompleto =  System.getProperty("jboss.server.temp.dir")+"/"+ nomeRelatorio;

		RelatorioDTO relatorioDTO = new RelatorioDTO();
		relatorioDTO.setParametros(params);
		relatorioDTO.setConteudo(wrappers);
		relatorioDTO.setTipoExportRelatorioEnum(TipoExportRelatorioEnum.PDF);
		relatorioDTO.setRealPath(realPath+ "/atividadeChecklistTemplate.jasper");
		relatorioDTO.setDestino(caminhoCompleto);

		if(relatorioService.criarRelatorio(relatorioDTO)){
			exibir(caminhoCompleto);
		}

		return null;
	}
	
	private List<RelatorioAtividadeChecklistWrapper> preencherAtividadeWrapper(List<Atividade> listaAtividadeChecklist, String realPath) {
		
		List<RelatorioAtividadeChecklistWrapper> atividadeChecklistWrappers = new ArrayList<>(0);
		SimpleDateFormat sdf= new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		
		
		for (Atividade objAtividadeChecklist : listaAtividadeChecklist) {
			
			RelatorioAtividadeChecklistWrapper atividadeChecklistWraper = new RelatorioAtividadeChecklistWrapper();
			atividadeChecklistWraper.setNumeroItem(String.valueOf(objAtividadeChecklist.getNumeroItem()));
			atividadeChecklistWraper.setNomeAtividade(objAtividadeChecklist.getNome());
			atividadeChecklistWraper.setNomeStatus(objAtividadeChecklist.getStatus().getNome());
			atividadeChecklistWraper.setDataInicioPrevisto(sdf.format(objAtividadeChecklist.getDataInicioPrevisto()));
			atividadeChecklistWraper.setDataFimPrevisto(sdf.format(objAtividadeChecklist.getDataFimPrevisto()));
			
			if(objAtividadeChecklist.getDataInicioRealizado() != null){
				atividadeChecklistWraper.setDataInicioRealizado(sdf.format(objAtividadeChecklist.getDataInicioRealizado()));
			}else{
				atividadeChecklistWraper.setDataInicioRealizado("");
			}
			
			if(objAtividadeChecklist.getDataFimRealizado() != null){
				atividadeChecklistWraper.setDataFimRealizado(sdf.format(objAtividadeChecklist.getDataFimRealizado()));
			}else{
				atividadeChecklistWraper.setDataFimRealizado("");
			}
			atividadeChecklistWraper.setNomeOperador(objAtividadeChecklist.getUsuarioResponsavel().getPessoa().getNome());
			
			if(objAtividadeChecklist.getObservacao() != null){
				atividadeChecklistWraper.setObservacao(objAtividadeChecklist.getObservacao());
			}else{
				atividadeChecklistWraper.setObservacao("");
			}
			
			atividadeChecklistWraper.setNomeImagem(realPath + "/imagens/"+ getImage(objAtividadeChecklist));

			List<AlertaWrapper> alertaWrappers = new ArrayList<>(0);
			
			
			if(getListaAlerta(objAtividadeChecklist.getId()) != null || getListaAlerta(objAtividadeChecklist.getId()).isEmpty()){
				alertaWrappers = getListaAlerta(objAtividadeChecklist.getId());
			}
			
			List<ComentarioWrapper> listaComentarioWrapper = new ArrayList<>(0);
			List<AtividadeComentario> atvsComentarios =	getAtividadesComentarios(objAtividadeChecklist.getId());
			
			if(atvsComentarios != null || getListaAlerta(objAtividadeChecklist.getId()).isEmpty()){
				
				for (AtividadeComentario atividadeComentario : atvsComentarios) {
					ComentarioWrapper comentario = new ComentarioWrapper();
					comentario.setComentario(atividadeComentario.getComentario());
					comentario.setNomeResponsavel(atividadeComentario.getUsuario().getPessoa().getNome());
					comentario.setDataComentario(String.valueOf(atividadeComentario.getDataComentario()));
					listaComentarioWrapper.add(comentario);
				}
			}
			
			atividadeChecklistWraper.setListaAlertas(alertaWrappers);
			atividadeChecklistWraper.setListaComentarios(listaComentarioWrapper);
			atividadeChecklistWrappers.add(atividadeChecklistWraper);
		}
		
		
		return atividadeChecklistWrappers;
	}
//	// FIXME: ARRUMAR A INJEÇÃO DE DEPENDENCIA:

	public List<Atividade> getListaAtividadeChecklist() {

		Long idChecklist = null;
		if (getChecklistSelecionado() != null && getChecklistSelecionado().getId() != null) {
			idChecklist = getChecklistSelecionado().getId();
		}

		List<Atividade> lst = atividadeChecklistService.getAtividades(
				idChecklist,
				filtroIdResponsavel,
				filtroIdStatus,
				null,
				filtroDataHoraInicio,
				bbUsuarioLogado.getUserSession().getId());
		return lst;
	}

	public String getImage(Atividade atividade) {
		String nomeImagem = null;
//		SinalizadorCorServiceImpl sinalizadorCorService = new SinalizadorCorServiceImpl();
//		sinalizadorCorService.setSessionFactory(HibernateUtil.getSessionFactory());
//		SinalizadorCorEnum cor = sinalizadorCorService.getSinalizadorCor(atividade.getId());
		
		Atividade atv = atividadeChecklistService.obter(atividade.getId());
		switch (atv.getSituacao()) {
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
			HttpServletResponse response = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
			response.setContentType("application/pdf");
			response.setHeader("Content-disposition","attachment;filename=" + file.getName());
			response.getOutputStream().write(b);
			response.getCharacterEncoding();
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
	
	private List<AlertaWrapper> getListaAlerta(Serializable idAtividade){
		
		List<AtividadeMensagem> lista = obterAlertaAtividadeMensagem(idAtividade); 
		List<AlertaWrapper> listaWrapper = new ArrayList<>(0);
		
		for (AtividadeMensagem atividadeMensagem : lista) {
			AlertaWrapper alerta = new AlertaWrapper();
			alerta.setMensagem(atividadeMensagem.getMensagem().getDescricao());
			listaWrapper.add(alerta);
		}
		
		return listaWrapper;
	}
	
	public AtividadeComentarioDataModel getAtividadeComentarioDataModel() {
		logger.debug("RelatorioAtividadeController.getAtividadeComentarioDataModel");
				
		List<AtividadeComentario> lst = getAtividadesComentarios(this.model.getId());
		
		this.atividadeComentarioDataModel = new AtividadeComentarioDataModel(lst);
		return atividadeComentarioDataModel;
	}
	
	public List<AtividadeMensagem> obterAlertaAtividadeMensagem(Serializable idAtividade) throws ServiceException {
		
		logger.debug("MensagemServiceImpl.obterAlertaAtividadeMensagem");
		List<AtividadeMensagem> lista = new ArrayList<AtividadeMensagem>();
		lista = mensagemService.obterAtividadesMensagem(idAtividade,TipoMensagem.ID_TIPO_ALERTA);
		
		return lista;
	}
	
	public MensagemService getMensagemService() {
		return mensagemService;
	}

	public void setMensagemService(MensagemService mensagemService) {
		this.mensagemService = mensagemService;
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
	
	public Checklist getChecklistSelecionado() {
		return checklistSelecionado;
	}

	public void setChecklistSelecionado(Checklist checklistSelecionado) {
		this.checklistSelecionado = checklistSelecionado;
	}

	
//	public void exportarExcel(JasperPrint print, String nomeRelatorio){
//		String dir = "/tmp/";
//		//Connection kns = BukaKoneksi(url);   
//		HashMap hm = new HashMap(); 
//		String nfl = dir+"file/__.xls"; 
//		JRXlsExporter exporter = new JRXlsExporter();
//		ByteArrayOutputStream xlsReport = new ByteArrayOutputStream();  
//		exporter.setParameter(JRExporterParameter.JASPER_PRINT, print);
//		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, xlsReport);
//		exporter.setParameter(JRExporterParameter.OUTPUT_FILE, nomeRelatorio);
//		exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, nfl);
//		try {
//			exporter.exportReport();
//			//download file
//			byte bytes[] = xlsReport.toByteArray(); 
//			HttpServletResponse response = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
//			response.setHeader("Content-disposition", "attachment; filename=\"" + nomeRelatorio);
//			response.setContentType("application/vnd.ms-excel");
//			response.setContentLength(bytes.length);
//			xlsReport.close();
//			OutputStream ouputStream = response.getOutputStream();
//			ouputStream.write(bytes, 0, bytes.length);
//			ouputStream.flush();
//			ouputStream.close();
//			
//		} catch (JRException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} 
//	}
	
	
	/**
	 * RELATORIO CHECKLIST
	 * 
	 */
//	public String exportarRelatorioExcel() {
//		
//		List<Atividade> listaAtividadeChecklist = getListaAtividadeChecklist();
//		@SuppressWarnings("rawtypes")
//		List lista = new ArrayList();
//		String path = System.getProperty("user.dir");
//		String nomeChecklist = null;
//		String local = null;
//		String nomeEvento = null;
//		String dataEvento = null;
//		ExternalContext tmpEC;      
//
//		tmpEC = FacesContext.getCurrentInstance().getExternalContext();   
//		String realPath=tmpEC.getRealPath("/relatorios/");
//		
//		for (Atividade objAtividadeChecklist : listaAtividadeChecklist) {
//			RelatorioAtividadeChecklistWrapper atividadeChecklistWraper = new RelatorioAtividadeChecklistWrapper();
//			atividadeChecklistWraper.setNumeroItem(String.valueOf(objAtividadeChecklist.getNumeroItem()));
//			atividadeChecklistWraper.setNomeAtividade(objAtividadeChecklist.getNome());;
//			atividadeChecklistWraper.setNomeStatus(objAtividadeChecklist.getStatus().getNome());
//			atividadeChecklistWraper.setDataInicioPrevisto(String.valueOf(
//					objAtividadeChecklist.getDataInicioPrevisto()));
//			atividadeChecklistWraper.setDataFimPrevisto(String.valueOf(
//					objAtividadeChecklist.getDataFimPrevisto()));
//			if(objAtividadeChecklist.getDataInicioRealizado() != null){
//				atividadeChecklistWraper.setDataInicioRealizado(String.valueOf(
//						objAtividadeChecklist.getDataInicioRealizado()));
//			}else{
//				atividadeChecklistWraper.setDataInicioRealizado("");
//			}
//			if(objAtividadeChecklist.getDataFimRealizado() != null){
//			atividadeChecklistWraper.setDataFimRealizado(String.valueOf(
//					objAtividadeChecklist.getDataFimRealizado()));
//			}else{
//				atividadeChecklistWraper.setDataFimRealizado("");
//			}
//			atividadeChecklistWraper.setNomeOperador(
//					objAtividadeChecklist.getUsuarioResponsavel().getPessoa().getNome());
//			if(objAtividadeChecklist.getObservacao() != null){
//				atividadeChecklistWraper.setObservacao(objAtividadeChecklist.getObservacao());
//			}else{
//				atividadeChecklistWraper.setObservacao("");
//			}
//			atividadeChecklistWraper.setNomeImagem(realPath + "/imagens/"
//					+ getImage(objAtividadeChecklist));
//
//			List listaAlerta = new ArrayList();
//			
//			List<AtividadeComentario> atvsComentarios = 
//					getAtividadesComentarios(objAtividadeChecklist.getId());
//			List listaComentarioWrapper = new ArrayList();
//			if(atvsComentarios != null || getListaAlerta(objAtividadeChecklist.getId()).isEmpty()){
//				
//				for (AtividadeComentario atividadeComentario : atvsComentarios) {
//					ComentarioWrapper comentario = new ComentarioWrapper();
//					comentario.setComentario(atividadeComentario.getComentario());
//					comentario.setNomeResponsavel(atividadeComentario.getUsuario().getPessoa().getNome());
//					comentario.setDataComentario(String.valueOf(atividadeComentario.getDataComentario()));
//					listaComentarioWrapper.add(comentario);
//				}
//			}
//			atividadeChecklistWraper.setListaAlertas(listaAlerta);
//			atividadeChecklistWraper.setListaComentarios(listaComentarioWrapper);
//			 
//			nomeChecklist = objAtividadeChecklist.getChecklist().getNome();
//			local         = objAtividadeChecklist.getChecklist().getEvento().getLocal().getNome();
//			
//			nomeEvento = objAtividadeChecklist.getChecklist().getEvento().getNome();
//			dataEvento = objAtividadeChecklist.getChecklist().getEvento().getDataInicio().toString();
//			
//			lista.add(atividadeChecklistWraper);
//		}
//
//		long millis = System.currentTimeMillis();
//		String nomeRelatorio = "atividade_do_checklist_" + String.valueOf(millis) + ".xls";
//		
//		HashMap<String, Object> params = new HashMap<String, Object>(); 
//		params.put("SUBREPORT_DIR", realPath); 
//		params.put("NOME_CHECKLIST", nomeChecklist); 
//		params.put("LOCAL", local); 
//		params.put("EVENTO", nomeEvento); 
//		params.put("DATA_EVENTO", dataEvento); 
//		params.put("LOGOTIPO", realPath + "/logo_nic_brain_relatorio.png");
//		params.put("LEGENDA", realPath + "/legenda.png");
//		
//		try {
//			JasperReport report = JasperCompileManager.compileReport(realPath
//					+ "/atividadeChecklistTemplate.jrxml");
//			JasperPrint print = JasperFillManager.fillReport(report, params,
//					new JRBeanCollectionDataSource(lista));
//			exportarExcel(print, nomeRelatorio);
//			
//		} catch (JRException e) {
//			e.printStackTrace();
//		}
//		return null;
//	}

	
	
}
