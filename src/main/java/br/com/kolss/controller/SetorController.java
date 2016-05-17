package br.com.kolss.controller;

import javax.annotation.PostConstruct;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

import org.primefaces.event.SelectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Setor;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.LocalService;
import br.com.kolss.service.SetorService;
import br.com.kolss.service.UsuarioService;
import br.com.kolss.util.FacesUtil;

/**
 *
 * @author weverton
 */
@Controller(value = "setorBean")
@Scope(value = "session")
public class SetorController {

    @Autowired
    private SetorService setorService;
    
    @Autowired
    private UsuarioService usuarioService;
    
    @Autowired
    private LocalService localService;
    
    @Autowired
    private BbUsuarioLogado bbUsuarioLogado;
    
    private Setor setor;

    @PostConstruct
    public void init() {
    }

    public void excluir() {
        try {
            this.setorService.excluir(setor);
        } catch (Exception e) {
            FacesUtil.addErrorMessage(e.getMessage());
        }
    }
    
    public void salvar() {
		try {
			Usuario usuarioResp = usuarioService.obter(setor.getUsuarioResponsavel().getId());
			Local local = localService.getLocal(setor.getLocal().getId());
			setor.setUsuarioResponsavel(usuarioResp);
			setor.setLocal(local);
			
			setorService.salvar(setor);
		} catch (Exception e) {
			FacesUtil.addErrorMessage(e.getMessage());
		}
		
		FacesContext fc = FacesContext.getCurrentInstance();
        NavigationHandler nh = fc.getApplication().getNavigationHandler();
        nh.handleNavigation(fc, null, "/restrict/ListaSetor.nicbrain?faces-redirect=true");
	}
    
    public void cancelar() {
    	FacesContext fc = FacesContext.getCurrentInstance();
        NavigationHandler nh = fc.getApplication().getNavigationHandler();
        nh.handleNavigation(fc, null, "/restrict/ListaSetor.nicbrain?faces-redirect=true");
	}

    public void rowSetorSelect(SelectEvent event) {
        this.setor = (Setor) event.getObject();
        setor = setorService.find(setor.getId());
        
        FacesContext fc = FacesContext.getCurrentInstance();
        NavigationHandler nh = fc.getApplication().getNavigationHandler();
        nh.handleNavigation(fc, null, "/restrict/Setor.nicbrain?faces-redirect=true");
    }

    public Setor getSetor() {
        return setor;
    }

    public void setSetor(Setor setor) {
        this.setor = setor;
    }

}
