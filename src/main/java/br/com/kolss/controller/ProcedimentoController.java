package br.com.kolss.controller;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

import org.apache.log4j.Logger;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;
import org.primefaces.model.DualListModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.datamodel.ProcedimentoDataModel;
import br.com.kolss.datamodel.ProcedimentoMensagemDataModel;
import br.com.kolss.dto.SimplePickListDTO;
import br.com.kolss.model.entities.Mensagem;
import br.com.kolss.model.entities.PerfilFormulario;
import br.com.kolss.model.entities.Procedimento;
import br.com.kolss.model.entities.ProcedimentoMensagem;
import br.com.kolss.service.MensagemService;
import br.com.kolss.service.PerfilFormularioService;
import br.com.kolss.service.ProcedimentoService;


@Controller(value = "procedimentoBean")
@Scope("session")
public class ProcedimentoController {

	private Logger logger = Logger.getLogger(getClass());

	private final String paginaLista = "ListaProcedimento.nicbrain?faces-redirect=true";
	
	@Autowired
	protected ProcedimentoService procedimentoService;
	
	@Autowired
	protected PerfilFormularioService perfilFormularioService;
	
	@Autowired
	protected MensagemService mensagemService;
	
	@Autowired
	protected BbUsuarioLogado usuarioLogado;
	
	private DualListModel<SimplePickListDTO> dualListModel = new DualListModel<SimplePickListDTO>();
	private Procedimento model = new Procedimento();
	private ProcedimentoDataModel dataModel;
	private ProcedimentoMensagem modelSelecionada;
	private ProcedimentoMensagemDataModel dataModelSelecionadas;
	
	private Long idFormulario;
	
	public String novo() {
		logger.debug("ProcedimentoController.novo");
		limpar();
		avancaPagina();
		return null;
	}
	
	public String limpar() {
		logger.debug("ProcedimentoController.limpar");
		model = new Procedimento();
		return null;
	}
	
	public String add() {
		logger.debug("ProcedimentoController.add");
		
		PerfilFormulario perfilFormulario = null;
		Long _idFormulario = getIdFormulario();
		if (_idFormulario != null && _idFormulario.longValue() > 0) {
			perfilFormulario = perfilFormularioService.find(_idFormulario);
		}
		if (this.model != null) {
			this.model.setPerfilFormulario(perfilFormulario);
		}
		
		// FIXME
		@SuppressWarnings("unchecked")
		List<ProcedimentoMensagem> lst =
				(List<ProcedimentoMensagem>) dataModelSelecionadas.getWrappedData();
		if (model.getId() == null || model.getId() == 0) {
			this.model.getProcedimentosMensagens().addAll(lst);
			insert();
		} else {
			update(lst);
		}

		limpar();
		return "/restrict/" + this.paginaLista;
	}
	
