package br.com.kolss.controller;

import java.io.ByteArrayInputStream;
import java.security.SecureRandom;
import java.util.HashSet;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

import org.apache.log4j.Logger;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.event.FlowEvent;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.DualListModel;
import org.primefaces.model.StreamedContent;
import org.primefaces.model.UploadedFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.datamodel.EntityDataModel;
import br.com.kolss.model.entities.AbstractEntity;
import br.com.kolss.model.entities.ConfiguracaoEmail;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Endereco;
import br.com.kolss.model.entities.Estado;
import br.com.kolss.model.entities.Menu;
import br.com.kolss.model.entities.Municipio;
import br.com.kolss.service.ConfiguracaoEmailService;
import br.com.kolss.service.ContratanteService;
import br.com.kolss.service.EnderecoService;
import br.com.kolss.service.EstadoService;
import br.com.kolss.service.MenuService;
import br.com.kolss.service.MunicipioService;
import br.com.kolss.service.UsuarioService;

@Controller(value = "contratanteBean")
@Scope("session")
public class ContratanteController {
	private Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	private ContratanteService contratanteService;
	@Autowired
	private EnderecoService enderecoService;
	@Autowired
	private ConfiguracaoEmailService configEmailService;
	@Autowired
	private MunicipioService municipioService;
	@Autowired
	private EstadoService estadoService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private UsuarioService usuarioService;
	@Autowired
	private BbUsuarioLogado bbUsuarioLogado;
	@SuppressWarnings("rawtypes")
	private EntityDataModel<? extends AbstractEntity> dataModel;
	@SuppressWarnings("rawtypes")
	private EntityDataModel<? extends AbstractEntity> enderecoDataModel;
	private Contratante model;
	private Endereco endereco;
	private boolean gridHabilitada;
	private Long idMunicipio;
	private Long idEstado;
	private Long idPais;
	private List<Estado> estados;
	private List<Municipio> municipios;
	private SecureRandom secureRandom;
	private DualListModel<Menu> menus = new DualListModel<>();

;	@PostConstruct
	public void init() {
		this.gridHabilitada = true;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> getListaContratantes() {
		dataModel = new EntityDataModel<>(contratanteService.obterTodos());
		return dataModel;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> getListaEnderecos() {
		return enderecoDataModel;
	}

	public String novo() {
		logger.info("Criando novo Estado");
		limpar();
		cancelarEndereco();
		avancaPagina();
		return null;
	}

	public String limpar() {
		logger.info("Limpar dados do Contratante");
		this.model = new Contratante();
		this.endereco = new Endereco();
		return null;
	}

	public void excluirEndereco(Endereco endereco) {
		if (enderecoDataModel != null && enderecoDataModel.getRowCount() > 1) {
			logger.info("Excluindo endereco: " + endereco.getId());
			enderecoService.remover(endereco);
			buscarEnderecoPorContratante();
		} else {
			FacesMessage message = new FacesMessage();
			message.setDetail(BbLocale
					.getI18nMessage("message.required_field.address_size"));
			message.setSummary(BbLocale
					.getI18nMessage("message.required_field.address_size"));
			message.setSeverity(FacesMessage.SEVERITY_ERROR);
			FacesContext.getCurrentInstance().addMessage(null, message);
		}
	}

	public void excluirModulo(Menu menu) {
	}

	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		model = contratanteService.obter(((Contratante) event.getObject()).getId());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		model = contratanteService.obter(((Contratante) event.getObject()).getId());
		avancaPagina();
	}

	public void onRowSelectEndereco(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		this.endereco = ((Endereco) event.getObject());
		idPais = this.endereco.getMunicipio().getEstado().getPais().getId();
		idEstado = this.endereco.getMunicipio().getEstado().getId();
		idMunicipio = this.endereco.getMunicipio().getId();
		carregaEstadosPorPais();
		carregaMunicipiosPorEstado();
	}

	public void onRowUnselectEndereco(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		this.endereco = ((Endereco) event.getObject());
	}

	public void salvarEndereco() {
		if (endereco != null) {
			if (endereco.isNew()) {
				if (model.isNew()) {
					this.model.setConfiguracaoEmail(null);
					this.contratanteService.salvar(model);
				}
				this.endereco.setContratante(model);
				Municipio municipio = this.municipioService.obter(idMunicipio);
				this.endereco.setMunicipio(municipio);
				this.enderecoService.salvar(this.endereco);
			} else {
				enderecoService.atualizar(getEndereco());
			}
			cancelarEndereco();
		} else {
			this.endereco = new Endereco();
		}
                buscarEnderecoPorContratante();
	}

	public void salvarModulo() {
		model.setMenus(new HashSet<>(menus.getTarget()));
		contratanteService.atualizar(model);
		salvar();
	}

	public void salvar() {
		cancelarEndereco();
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaContratante.nicbrain?faces-redirect=true");
	}

	public void carregaEstadosPorPais() {
		if (idPais != null) {
			estados = estadoService.obterPorPais(idPais);
		}
	}
	
	public void carregaMunicipiosPorEstado() {
		if (idEstado != null) {
			municipios = municipioService.obterPorEstado(new Estado(idEstado));
		}
	}

	public void cancelarEndereco() {
		this.endereco = new Endereco();
		this.estados = null;
		this.municipios = null;
		this.idEstado = null;
		this.idMunicipio = null;
		this.idPais = null;
	}

	public void atualizarContratante() {
		if (!model.isNew()) {
			this.contratanteService.atualizar(model);
		}
		if (endereco == null) {
			endereco = new Endereco();
		}
		habilitaGrid();
	}

	public void fileUpload(FileUploadEvent event) {
		FacesMessage message = new FacesMessage();
		
		message.setDetail(BbLocale.getI18nMessage("message.info.file.upload"));
		message.setSummary(BbLocale.getI18nMessage("message.info.file.upload"));
		message.setSeverity(FacesMessage.SEVERITY_INFO);

		FacesContext.getCurrentInstance().addMessage(null, message);

		UploadedFile logo = event.getFile();
		model.setLogo(logo.getContents());
		if (!model.isNew()) {
			this.contratanteService.atualizar(model);
		}
	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		if (model != null && !model.isNew()) {
			buscarEnderecoPorContratante();
		} else {
			enderecoDataModel = new EntityDataModel<>();
		}

		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/Contratante.nicbrain?faces-redirect=true");
	}

	public String mudarTab(FlowEvent event) {
		if (event.getNewStep().equals("tab_config_email")
				& enderecoDataModel != null
				& enderecoDataModel.getRowCount() == -1) {
			habilitaGrid();
			FacesMessage message = new FacesMessage();
			message.setDetail(BbLocale
					.getI18nMessage("message.required_field.address_size"));
			message.setSummary(BbLocale
					.getI18nMessage("message.required_field.address_size"));
			message.setSeverity(FacesMessage.SEVERITY_ERROR);
			FacesContext.getCurrentInstance().addMessage(null, message);
			return event.getOldStep();
		} else if (event.getNewStep().equals("tab_modulos")) {
			if (model != null) {
				if (model.getConfiguracaoEmail().isNew()) {
					configEmailService.salvar(model.getConfiguracaoEmail());
				} else {
					configEmailService.atualizar(model.getConfiguracaoEmail());
				}
				contratanteService.atualizar(model);
			}
			menus.setSource(menuService.getMenuSuperioresNaoAssociadosAoContratante(model.getId()));
			menus.setTarget(menuService.getMenuSuperioresAssociadosAoContratante(model.getId()));
		}
		return event.getNewStep();
	}

	private void buscarEnderecoPorContratante() {
		this.enderecoDataModel = new EntityDataModel<>(
				enderecoService.listarPorContratante(model));
	}

	public void habilitaGrid() {
		this.gridHabilitada = true;
	}

	public void desabilitaGrid() {
		this.gridHabilitada = false;
		if (model != null && model.getConfiguracaoEmail() == null) {
			model.setConfiguracaoEmail(new ConfiguracaoEmail());
		}
	}

	public StreamedContent getCarregarImagem() {
		if (model != null && model.getLogo() != null) {
			return new DefaultStreamedContent(new ByteArrayInputStream(
					model.getLogo()));
		}
		return null;
	}

	public long getId() {
		if (secureRandom == null) {
			secureRandom = new SecureRandom();
		}
		return secureRandom.nextLong();
	}

	public Contratante getModel() {
		return model;
	}

	public void setModel(Contratante model) {
		this.model = model;
	}

	public Endereco getEndereco() {
		return this.endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public boolean isGridHabilitada() {
		return this.gridHabilitada;
	}

	public Long getIdMunicipio() {
		return idMunicipio;
	}

	public void setIdMunicipio(Long idMunicipio) {
		this.idMunicipio = idMunicipio;
	}

	public Long getIdEstado() {
		return idEstado;
	}

	public void setIdEstado(Long idEstado) {
		this.idEstado = idEstado;
	}

	public Long getIdPais() {
		return idPais;
	}

	public void setIdPais(Long idPais) {
		this.idPais = idPais;
	}

	public List<Estado> getEstados() {
		return estados;
	}

	public void setEstados(List<Estado> estados) {
		this.estados = estados;
	}

	public List<Municipio> getMunicipios() {
		return municipios;
	}

	public void setMunicipios(List<Municipio> municipios) {
		this.municipios = municipios;
	}

	public DualListModel<Menu> getMenus() {
		return menus;
	}

	public void setMenus(DualListModel<Menu> menus) {
		this.menus = menus;
	}

}
