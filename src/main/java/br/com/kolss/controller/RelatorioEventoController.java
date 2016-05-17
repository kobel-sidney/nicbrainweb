package br.com.kolss.controller;

import java.util.Date;
import java.util.List;

import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

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
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Local;
import br.com.kolss.service.EventoService;


@Controller(value = "relatorioEventoBean")
@Scope("session")
public class RelatorioEventoController{
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired private EventoService eventoService;
	@Autowired private BbUsuarioLogado bbUsuarioLogado;
	
	private Evento model;
	private EventoDataModel dataModel;
	private String proximaPagina = "ListaConsultaChecklist.nicbrain?faces-redirect=true";	
	
	//	Filtro
	private Long filtroIdLocal;
	private Long filtroIdResponsavel;
	private Long filtroIdCliente;
	private Date filtroDataInicio;

	public RelatorioEventoController() {
		
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

	public Long getFiltroIdResponsavel() {
		return filtroIdResponsavel;
	}

	public void setFiltroIdResponsavel(Long filtroIdResponsavel) {
		this.filtroIdResponsavel = filtroIdResponsavel;
	}
	
	public Long getFiltroIdCliente() {
		return filtroIdCliente;
	}
	
	public void setFiltroIdCliente(Long filtroIdCliente) {
		this.filtroIdCliente = filtroIdCliente;
	}
	
	public Date getFiltroDataInicio() {
		return filtroDataInicio;
	}
	
	public void setFiltroDataInicio(Date filtroDataInicio) {
		this.filtroDataInicio = filtroDataInicio;
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
		this.setFiltroIdResponsavel(null);
		this.setFiltroIdCliente(null);
	}
	
	public EventoDataModel getDataModel() {		
		
		// TODO: PORQUE PRECISO USAR @RequestScoped
		Object obj = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("IdLocal");
		if (obj != null) {
			
			try {
				Long idLocal = Long.parseLong(obj.toString()) ;
				setFiltroIdLocal(idLocal);
			} catch (Exception e) {
				logger.error("Não é um número!");
			}
			
		}
		
		List<Evento> lst = eventoService.obterPorChecklistRelatorio(
				getFiltroIdLocal(),
				getFiltroIdResponsavel(),
				getFiltroIdCliente(),
				getFiltroDataInicio(),
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
		nh.handleNavigation(fc, null, "/restrict/ConsultaChecklist.nicbrain?faces-redirect=true");
	}
	
	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		limparFiltros();
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/"+ getProximaPagina());
	}
		
	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista" + event);
		Evento evento = (Evento) event.getObject();
		setModel(evento);
		avancaPagina();
	}
	
	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		Evento evento = (Evento) event.getObject();
		setModel(evento);
		avancaPagina();
	}
	
	/**
	 * Retorna o texto do cabeçalho da página.
	 * 
	 * @return
	 */
	public String getCabecalho() {
		return BbLocale.getI18nMessage("label.consultaChecklist");
	}
	
	
	public void voltaPagina() {
		logger.info("Volta para a seleção de Checklist x Eventos");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/ConsultaChecklist.nicbrain?faces-redirect=true");
	}

	
}
