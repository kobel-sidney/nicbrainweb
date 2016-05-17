package br.com.kolss.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import org.jboss.logging.Logger;
import org.primefaces.event.ToggleEvent;
import org.primefaces.event.map.OverlaySelectEvent;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;
import org.primefaces.model.map.DefaultMapModel;
import org.primefaces.model.map.LatLng;
import org.primefaces.model.map.MapModel;
import org.primefaces.model.map.Marker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.datamodel.AtividadeOcorrenciaDataModel;
import br.com.kolss.datamodel.OcorrenciaDataModel;
import br.com.kolss.model.dao.HibernateDAO;
import br.com.kolss.model.dao.InterfaceDAO;
import br.com.kolss.model.entities.AtividadeOcorrencia;
import br.com.kolss.model.entities.Ocorrencia;
import br.com.kolss.service.OcorrenciaService;
import br.com.kolss.service.regras.PermissaoPerfilService;
import br.com.kolss.util.FacesContextUtil;

@Controller(value = "ListaOcorrenciaBean")
@Scope("session")
public class ListaOcorrenciaController {

	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	protected OcorrenciaService ocorrenciaService;

	@Autowired
	protected BbUsuarioLogado bbUsuarioLogado;

	@Autowired
	protected PermissaoPerfilService permissaoPerfilService;

	private Ocorrencia model = new Ocorrencia();
	private List<Ocorrencia> ocorrencias;

	private OcorrenciaDataModel dataModel;
	private String paginaLista = "ListaOcorrencia.nicbrain";

	private AtividadeOcorrenciaDataModel atividadeOcorrenciaDataModel;
	private AtividadeOcorrencia atividadeOcorrenciaModel;

	private static StreamedContent image;

	// Filtros:
	private Long filtroIdLocal = null;
	private Long filtroIdClassificacao = null;
	private Long filtroIdTipoClassificacao = null;
	private Long filtroIdResponsavel = null;
	private Long filtroIdStatus = null;
	private Long filtroIdSuperior = null;
	private Date dataInicio;
	
	@PostConstruct
	public void init() {
		atividadeOcorrenciaDataModel = new AtividadeOcorrenciaDataModel();
		atividadeOcorrenciaModel = new AtividadeOcorrencia();
	}

	private InterfaceDAO<Ocorrencia> getDAO() {
		logger.info("Obter DAO");
		InterfaceDAO<Ocorrencia> dao = new HibernateDAO<Ocorrencia>(Ocorrencia.class,
				FacesContextUtil.getRequestSession());
		return dao;
	}

	public String novo() {
		logger.info("Criando novo model");
		limpar();
		avancaPagina();
		return null;
	}

	public String limpar() {
		logger.info("Limpar dados");
		model = new Ocorrencia();
		return null;
	}

