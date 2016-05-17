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
import br.com.kolss.datamodel.RelacionamentoPerfilFormularioDataModel;
import br.com.kolss.model.entities.GrupoQuestao;
import br.com.kolss.model.entities.PerfilFormulario;
import br.com.kolss.model.entities.Questao;
import br.com.kolss.model.entities.RelacionamentoPerfilFormulario;
import br.com.kolss.model.entities.Resposta;
import br.com.kolss.service.GrupoQuestaoService;
import br.com.kolss.service.PerfilFormularioService;
import br.com.kolss.service.QuestaoService;
import br.com.kolss.service.RelacionamentoPerflFormularioService;
import br.com.kolss.service.RespostaService;

@Controller(value = "relacionamentoPerfilFormularioBean")
@Scope("session")
public class RelacionamentoPerflFormularioController {

	private RelacionamentoPerfilFormulario model = new RelacionamentoPerfilFormulario();

	private RelacionamentoPerfilFormularioDataModel listaRelacionamentos;

	@Autowired
	private RelacionamentoPerflFormularioService serviceRelacionamentoPerfilFormulario;

	@Autowired
	private PerfilFormularioService servicePerfilFormulario;

	@Autowired
	private GrupoQuestaoService serviceGrupoQuestao;

	@Autowired
	private QuestaoService serviceQuestao;

	@Autowired
	private RespostaService serviceResposta;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	public RelacionamentoPerflFormularioController() {
	}

	public RelacionamentoPerfilFormularioDataModel getListaRelacionamentos() {
		
		 listaRelacionamentos = new RelacionamentoPerfilFormularioDataModel(
				serviceRelacionamentoPerfilFormulario
						.listarRelacionamentoPerfilFormulario());
		 
		 return listaRelacionamentos;
	}

	public List<PerfilFormulario> getPerfilFormularios() {
		return servicePerfilFormulario.obterTodos(usuarioLogado.obterContratanteUsuarioLogado());
	}

	public List<GrupoQuestao> getGruposQuestoes() {
		return serviceGrupoQuestao.obterTodos(usuarioLogado.obterContratanteUsuarioLogado());
	}

	public List<Questao> getQuestoes() {
		return serviceQuestao.obterTodos(usuarioLogado.obterContratanteUsuarioLogado());
	}

	public List<Resposta> getRespostas() {
		return serviceResposta.obterTodos(usuarioLogado.obterContratanteUsuarioLogado());
	}

	public String novo() {
		limpar();
		avancaPagina();
		return null;
	}

	public void delete() {
		try {
			serviceRelacionamentoPerfilFormulario.remover(model);

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

	public String limpar() {
		model = new RelacionamentoPerfilFormulario();
		return null;
	}

	public String add() {
		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaRelacionamentoPerfilFormulario.nicbrain";
	}

	private void insert() {
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		serviceRelacionamentoPerfilFormulario.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));

	}

	private void update() {
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		serviceRelacionamentoPerfilFormulario.atualizar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public String cancel() {
		model = new RelacionamentoPerfilFormulario();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaRelacionamentoPerfilFormulario.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public RelacionamentoPerfilFormulario getModel() {
		return model;
	}

	public void setModel(RelacionamentoPerfilFormulario model) {
		this.model = model;
	}

	public void onRowSelect(SelectEvent event) {
		setModel((RelacionamentoPerfilFormulario) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		setModel((RelacionamentoPerfilFormulario) event.getObject());
		avancaPagina();
	}

	public void avancaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/RelacionamentoPerfilFormulario.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/RelacionamentoPerfilFormulario.nicbrain?faces-redirect=true");
	}
}
