package br.com.kolss.controller;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import org.apache.log4j.Logger;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;
import org.primefaces.event.map.OverlaySelectEvent;
import org.primefaces.model.map.Marker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.datamodel.EventoDataModel;
import br.com.kolss.dto.ChecklistDTO;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Local;
import br.com.kolss.service.EventoService;
import br.com.kolss.util.FacesContextUtil;


@Controller(value = "relatorioChecklistBean")
@Scope("request")
public class RelatorioChecklistController {
	
	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired private EventoService eventoService;
	@Autowired private BbUsuarioLogado bbUsuarioLogado;
	
	private Evento model;
	private EventoDataModel dataModel;
	private String paginaLista = "ListaLocal.nicbrain";
	private String proximaPagina = "ListaRelatorioChecklist.nicbrain" + "";
	
	private Serializable filtroIdLocal;
	private Serializable filtroIdResponsavel;


	/** Metodo construtor padrao. */
	public RelatorioChecklistController() {
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
		eventoService.salvar(model);
		FacesContextUtil.addMessageInfo("", BbLocale.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY));
		
	}

	private void update() {
		logger.info("Atualizar: " + this.model);
		eventoService.atualizar(model);
		FacesContextUtil.addMessageInfo("", BbLocale.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY));
	}

	public void delete() {
		logger.info("Excluir: " + this.model);
		eventoService.remover(model);
		FacesContextUtil.addMessageInfo("", BbLocale.getI18nMessage(BbLocale.DELETE_SUCCESSFULLY));
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

	public Serializable getFiltroIdLocal() {
		return filtroIdLocal;
	}

	public void setFiltroIdLocal(Serializable filtroIdLocal) {
		this.filtroIdLocal = filtroIdLocal;
	}

	public Serializable getFiltroIdResponsavel() {
		return filtroIdResponsavel;
	}

	public void setFiltroIdPessoaResponsavel(Serializable filtroIdPessoaResponsavel) {
		this.filtroIdResponsavel = filtroIdPessoaResponsavel;
	}

	public String getProximaPagina() {
		return proximaPagina;
	}

	public void setProximaPagina(String proximaPagina) {
		this.proximaPagina = proximaPagina;
	}

	/** Limpa os dados dos filtros. */
	private void limparFiltros() {
		logger.info("Limpa os filtros da tela");
		this.setFiltroIdLocal(null);
		this.setFiltroIdPessoaResponsavel(null);
	}

	public EventoDataModel getDataModel() {

		// TODO: PORQUE PRECISO USAR @RequestScoped
		Object obj = FacesContext.getCurrentInstance().getExternalContext()
				.getRequestParameterMap().get("IdLocal");
		if (obj != null) {

			try {
				Long idLocal = Long.parseLong(obj.toString());
				setFiltroIdLocal(idLocal);
			} catch (Exception e) {
				logger.error("Não é um número!");
			}

		}
		
		List<Evento> lst = eventoService.getEventosPorChecklist(
				getFiltroIdLocal(),
				getFiltroIdResponsavel(),
				null,
				null,
				bbUsuarioLogado.getUserSession().getId());
		
		this.dataModel = new EventoDataModel(lst);
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
		nh.handleNavigation(fc, null,
				"/restrict/ListaEventoPorChecklist.nicbrain");
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
		return BbLocale.getI18nMessage("label.relatorioChecklist");
	}

	public void voltaPagina() {
		logger.info("Volta para a seleção de Checklist x Eventos");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/RelatorioChecklist.nicbrain?faces-redirect=true");
	}
	
	public void exportarRelatorio(){
		
	 ChecklistDTO checklist = new ChecklistDTO();
	 checklist.setNomeCheckList("nome teste 1");
	 List lista = new ArrayList();
	 lista.add(checklist);
	 
	 try {
			JasperReport report = JasperCompileManager .compileReport("/Users/eduardodeabreu/EDX/KOLSS/Workspace/REPOSITORIO/PROJETO-NICBRAIN_GITHUB/nicBrain/WebContent/resources/report376.jrxml");
			JasperPrint print = JasperFillManager.fillReport(report, null, new JRBeanCollectionDataSource(lista));
			JasperExportManager.exportReportToPdfFile(print,
					"/Users/eduardodeabreu/EDX/KOLSS/Workspace/REPOSITORIO/PROJETO-NICBRAIN_GITHUB/nicBrain/WebContent/resources/checklist.pdf");
		
	 } catch (JRException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	}

}
