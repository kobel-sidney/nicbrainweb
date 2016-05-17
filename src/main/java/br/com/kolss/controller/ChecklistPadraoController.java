package br.com.kolss.controller;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

import org.apache.log4j.Logger;
import org.primefaces.event.FlowEvent;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;
import org.primefaces.model.DualListModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.datamodel.ChecklistPadraoDataModel;
import br.com.kolss.datamodel.ChecklistPadraoMensagemDataModel;
import br.com.kolss.dto.SimpleDTO;
import br.com.kolss.dto.SimplePickListDTO;
import br.com.kolss.model.entities.ChecklistPadrao;
import br.com.kolss.model.entities.ChecklistPadraoMensagem;
import br.com.kolss.model.entities.Mensagem;
import br.com.kolss.model.entities.Procedimento;
import br.com.kolss.model.entities.Segmento;
import br.com.kolss.service.ChecklistPadraoService;
import br.com.kolss.service.MensagemService;
import br.com.kolss.service.ProcedimentoService;
import br.com.kolss.service.SegmentoService;


@Controller(value = "checklistPadraoBean")
@Scope("session")
public class ChecklistPadraoController {
	
	private final String paginaLista = "ListaChecklistPadrao.nicbrain?faces-redirect=true";
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private ChecklistPadraoService checklistPadraoService;
	
	@Autowired
	private ProcedimentoService procedimentoService;
	
	@Autowired
	private MensagemService mensagemService;
	
	@Autowired
	private SegmentoService segmentoService;
	
	@Autowired
	protected BbUsuarioLogado usuarioLogado;
	
	
	private ChecklistPadrao model = new ChecklistPadrao();
	private ChecklistPadraoDataModel dataModel = null;
	
	private DualListModel<SimplePickListDTO> procedimentosPickList;
	private DualListModel<SimplePickListDTO> mensagensPickList;
	private List<SimpleDTO> segmentosDisponiveis;
	private List<SimpleDTO> segmentosSelecionados;
	private ChecklistPadraoMensagemDataModel tempoEscalaDataModel = null;
	
	/** Metodo construtor padrao. */
	public ChecklistPadraoController() {
		this.procedimentosPickList = new DualListModel<SimplePickListDTO>();
		this.mensagensPickList = new DualListModel<SimplePickListDTO>();
	}
	
	
	public String novo() {
		logger.debug("Criando novo");
		limpar();
		avancaPagina();
		return null;
	}
	
	public String limpar() {
		logger.debug("Limpar dados");
		model = new ChecklistPadrao();
		return null;
	}
	
