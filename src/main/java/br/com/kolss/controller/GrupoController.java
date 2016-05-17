package br.com.kolss.controller;

import java.io.IOException;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import org.apache.log4j.Logger;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.datamodel.EntityDataModel;
import br.com.kolss.model.entities.AbstractEntity;
import br.com.kolss.model.entities.Grupo;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.GrupoService;
import br.com.kolss.service.UsuarioService;


@Controller(value = "grupoBean")
@Scope("session")
public class GrupoController {

	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	protected UsuarioService usuarioService;

	@Autowired
	private GrupoService grupoService;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	private Grupo model = new Grupo();
	private Long idUsuarioResponsavel = null;

	// Lista que irá armazenar os usuariosResponsaveis vinculados aos grupos.
	@SuppressWarnings("rawtypes")
	private List<? extends AbstractEntity> usuariosResponsaveis;

	@SuppressWarnings("rawtypes")
	private EntityDataModel<? extends AbstractEntity> dataModel;

	/** Metodo construtor padrao. */
	public GrupoController() {
	}

	public String novo() {
		logger.info("Criando novo Grupo");
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		logger.info("Limpar dados do Grupo");
		model = new Grupo();
		return null;
	}

	private void insert() {
		logger.info("Salvar Grupo: " + this.model);
		
		this.associarUsuario();
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		grupoService.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		logger.info("Atualizar Grupo: " + this.model);
		
		this.associarUsuario();
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		grupoService.atualizar(model);
		
		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}
	
	/** Caso exista, associa o Usuário Responsável ao Grupo. */
	private void associarUsuario() {
		Usuario usuarioResponsavel = null;
		if (this.idUsuarioResponsavel != null) {
			usuarioResponsavel = usuarioService.obter(idUsuarioResponsavel);
		}
		model.setUsuarioResponsavel(usuarioResponsavel);
	}

	public String cancel() {
		logger.info("Cancela a operacao de adicao/edicao");
		model = new Grupo();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("ListaGrupo.nicbrain");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public void delete() {
		logger.info("Excluir Grupo: " + this.model);
		try {
			model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
			grupoService.remover(model);

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

	public String add(ActionEvent evento) {
		logger.info("Salvar/Atualizar Grupo[ActionEvent]: " + evento);
		return add();
	}

	public String add() {
		logger.info("Salvar/Atualizar Grupo: " + this.model);

		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}
		limpar();
		return "/restrict/ListaGrupo.nicbrain";
	}

	public Grupo getModel() {
		logger.info("Obter: " + this.model);
		
		if (this.model != null && this.model.getUsuarioResponsavel() != null) {
			idUsuarioResponsavel = this.model.getUsuarioResponsavel().getId(); 
		}
		
		return model;
	}

	public void setModel(Grupo grupo) {
		logger.info("Selecionar: " + grupo);
		this.model = grupo;
	}
	
	public Long getIdUsuarioResponsavel() {
		return idUsuarioResponsavel;
	}
	
	public void setIdUsuarioResponsavel(Long idUsuarioResponsavel) {
		this.idUsuarioResponsavel = idUsuarioResponsavel;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel getDataModel() {
		return this.dataModel;
	}

	// Popula a lista de Grupos via service
	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> getListaGrupos() {
		dataModel = new EntityDataModel<>(grupoService.obterTodos(usuarioLogado.obterContratanteUsuarioLogado()));
		return dataModel;
	}

	// Popula a combobox de usuariosResponsaveis via service
	@SuppressWarnings("rawtypes")
	public List<? extends AbstractEntity> getUsuariosResponsaveis() {
		
		if(usuariosResponsaveis == null || usuariosResponsaveis.isEmpty()){
			 usuariosResponsaveis = usuarioService.getUsuariosAtivos();
		}
		return usuariosResponsaveis;
	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/Grupo.nicbrain?faces-redirect=true");
	}

	public void voltaPagina() {
		logger.info("Volta para a lista de Grupo ");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaGrupo.nicbrain?faces-redirect=true");
	}

	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Grupo) event.getObject());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setModel((Grupo) event.getObject());
		avancaPagina();
	}
}