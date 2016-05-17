package br.com.kolss.controller;

import java.io.IOException;

import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

import org.apache.log4j.Logger;
import org.primefaces.event.map.OverlaySelectEvent;
import org.primefaces.model.map.DefaultMapModel;
import org.primefaces.model.map.LatLng;
import org.primefaces.model.map.MapModel;
import org.primefaces.model.map.Marker;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;



@Controller(value = "operacaoBean")
@Scope("request")
public class OperacaoController {	
	
	private Logger logger = Logger.getLogger(this.getClass());
	private MapModel mapaOperacao;  
	private Marker marker;
	  
	    public OperacaoController() {
	    	try {
	    	
		    	mapaOperacao = new DefaultMapModel();  
		          
		    	logger.info("Criando as coordenadas dos estadios");  
		        LatLng coord1 = new LatLng(-22.911667,-43.230278);	//
		        LatLng coord2 = new LatLng(-15.783611,-47.899167);
		        LatLng coord3 = new LatLng(-23.545202,-46.473134);	//
		        LatLng coord4 = new LatLng(-30.065844,-51.235321);	//
		        LatLng coord5 = new LatLng(-19.865833,-43.970833);	//
		        LatLng coord6 = new LatLng(-15.603056,-56.120556);	//
		        LatLng coord7 = new LatLng(-25.448333,-49.276944);	//
		        LatLng coord8 = new LatLng(-3.806944,-38.521944);
		        LatLng coord9 = new LatLng(-3.083287,-60.028095);
		        LatLng coord10 = new LatLng(-5.825928,-35.212716);
		        LatLng coord11 = new LatLng(-8.04,-35.008056);
		        LatLng coord12 = new LatLng(-12.978611,-38.504167);
		         
		        
		          
		        logger.info("Plotando as coordenadas dos estadios no mapa");
		        mapaOperacao.addOverlay(new Marker(coord1, "Maracanã- Rio de Janeiro", null, "../images/iconesNovos/icon-estadio-alerta.png"));	//
		        mapaOperacao.addOverlay(new Marker(coord2, "Mané Garrinha - Brasilia", null, "../images/iconesNovos/icon-estadio2.png"));   
		        mapaOperacao.addOverlay(new Marker(coord3, "Itaquerão - São Paulo", null, "../images/iconesNovos/icon-estadio2.png"));		//
	        	mapaOperacao.addOverlay(new Marker(coord4, "Beira Rio - Porto Alegre", null, "../images/iconesNovos/icon-estadio2.png"));	//
	        	mapaOperacao.addOverlay(new Marker(coord5, "Mineirão - Belo Horizonte", null, "../images/iconesNovos/icon-estadio2.png"));	//
		        mapaOperacao.addOverlay(new Marker(coord6, "Arena Pantanal - Cuiabá", null, "../images/iconesNovos/icon-estadio2.png"));	//
		        mapaOperacao.addOverlay(new Marker(coord7, "Arena da Baixada - Curitiba", null, "../images/iconesNovos/icon-estadio2.png"));	//
	        	mapaOperacao.addOverlay(new Marker(coord8, "Arena Castelão - Fortaleza", null, "../images/iconesNovos/icon-estadio2.png"));
	        	mapaOperacao.addOverlay(new Marker(coord9, "Arena da Amazonia - Manaus", null, "../images/iconesNovos/icon-estadio2.png"));  
		        mapaOperacao.addOverlay(new Marker(coord10, "Arena das Dunas - Natal", null, "../images/iconesNovos/icon-estadio2.png"));  
		        mapaOperacao.addOverlay(new Marker(coord11, "Arena Pernambuco - Recife", null, "../images/iconesNovos/icon-estadio2.png"));  
	        	mapaOperacao.addOverlay(new Marker(coord12, "Arena Fonte Nova - Salvador", null, "../images/iconesNovos/icon-estadio2.png"));
	        	
		        
	    	} catch(Exception e) {
	    		logger.debug("Falha em obter o mapa");
	    		mapaOperacao = null;
	    	}
	    	
	    }
	    
	    
	    public void onMarkerSelect(OverlaySelectEvent event) {  
	        marker = (Marker) event.getOverlay();  
	        
	        FacesContext fc = FacesContext.getCurrentInstance();
	        
	        fc.addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, "Marcador Selecionado", marker.getTitle()));   
	        
	        if (marker.getTitle().equalsIgnoreCase("Maracanã- Rio de Janeiro")) {
	        	avancaPagina();
	        }       
	        
	          
	    }      
	    
	    public void avancaPagina() {
			logger.info("Avancando para a pagina do estadio");
			FacesContext fc = FacesContext.getCurrentInstance();
			NavigationHandler nh = fc.getApplication().getNavigationHandler();
			nh.handleNavigation(fc, null, "/restrict/MapaMaracana.nicbrain");
		}
	    
	    public String cancelOperacao() {
			logger.info("Cancela a operacao ");			
			try {
				FacesContext.getCurrentInstance().getExternalContext()
						.redirect("Operacao.nicbrain");
			} catch (IOException e) {

				e.printStackTrace();
			}
			return null;
		}
	    

		public MapModel getMapaOperacao() {
			return mapaOperacao;
		}

		public void setMapaOperacao(MapModel mapaOperacao) {
			this.mapaOperacao = mapaOperacao;
		}

		public Marker getMarker() {
			return marker;
		}

		public void setMarker(Marker marker) {
			this.marker = marker;
		}
		
		
	  
	    

}
