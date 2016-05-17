package br.com.kolss.controller;

import java.io.Serializable;
import java.util.List;

import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;

import org.apache.log4j.Logger;
import org.primefaces.event.map.OverlaySelectEvent;
import org.primefaces.model.map.DefaultMapModel;
import org.primefaces.model.map.LatLng;
import org.primefaces.model.map.MapModel;
import org.primefaces.model.map.Marker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.model.entities.Local;
import br.com.kolss.service.ChecklistService;
import br.com.kolss.service.LocalService;
import br.com.kolss.service.MensagemService;


@Controller(value = "localPorChecklistBean")
@Scope("session")
public class LocalPorChecklistController {	
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	protected LocalService service;
	
	@Autowired
	protected MensagemService mensagemService;
	
	@Autowired
	protected ChecklistService checklistService;
	
	@Autowired
	protected BbUsuarioLogado bbUsuarioLogado;
	
	
	private MapModel mapModel;
	
	private Long filtroIdCliente = null;
	
	public LocalPorChecklistController() {
	}
	
	/**
	 * Para executar o carregamento dos dados do mapa
	 * 
	 * @param event
	 */
	public void beforePhase(PhaseEvent event) {
		
		// Apenas para executar uma vez!
		if (event.getPhaseId().equals(PhaseId.RENDER_RESPONSE)) {
			popularMapa();
		}
	}
	
	
	/**
	 * Popula o mapa
	 */
	public void popularMapa() {
		logger.debug("LocalPorChecklistController.popularMapa");
		
		/*
		 * O mapa é montado aqui por causa dos eventos da tela.
		 * Cada evento gerado na tela faz com que o mapa seja refeito,
		 * perdendo o item selecionado.
		 */
		mapModel = new DefaultMapModel();
		Serializable idUsuario = bbUsuarioLogado.getUserSession().getId();
		List<Local> lst = service.getLocais(getFiltroIdCliente(), idUsuario);
		for (Local local : lst) {
			
			LatLng coordenada = null;
			try {
				double latitude = Double.parseDouble(local.getLatitude());
				double longitude = Double.parseDouble(local.getLongitude());
				coordenada = new LatLng(latitude, longitude);
				
			} catch (Exception e) {
				logger.debug("Falha em obter o local: " + e.getMessage());
				mapModel = null;
			}
			
			//
			String nomeIcone = null;
			int idTipoLocal = local.getTipoLocal().getId().intValue();
			switch (idTipoLocal) {
			case 1:	// Estadio
				nomeIcone = "icon-estadio";
				break;
			
			case 2:	// Escritório
			default:
				nomeIcone = "icon-edificio";
				break;
			}
			
			
			if (coordenada != null) {
				String urlIcone = "";
				switch (local.getSituacao()) {
				case AGENDADO:
					urlIcone = "../images/iconesNovos/" + nomeIcone + "-agendado.png";
					break;
					
				case SEM_ALERTA:
					urlIcone = "../images/iconesNovos/" + nomeIcone + "-andamento.png";
					break;
					
				case ALERTA_OCORRIDO:
					urlIcone = "../images/iconesNovos/" + nomeIcone + "-ressalva.png";
					break;
					
				case ALERTA_VIGENTE:
					urlIcone = "../images/iconesNovos/" + nomeIcone + "-alerta.png";
					break;
					
				default:
					urlIcone = "../images/iconesNovos/" + nomeIcone + ".png";
					break;
				}
				
				mapModel.addOverlay(
						new Marker(
								coordenada,
								local.getNome(),
								local,
								urlIcone));
			}
		}
		
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
		localSelecionado = service.getLocal(localSelecionado.getId());
		this.setFiltroIdCliente(localSelecionado.getCliente().getId());
		
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/MapaLocalPorChecklist?faces-redirect=true");
	}
	
	public void avancaPagina() {
		logger.info("Avancando para a pagina de 'Eventos X Checklist'");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/ListaEventoPorChecklist.nicbrain");
	}

	public MapModel getMapModel() {
		return mapModel;
	}

	public void setMapModel(MapModel mapModel) {
		this.mapModel = mapModel;
	}
	
	public Long getFiltroIdCliente() {
		return filtroIdCliente;
	}
	
	public void setFiltroIdCliente(Long filtroIdCliente) {
		this.filtroIdCliente = filtroIdCliente;
	}
	
}
