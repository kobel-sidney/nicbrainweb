package br.com.kolss.controller;

import java.io.Serializable;
import java.util.List;

import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;

import org.apache.log4j.Logger;
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


@Controller(value = "localPorClienteBean")
@Scope("request")
public class LocalPorClienteController {	
	
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
	
	
	public LocalPorClienteController() {
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
		logger.debug("LocalPorClienteController.popularMapa");
		
		/*
		 * O mapa é montado aqui por causa dos eventos da tela.
		 * Cada evento gerado na tela faz com que o mapa seja refeito,
		 * perdendo o item selecionado.
		 */
		mapModel = new DefaultMapModel();
		Serializable idUsuario = bbUsuarioLogado.getUserSession().getId();
		List<Local> lst = service.getLocaisPorClientes(idUsuario);
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
	
	public MapModel getMapModel() {
		return mapModel;
	}

	public void setMapModel(MapModel mapModel) {
		this.mapModel = mapModel;
	}
	
}