	private void insert() {
		logger.debug("ProcedimentoController.insert");
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		procedimentoService.salvar(model);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO,
						BbLocale.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY),
						""));
	}

	private void update(List<ProcedimentoMensagem> procedimentos) {
		logger.debug("ProcedimentoController.update");
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		procedimentoService.atualizar(model, procedimentos);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO,
						BbLocale.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY),
						""));
	}
	
	public String cancel() {
		logger.debug("ProcedimentoController.cancel");
		this.limpar();
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect(paginaLista);
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}
	
	public void onRowSelect(SelectEvent event) {
		logger.debug("ProcedimentoController.onRowSelect");
		setModel((Procedimento) event.getObject());
		avancaPagina();
	}
	
	public void onRowUnselect(UnselectEvent event) {
		logger.debug("ProcedimentoController.onRowUnselect");
		setModel((Procedimento) event.getObject());
		avancaPagina();
	}
	
	public void avancaPagina() {
		logger.debug("ProcedimentoController.avancaPagina");
		
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/Procedimento.nicbrain?faces-redirect=true");
	}
	
	private void popularMensagens() {
		logger.debug("ProcedimentoController.popularMensagens");
		
		// Define as mensagens disponíveis e selecionadas:
		List<Mensagem> mensagensOrigem = mensagemService.obterPorUsuario(usuarioLogado.getUserSession().getId());
		List<Mensagem> mensagensDestino = new ArrayList<Mensagem>();
		if (this.model != null && this.model.getId() != null
				&& this.model.getId() > 0) {
			Procedimento procedimento = procedimentoService.obter(
					this.model.getId());
			for (ProcedimentoMensagem pMsg : procedimento.getProcedimentosMensagens()) {
				Mensagem msg = pMsg.getMensagem();
				mensagensDestino.add(msg);
				mensagensOrigem.remove(msg);
			}
		}		
		
		// Popula a lista de mensagens:
		List<SimplePickListDTO> dtosOrigem = new ArrayList<SimplePickListDTO>();
		List<SimplePickListDTO> dtosDestino = new ArrayList<SimplePickListDTO>();
		this.popularListaSimplePickListDTO(dtosOrigem, mensagensOrigem);
		this.popularListaSimplePickListDTO(dtosDestino, mensagensDestino);
		
		setDualListModel(new DualListModel<SimplePickListDTO>());
		getDualListModel().setSource(dtosOrigem);
		getDualListModel().setTarget(dtosDestino);
	}
	
	/**
	 * Popular a lista de DTOs.
	 *
	 * @param dtos
	 * @param mensagens
	 */
	private void popularListaSimplePickListDTO(List<SimplePickListDTO> dtos,List<Mensagem> mensagens) {
		logger.debug("ProcedimentoController.popularListaSimplePickListDTO");
		
		for (Mensagem msg : mensagens) {
			SimplePickListDTO dto = new SimplePickListDTO(msg.getId(),
					msg.getDescricao());
			dtos.add(dto);
		}
	}
	
	
	public Procedimento getModel() {
		
		popularMensagens();
		
		return model;
	}
	

	public void setModel(Procedimento model) {
		this.model = model;
	}

	public ProcedimentoDataModel getDataModel() {
		
		List<Procedimento> lst = procedimentoService.obterPorUsuario(
				usuarioLogado.getUserSession().getId());
		dataModel = new ProcedimentoDataModel(lst);
		
		return dataModel;
	}

	public void setDataModel(ProcedimentoDataModel dataModel) {
		this.dataModel = dataModel;
	}
	
	public DualListModel<SimplePickListDTO> getDualListModel() {
		return dualListModel;
	}
	
	public void setDualListModel(DualListModel<SimplePickListDTO> dualListModel) {
		this.dualListModel = dualListModel;
	}
	
	public ProcedimentoMensagem getModelSelecionada() {
		return modelSelecionada;
	}
	
	public void setModelSelecionada(ProcedimentoMensagem modelSelecionada) {
		this.modelSelecionada = modelSelecionada;
	}
	
	public ProcedimentoMensagemDataModel getDataModelSelecionadas() {
		
		// Obtém os procedimentos mensagens já cadastradas anteriormente:
		List<Serializable> idMensagens = new ArrayList<Serializable>();
		for (SimplePickListDTO dto : dualListModel.getTarget()) {
			idMensagens.add(dto.getId());
		}
		List<ProcedimentoMensagem> procedimentoMensagens =
				mensagemService.obterProcedimentosMensagens(idMensagens,
						this.model.getId(),
						usuarioLogado.getUserSession().getId());
		
		// Selecionar só os procedimentos que o usuário escolheu na aba anterior:
		List<ProcedimentoMensagem> lst = new ArrayList<ProcedimentoMensagem>();
		for (SimplePickListDTO dto : dualListModel.getTarget()) {
			
			ProcedimentoMensagem pMensagem = null;
			for (ProcedimentoMensagem procedMsg : procedimentoMensagens) {
				if (dto.getId().equals(procedMsg.getMensagem().getId())) {
					pMensagem = procedMsg;
					break;
				}
			}
			
			if (pMensagem == null) {
				Mensagem msg = mensagemService.obter(dto.getId());
				pMensagem = new ProcedimentoMensagem(null,
						Integer.valueOf(0),
						msg,
						this.model);
			}
			
			lst.add(pMensagem);
		}
		
		this.dataModelSelecionadas = new ProcedimentoMensagemDataModel(lst);
		return dataModelSelecionadas;
	}

	public void setDataModelSelecionadas(
			ProcedimentoMensagemDataModel dataModelSelecionadas) {
		this.dataModelSelecionadas = dataModelSelecionadas;
	}

	public ProcedimentoService getProcedimentoService() {
		return procedimentoService;
	}

	public void setProcedimentoService(ProcedimentoService procedimentoService) {
		this.procedimentoService = procedimentoService;
	}
	
	public Long getIdFormulario() {
		return idFormulario;
	}
	
	public void setIdFormulario(Long idFormulario) {
		this.idFormulario = idFormulario;
	}
	
}
