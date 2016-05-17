package br.com.kolss.controller;

import java.io.IOException;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.datamodel.PostoServicoDataModel;
import br.com.kolss.model.entities.AbstractEntity;
import br.com.kolss.model.entities.PostoServico;
import br.com.kolss.model.entities.Setor;
import br.com.kolss.model.entities.TipoServico;
import br.com.kolss.service.PostoServicoService;
import br.com.kolss.service.SetorService;
import br.com.kolss.service.TipoServicoService;

@Controller(value = "postoServicoBean")
@Scope("session")
public class PostoServicoController {
	
	@Autowired
	private PostoServicoService servicePostoServico;

	@Autowired
	private SetorService serviceSetor;
	
	@Autowired
	private TipoServicoService TipoServicoService;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	private PostoServico model = new PostoServico();
	
	
	public PostoServicoController() {

	}

	public PostoServicoDataModel getListaPostoServico() {
		return new PostoServicoDataModel(
				servicePostoServico.getPostoServicos(null, null, null, usuarioLogado.getUserSession().getId()));
	}

	public List<Setor> getSetores() {
		return serviceSetor.obterTodos();
	}

	@SuppressWarnings("rawtypes")
	public List<? extends AbstractEntity> getTipoServicos() {
		return TipoServicoService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado());
	}

	public String novo() {
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		model = new PostoServico();
		return null;
	}

	public void add() {
		TipoServico tipoServico = TipoServicoService.obter(model.getTipoServico().getId());
		Setor setor = serviceSetor.find(model.getSetor().getId());
		model.setTipoServico(tipoServico);
		model.setSetor(setor);
		
		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaPostoServico.nicbrain?faces-redirect=true");
	}

	private void insert() {
		servicePostoServico.salvar(model);
		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		servicePostoServico.atualizar(model);
		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		model = new PostoServico();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaPostoServico.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		try {
			servicePostoServico.remover(model);
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
							.getI18nMessage(BbLocale.DELETE_SUCCESSFULLY), ""));

		} catch (DataIntegrityViolationException ex) {
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
							.getI18nMessage(BbLocale.CONSTRAINT_ERROR), ""));
		}
	}

	public void onRowSelect(SelectEvent event) {
		setModel((PostoServico) event.getObject());
		model = servicePostoServico.obter(model.getId());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		setModel((PostoServico) event.getObject());
		avancaPagina();
	}

	public void avancaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/PostoServico.nicbrain?faces-redirect=true");
	}

	public PostoServico getModel() {
		return model;
	}

	public void setModel(PostoServico model) {
		this.model = model;
	}

}
