package br.com.kolss.controller;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

import org.primefaces.event.SelectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.TipoRonda;
import br.com.kolss.service.TipoRondaService;
import br.com.kolss.util.FacesUtil;

@Controller("tipoRondaBean")
@Scope("session")
public class TipoRondaController {

	private TipoRonda tipoRonda;

	@Autowired
	private TipoRondaService tipoRondaService;

	@PostConstruct
	public void init() {
		tipoRonda = new TipoRonda();
	}

	public String salvar() {
		try {
			tipoRondaService.salvar(tipoRonda);
		} catch (Exception e) {
			FacesUtil.addErrorMessage(e.getMessage());
		}

		return "/restrict/ListaTipoRonda.nicbrain?faces-redirect=true";
	}
	
	public void excluir() {
		try {
			tipoRondaService.excluir(tipoRonda);
		} catch (Exception e) {
			FacesUtil.addErrorMessage(e.getMessage());
		}

		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/ListaTipoRonda.nicbrain?faces-redirect=true");
	}

	public String cancelar() {
		return "/restrict/ListaTipoRonda.nicbrain?faces-redirect=true";
	}
	
	public void novo() {
		tipoRonda = new TipoRonda();
		
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/TipoRonda.nicbrain?faces-redirect=true");
	}
	
	public void onSelect(SelectEvent event) {
		tipoRonda = (TipoRonda) event.getObject();
		
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/TipoRonda.nicbrain?faces-redirect=true");
	}

	public TipoRonda getTipoRonda() {
		return tipoRonda;
	}

	public void setTipoRonda(TipoRonda tipoRonda) {
		this.tipoRonda = tipoRonda;
	}

	public List<TipoRonda> getTipoRondas() {
		return tipoRondaService.obterRondas();
	}

}
