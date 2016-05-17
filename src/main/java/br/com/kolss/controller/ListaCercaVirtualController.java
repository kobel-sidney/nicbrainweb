package br.com.kolss.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

import org.primefaces.event.SelectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.model.entities.CercaVirtual;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.repository.LocalRepository;

@Controller(value = "listaCercaVirtual")
@Scope(value = "session")
public class ListaCercaVirtualController {

	private Long idLocal;
	private Integer idCercaVirtual;
	private CercaVirtual cercaVirtual;
	private List<Local> locais;

	@Autowired
	private LocalRepository localRepository;

	@Autowired
	private BbUsuarioLogado usuarioLogado;

	public List<Local> getLocais() {
		Usuario usuario = usuarioLogado.getUserSession();
		this.locais = localRepository.getLocaisRonda(usuario.getId());
		if (locais == null) {
			locais = new ArrayList<>();
		}
		return locais;
	}

	public void setLocais(List<Local> locais) {
		this.locais = locais;
	}

	public Long getIdLocal() {
		return idLocal;
	}

	public void setIdLocal(Long idLocal) {
		this.idLocal = idLocal;
	}

	public Integer getIdCercaVirtual() {
		return idCercaVirtual;
	}

	public void setIdCercaVirtual(Integer idCercaVirtual) {
		this.idCercaVirtual = idCercaVirtual;
	}

	public CercaVirtual getCercaVirtual() {
		return cercaVirtual;
	}

	public void setCercaVirtual(CercaVirtual cercaVirtual) {
		this.cercaVirtual = cercaVirtual;
	}

	public void onRowSelect(SelectEvent event) {
		this.cercaVirtual = (CercaVirtual) event.getObject();
		this.idLocal = this.cercaVirtual.getLocal().getId();
		this.idCercaVirtual = this.cercaVirtual.getId();
		irParaCadastro();
	}
	
	public void limparCerca() {
		this.cercaVirtual = null;
		this.idCercaVirtual = null;
	}

	public void irParaCadastro() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/cercaVirtual.nicbrain?faces-redirect=true");
	}
}
