package br.com.kolss.controller;

import java.io.Serializable;
import java.util.List;

import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

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
import br.com.kolss.model.entities.Ocorrencia;
import br.com.kolss.service.AlertaService;
import br.com.kolss.service.LocalService;
import br.com.kolss.service.OcorrenciaService;


@Controller(value = "localPorOcorrenciaBean")
@Scope("session")
public class LocalPorOcorrenciaController {	
	
	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	protected LocalService service;
	
	@Autowired
	protected AlertaService alertaService;
	
	@Autowired
	protected OcorrenciaService ocorrenciaService;
	
	@Autowired
	protected BbUsuarioLogado bbUsuarioLogado;
	
	private MapModel mapModel;
	
	private Local localSelecionado;
	
	private MapModel mapModelDetalhe;
	private Integer zoom;
	private String latitude;
	private String longitude;
	
	public LocalPorOcorrenciaController() {
		popularMapa();
	}
	
	/**
	 * Popula o mapa
	 */
	public void popularMapa() {
		logger.debug("LocalPorOcorrenciaController.popularMapa");
		
		/*
		 * O mapa é montado aqui por causa dos eventos da tela.
		 * Cada evento gerado na tela faz com que o mapa seja refeito,
		 * perdendo o item selecionado.
		 */
		try {
			
			mapModel = new DefaultMapModel();
			Serializable idUsuario = bbUsuarioLogado.getUserSession().getId();
			List<Local> lst = service.getLocais(idUsuario);
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
				
				/*
				 * FIXME: Se for 'Rio Centro', deve exibir outro ícone.
				 * REMOVER APÓS APRESENTAÇÃO 06/05/2014
				 * Modelar forma de diferenciar tipos de prédios.
				 * 
				 * FIXME: Se for 'Escritório Kolss' ou ' 'Escritório Kobel', 
				 * deve exibir outro ícone.
				 * REMOVER APÓS APRESENTAÇÃO 28/05/2014
				 * Modelar forma de diferenciar tipos de prédios.
				 */
//				String urlIcone = "";
//				if (Integer.valueOf(17).equals(local.getIdLocal())
//						|| Integer.valueOf(1).equals(local.getIdLocal())
//						|| Integer.valueOf(2).equals(local.getIdLocal())
//						|| Integer.valueOf(3).equals(local.getIdLocal())) {
//					urlIcone = "../images/iconesNovos/edificio.png";
//				} else {
//					
//					// Obter o tipo de icone a ser exibido:
//					boolean hasAlerta =
//							alertaService.existeAlertaOcorrenciaAtivoPorLocalPorContexto(
//							local.getIdLocal(),
//							bUsuarioLogado.getUserSession().getId());
//					urlIcone = hasAlerta
//							? "../images/iconesNovos/icon-estadio-alerta.png"
//							: "../images/iconesNovos/icon-estadio2.png"; 
//				}
				
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
					switch (local.getSituacaoOcorrencia()) {
					case SEM_OCORRENCIA:
						urlIcone = "../images/iconesNovos/" + nomeIcone + "-andamento.png";
						break;
						
					case OCORRENCIA_VIGENTE:
						urlIcone = "../images/iconesNovos/" + nomeIcone + "-alerta.png";
						break;
						
					case SEM_INDICADOR:
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
		} catch (Exception e) {
			logger.debug("Falha em obter o mapa: " + e.getMessage());
			mapModel = null;
		}
	}
	
	public void avancaPagina() {
		
		
	}

	public MapModel getMapModel() {	
		return mapModel;
	}

	public void setMapModel(MapModel mapModel) {
		this.mapModel = mapModel;
	}
	
	
	
	public void onMarkerSelect(OverlaySelectEvent event) {
		Marker marker = (Marker) event.getOverlay();
		localSelecionado = (Local) marker.getData();		
						
				
		logger.info("Avancando para o proximo mapa do local selecionado'");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/MapaLocalDetalhePorOcorrencia.nicbrain");
		
		popularMapaDetalhes();
	}


	
	public MapModel getMapModelDetalhe() {
		return mapModelDetalhe;
	}

	public void setMapModelDetalhe(MapModel mapModelDetalhe) {
		this.mapModelDetalhe = mapModelDetalhe;
	}

	public Integer getZoom() {
		return zoom;
	}

	public void setZoom(Integer zoom) {
		this.zoom = zoom;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	private void popularMapaDetalhes() {
		
		try {
			
			/*
			 * O mapa é montado aqui por causa dos eventos da tela.
			 * Cada evento gerado na tela faz com que o mapa seja refeito,
			 * perdendo o item selecionado.
			 */
			
			
			setZoom(17);
			setLatitude(localSelecionado.getLatitude());
			setLongitude(localSelecionado.getLongitude());
			mapModelDetalhe = new DefaultMapModel();
			
			Serializable idUsuario = bbUsuarioLogado.getUserSession().getId();
			List<Ocorrencia> lst = 
//					ocorrenciaService.getOcorrenciasEmAndamentoPorLocalPorContexto(localSelecionado, BbUsuarioLogado.getUserSession().getId());
					ocorrenciaService.getOcorrenciasEmAndamentoPorLocalPorContexto(
							localSelecionado.getId(),
							localSelecionado.getCliente().getId(),
							localSelecionado.getCliente().getContratante().getId(),
							idUsuario);
			
			for (Ocorrencia ocorrencia: lst) {
				
				double latitudeOcorrencia = Double.parseDouble(ocorrencia.getLatitude());
				double longitudeOcorrencia = Double.parseDouble(ocorrencia.getLongitude());
				LatLng coordenadaOcorrencia = new LatLng(latitudeOcorrencia, longitudeOcorrencia);
				String descricaoOcorrencia = ocorrencia.getDescricaoOcorrencia();
			
				//String urlIcone = "../images/iconesNovos/google-red.png";
				
				mapModelDetalhe.addOverlay (
					new Marker (coordenadaOcorrencia, 
								descricaoOcorrencia,
								localSelecionado));
			}
		
		} catch (Exception e) {
			logger.debug("Falha em obter o mapa: " + e.getMessage());
			mapModel = null;
		}		
	}
	
	
}