	public String add() {
		logger.debug("Add");
		
		String mensagem = null;
		String path = null;
		try {
			
			segmentoService.removerAssociacao(getModel());
			
			List<Serializable> idSegmentos = new ArrayList<Serializable>();
			for (SimpleDTO dto : segmentosSelecionados) {
				idSegmentos.add(dto.getId());
			}
			
			segmentoService.associarSegmentos(getModel(), idSegmentos);
			
			mensagem = BbLocale.SAVE_SUCCESSFULLY;
			path = "/restrict/" + this.paginaLista;
		} catch (Exception e) {
			mensagem = BbLocale.OPERATION_NOT_ALLOWED;
		}
		
		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_INFO,
						BbLocale.getI18nMessage(mensagem), ""));
		return path;
	}
	
	public void delete() {
		logger.debug("Excluir");
	}
	
	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/ChecklistPadrao.nicbrain?faces-redirect=true");
	}
	
	public String cancel() {
		logger.debug("ChecklistPadraoController.cancel");
		this.limpar();
		try {
			FacesContext.getCurrentInstance().getExternalContext().redirect(
					paginaLista);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * Controla a navegacao das abas do wizard da tela de Checklist Padrao.
	 * 
	 * @param event
	 * @return
	 */
	public String onFlowProcess(FlowEvent event) {
		logger.debug("ChecklistPadraoController.onFlowProcess");
		
		// Sempre persiste o estado do model:
		if (getModel() != null) {
			if (getModel().isNew()) {
				checklistPadraoService.salvar(getModel());
			} else {
				
				// Atualiza Descrição:
				if ("tab_descricao".equals(event.getOldStep())
						&& "tab_procedimento".equals(event.getNewStep())) {
					checklistPadraoService.atualizar(getModel());
				}
				
				// Atualiza Procedimentos:
				if ("tab_procedimento".equals(event.getOldStep())
						&& "tab_mensagem".equals(event.getNewStep())) {
					List<Serializable> idProcedimentos = new ArrayList<Serializable>();
					for (SimplePickListDTO dto : procedimentosPickList.getTarget()) {
						idProcedimentos.add(dto.getId());
					}
					
					checklistPadraoService.removerAssociacao(getModel());
					checklistPadraoService.associarProcedimentos(getModel(), idProcedimentos);
				}
				
				// Atualiza Mensagem
				if ("tab_mensagem".equals(event.getOldStep())
						&& "tab_tempo_escala".equals(event.getNewStep())) {
					List<Serializable> idMensagens = new ArrayList<Serializable>();
					for (SimplePickListDTO dto : mensagensPickList.getTarget()) {
						idMensagens.add(dto.getId());
					}
					mensagemService.removerAssociacao(getModel());
					mensagemService.associarMensagens(getModel(), idMensagens);
				}
				
				if ("tab_tempo_escala".equals(event.getOldStep())
						&& "tab_segmento".equals(event.getNewStep())) {
					
					// atualizar a lista de mensagens.
					@SuppressWarnings("unchecked")
					List<ChecklistPadraoMensagem> lst =
							(List<ChecklistPadraoMensagem>)
							tempoEscalaDataModel.getWrappedData();
					mensagemService.atualizar(lst);
				}
				
			}
		}
		
		return event.getNewStep();
    }
	
	public void onRowSelect(SelectEvent event) {
		logger.debug("Seta o objeto selecionado na lista");
		setModel((ChecklistPadrao) event.getObject());
		avancaPagina();
	}
	
	public void onRowUnselect(UnselectEvent event) {
		logger.debug("Seta o objeto selecionado na lista");
		setModel((ChecklistPadrao) event.getObject());
		avancaPagina();
	}
	
	public ChecklistPadrao getModel() {
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		return model;
	}
	
	public void setModel(ChecklistPadrao model) {
		model.setContratante(usuarioLogado.obterContratanteUsuarioLogado());
		this.model = model;
	}
	
	public ChecklistPadraoDataModel getDataModel() {
		logger.debug("getDataModel");
		
		List<ChecklistPadrao> lst = checklistPadraoService.obterPorUsuario(usuarioLogado.getUserSession().getId());
		
		this.dataModel = new ChecklistPadraoDataModel(lst);
		return dataModel;
	}
	
	public void setDataModel(ChecklistPadraoDataModel dataModel) {
		this.dataModel = dataModel;
	}
	
	public DualListModel<SimplePickListDTO> getProcedimentosPickList() {
		logger.debug("ChecklistPadraoController.getProcedimentosPickList");
		
		List<Procedimento> procedimentosDisponiveis =
				procedimentoService.obterDisponiveisPorUsuario(getModel(),
						usuarioLogado.getUserSession().getId());
		List<Procedimento> procedimentosSelecionados =
				(getModel() != null && getModel().getId() != null && getModel().getId().intValue() > 0)
				? procedimentoService.obterAssociadosChecklist(getModel())
				: new ArrayList<Procedimento>();
		
		List<SimplePickListDTO> lstDisponiveis =
				new ArrayList<SimplePickListDTO>();
		for (Procedimento entity : procedimentosDisponiveis) {
			SimplePickListDTO dto = new SimplePickListDTO(entity.getId(),
					entity.getNome());
			lstDisponiveis.add(dto);
		}
		
		List<SimplePickListDTO> lstSelecionados =
				new ArrayList<SimplePickListDTO>();
		for (Procedimento entity : procedimentosSelecionados) {
			SimplePickListDTO dto = new SimplePickListDTO(entity.getId(),
					entity.getNome());
			lstSelecionados.add(dto);
		}
		
		procedimentosPickList.setSource(lstDisponiveis);
		procedimentosPickList.setTarget(lstSelecionados);
		return procedimentosPickList;
	}
	
	public void setProcedimentosPickList(
			DualListModel<SimplePickListDTO> procedimentosPickList) {
		this.procedimentosPickList = procedimentosPickList;
	}
	
	public DualListModel<SimplePickListDTO> getMensagensPickList() {
		logger.debug("ChecklistPadraoController.getMensagensPickList");
		
		List<Mensagem> mensagensDisponiveis =
				mensagemService.obterMensagensNaoSelecionadas(getModel(),
						usuarioLogado.getUserSession().getId());
		List<Mensagem> mensagensSelecionadas =
				mensagemService.obterMensagensSelecionadas(getModel() ,usuarioLogado.obterContratanteUsuarioLogado());
		
		List<SimplePickListDTO> lstDisponiveis =
				new ArrayList<SimplePickListDTO>();
		for (Mensagem entity : mensagensDisponiveis) {
			SimplePickListDTO dto = new SimplePickListDTO(entity.getId(),
					entity.getDescricao());
			lstDisponiveis.add(dto);
		}
		
		List<SimplePickListDTO> lstSelecionados =
				new ArrayList<SimplePickListDTO>();
		for (Mensagem entity : mensagensSelecionadas) {
			SimplePickListDTO dto = new SimplePickListDTO(entity.getId(),
					entity.getDescricao());
			lstSelecionados.add(dto);
		}
		
		mensagensPickList.setSource(lstDisponiveis);
		mensagensPickList.setTarget(lstSelecionados);
		return mensagensPickList;
	}
	
	public void setMensagensPickList(
			DualListModel<SimplePickListDTO> mensagensPickList) {
		this.mensagensPickList = mensagensPickList;
	}
	
	public ChecklistPadraoMensagemDataModel getTempoEscalaDataModel() {
		
		List<ChecklistPadraoMensagem> lst = null;
		if (getModel() != null && !getModel().isNew()) {
			lst = mensagemService.obterChecklistPadraoMensagemSelecionadas(
					getModel(), usuarioLogado.obterContratanteUsuarioLogado());
		} else {
			lst = Collections.<ChecklistPadraoMensagem>emptyList();
		}
		
		tempoEscalaDataModel = new ChecklistPadraoMensagemDataModel(lst);
		return tempoEscalaDataModel;
	}
	
	public void setTempoEscalaDataModel(
			ChecklistPadraoMensagemDataModel tempoEscalaDataModel) {
		this.tempoEscalaDataModel = tempoEscalaDataModel;
	}
	
	public List<SimpleDTO> getSegmentosDisponiveis() {
		
		List<Segmento> lst = segmentoService.buscarTodos();
		
		segmentosDisponiveis = new ArrayList<SimpleDTO>();
		for (Segmento segmento : lst) {
			segmentosDisponiveis.add(new SimpleDTO(
					segmento.getId(), segmento.getNome()));
		}
		
		return segmentosDisponiveis;
	}
	
	public void setSegmentosDisponiveis(List<SimpleDTO> segmentosDisponiveis) {
		this.segmentosDisponiveis = segmentosDisponiveis;
	}
	
	public List<SimpleDTO> getSegmentosSelecionados() {
		
		List<Segmento> lst = segmentoService.getSegmentosAssociados(getModel());
		
		segmentosSelecionados = new ArrayList<SimpleDTO>();
		for (Segmento segmento : lst) {
			segmentosSelecionados.add(new SimpleDTO(
					segmento.getId(), segmento.getNome()));
		}
		
		return segmentosSelecionados;

	}
	
	public void setSegmentosSelecionados(List<SimpleDTO> segmentosSelecionados) {
		this.segmentosSelecionados = segmentosSelecionados;
	}
	
}