	public String cancel() {
		logger.info("Cancela a operacao de adicao/edicao");
		this.limpar();
		try {
			FacesContext.getCurrentInstance().getExternalContext().redirect(paginaLista);
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

	public String add(ActionEvent evento) {
		logger.info("Salvar/Atualizar [ActionEvent]: " + evento);
		return add();
	}

	public String add() {
		logger.info("Salvar/Atualizar: " + this.model);
		if (model.getId() == null || model.getId() == 0) {
			insert();
		} else {
			update();
		}

		limpar();
		return "/restrict/" + this.paginaLista;
	}

	private void insert() {
		logger.info("Salvar: " + this.model);
		getDAO().save(model);

		FacesContext.getCurrentInstance().addMessage(null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
	}

	private void update() {
		logger.info("Atualizar: " + this.model);
		getDAO().update(model);

		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
				BbLocale.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
	}

	public void delete() {
		logger.info("Excluir: " + this.model);
		getDAO().remove(model);

		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
				BbLocale.getI18nMessage(BbLocale.DELETE_SUCCESSFULLY), ""));
	}

	public String search() {
		logger.info("Pesquisar");

		this.getDataModel();
		return null;
	}

	public Ocorrencia getModel() {
		logger.info("Obter model: " + this.model);
		return model;
	}

	public void setModel(Ocorrencia ocorrencia) {
		logger.info("Selecionar model: ");
		this.model = ocorrencia;
	}

	public List<Ocorrencia> getOcorrencias() {
		logger.info("Obter as Ocorrencias");
		ocorrencias = getDAO().getEntities();
		return ocorrencias;
	}

	public void setOcorrencias(List<Ocorrencia> ocorrencias) {
		logger.info("Selecionar Ocorrencias: " + ocorrencias);
		this.ocorrencias = ocorrencias;
	}

	public OcorrenciaDataModel getDataModel() {
		logger.info("OcorrenciaController.getDataModel");

		List<Ocorrencia> lst = ocorrenciaService.getOcorrenciasEmAndamento(null, filtroIdLocal, filtroIdClassificacao,
				filtroIdTipoClassificacao, filtroIdStatus, filtroIdResponsavel, filtroIdSuperior, dataInicio,
				bbUsuarioLogado.getUserSession().getId());
		dataModel = new OcorrenciaDataModel(lst);
		return dataModel;
	}

	public AtividadeOcorrenciaDataModel getAtividadeOcorrenciaDataModel() {
		return atividadeOcorrenciaDataModel;
	}

	public void setAtividadeOcorrenciaDataModel(AtividadeOcorrenciaDataModel atividadeOcorrenciaDataModel) {
		this.atividadeOcorrenciaDataModel = atividadeOcorrenciaDataModel;
	}

	public AtividadeOcorrencia getAtividadeOcorrenciaModel() {
		return atividadeOcorrenciaModel;
	}

	public void setAtividadeOcorrenciaModel(AtividadeOcorrencia atividadeOcorrenciaModel) {
		this.atividadeOcorrenciaModel = atividadeOcorrenciaModel;
	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/Ocorrencia.nicbrain");

	}

	public void onRowToggle(ToggleEvent event) {
		logger.info("Exibe as Atividades Ocorrencia");

		List<AtividadeOcorrencia> lst = null;

		// FIXME: Deve lançar exceção se event.getData() != Ocorrencia
		if (event.getData() != null && event.getData() instanceof Ocorrencia) {
			Ocorrencia ocorrencia = (Ocorrencia) event.getData();
			lst = ocorrenciaService.getAtividadesOcorrencias(ocorrencia.getId());
		} else {
			lst = Collections.<AtividadeOcorrencia> emptyList();
		}

		this.setAtividadeOcorrenciaDataModel(new AtividadeOcorrenciaDataModel(lst));
	}

	public MapModel getOcorrenciaMap() {

		MapModel map = new DefaultMapModel();
		Double lat;
		Double lon;
		if (this.getModel() != null && this.getModel().getLatitude() != null
				&& this.getModel().getLongitude() != null) {

			try {

				lat = Double.parseDouble(this.getModel().getLatitude());
				lon = Double.parseDouble(this.getModel().getLongitude());
			} catch (Exception e) {

				lat = -23.555;
				lon = -46.155;
			}

			/*
			 * TODO: Incluir abaixo a chamada de negócio para exibir a media
			 * (video/imagens/audio/etc) dos pontos de ocorrencia. Também
			 * padronizar o uso de cores dos 'pins' para melhorar a comunicação
			 * no mapa.
			 */
			/* EndereçoIP da camera! */
			String ipCamera = "http://www.youtube.com/v/nEFg4HnNnbw?autoplay=1";

			/* A cor pode ser utilizado para passar mais informações! */
			String colorPinContext = "http://maps.google.com/mapfiles/ms/micons/red-dot.png";

			String label = this.getModel().getClassificacaoOcorrencia().getNome() + " - "
					+ this.getModel().getGravidadeOcorrencia().getNome();
			LatLng coordenada = new LatLng(lat, lon);
			Marker marcador = new Marker(coordenada, label, ipCamera, colorPinContext);
			map.addOverlay(marcador);
		}

		return map;
	}

	public void onMarkerSelect(OverlaySelectEvent event) {
		// marker = (Marker) event.getOverlay();
	}

	public Marker getMarker() {
		return this.getOcorrenciaMap().getMarkers().get(0);
	}

	/**
	 * Realiza o fechamento com sucesso de uma Atividade Ocorrência.
	 * 
	 * FIXME: Posteriormente, mover esta regra de negócio para o componente de
	 * monitoramento de status.
	 * 
	 * @param event
	 */
	public void concluirAtividadeOcorrencia() {

		String message = "";
		try {

			AtividadeOcorrencia _atvOco = this.atividadeOcorrenciaModel;

			Ocorrencia ocorrencia = ocorrenciaService.getOcorrencia(_atvOco.getOcorrencia().getId());

			permissaoPerfilService.validarPermissaoOperacaoPorPerfil(bbUsuarioLogado.getUserSession().getId(),
					ocorrencia);

			ocorrenciaService.concluirAtividadeOcorrencia(_atvOco.getId(), null, null, null,
					bbUsuarioLogado.getUserSession().getId());

			message = BbLocale.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY);

			if (this.model != null && this.model.getId() != null) {
				this.setModel(ocorrenciaService.getOcorrencia(this.model.getId()));
			}

		} catch (Exception e) {

			message = BbLocale.getI18nMessage(BbLocale.OPERATION_NOT_ALLOWED);
		} finally {

			FacesContext.getCurrentInstance().addMessage(null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, message, ""));
		}
	}

	/**
	 * Realiza o fechamento com falha de uma Atividade Ocorrência.
	 * 
	 * FIXME: Posteriormente, mover esta regra de negócio para o componente de
	 * monitoramento de status.
	 * 
	 */
	public void confirmarFalhaAtividadeOcorrencia() {
		logger.info("Confirmar Falha na AtividadeOcorrencia");

		String message = "";
		try {

			AtividadeOcorrencia atvOco = ocorrenciaService
					.getAtividadeOcorrencia(this.getAtividadeOcorrenciaModel().getId());

			Ocorrencia ocorrencia = ocorrenciaService.getOcorrencia(atvOco.getOcorrencia().getId());

			permissaoPerfilService.validarPermissaoOperacaoPorPerfil(bbUsuarioLogado.getUserSession().getId(),
					ocorrencia);

			ocorrenciaService.cancelarAtividadeOcorrencia(atvOco.getId(), null, null,
					atividadeOcorrenciaModel.getObservacao(), bbUsuarioLogado.getUserSession().getId());

			message = BbLocale.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY);

			if (this.model != null && this.model.getId() != null) {
				this.setModel(ocorrenciaService.getOcorrencia(this.model.getId()));
			}
		} catch (Exception e) {

			message = BbLocale.getI18nMessage(BbLocale.OPERATION_NOT_ALLOWED);
		} finally {

			FacesContext.getCurrentInstance().addMessage(null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, message, ""));
		}
	}

	public Long getFiltroIdLocal() {
		return filtroIdLocal;
	}

	public void setFiltroIdLocal(Long filtroIdLocal) {
		this.filtroIdLocal = filtroIdLocal;
	}

	public Long getFiltroIdClassificacao() {
		return filtroIdClassificacao;
	}

	public void setFiltroIdClassificacao(Long filtroIdClassificacao) {
		this.filtroIdClassificacao = filtroIdClassificacao;
	}

	public Long getFiltroIdTipoClassificacao() {
		return filtroIdTipoClassificacao;
	}

	public void setFiltroIdTipoClassificacao(Long filtroIdTipoOcorrencia) {
		this.filtroIdTipoClassificacao = filtroIdTipoOcorrencia;
	}

	public Long getFiltroIdResponsavel() {
		return filtroIdResponsavel;
	}

	public void setFiltroIdResponsavel(Long filtroIdResponsavel) {
		this.filtroIdResponsavel = filtroIdResponsavel;
	}

	public Long getFiltroIdStatus() {
		return filtroIdStatus;
	}

	public void setFiltroIdStatus(Long filtroIdStatus) {
		this.filtroIdStatus = filtroIdStatus;
	}

	public Long getFiltroIdSuperior() {
		return filtroIdSuperior;
	}

	public void setFiltroIdSuperior(Long filtroIdSuperior) {
		this.filtroIdSuperior = filtroIdSuperior;
	}

	public Date getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	/**
	 * Retorna a foto, caso exista, da ocorrência.
	 * 
	 * @return
	 */
	public StreamedContent getImage() {
		image = null;
		if (model.getFoto() != null) {
			image = new DefaultStreamedContent(new ByteArrayInputStream(model.getFoto()),
					model.getDescricaoOcorrencia());
		}
		return image;
	}

	/**
	 * Retorna o texto do cabeçalho da página.
	 * 
	 * @return
	 */
	public String getCabecalho() {

		return BbLocale.getI18nMessage("label.ocurrences");
	}

}
