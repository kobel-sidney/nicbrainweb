package br.com.kolss.controller;

import java.io.ByteArrayInputStream;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.datamodel.EntityDataModel;
import br.com.kolss.model.entities.AbstractEntity;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.ClienteMensagem;
import br.com.kolss.model.entities.Endereco;
import br.com.kolss.model.entities.Estado;
import br.com.kolss.model.entities.Mensagem;
import br.com.kolss.model.entities.Municipio;
import br.com.kolss.model.entities.Pais;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.ClienteMensagemService;
import br.com.kolss.service.ClienteService;
import br.com.kolss.service.ContratanteService;
import br.com.kolss.service.EnderecoService;
import br.com.kolss.service.EstadoService;
import br.com.kolss.service.MensagemService;
import br.com.kolss.service.MunicipioService;
import br.com.kolss.service.PaisService;
import br.com.kolss.service.UsuarioService;
import org.primefaces.event.TransferEvent;

@Controller(value = "clienteBean")
@Scope("session")
public class ClienteController {

	protected Logger logger = Logger.getLogger(getClass());
	@Autowired
	private ClienteService clienteService;
	@Autowired
	private EnderecoService enderecoService;
	@Autowired
	private ContratanteService contratanteService;
	@Autowired
	private MunicipioService municipioService;
	@Autowired
	private EstadoService estadoService;
	@Autowired
	private PaisService paisService;
	@Autowired
	private UsuarioService usuarioService;
	@Autowired
	private BbUsuarioLogado usuarioLogado;
	@Autowired
	private MensagemService mensagemService;

	@Autowired
	private ClienteMensagemService clienteMensagemService;

	@SuppressWarnings("rawtypes")
	private EntityDataModel<? extends AbstractEntity> clienteDataModel;
	@SuppressWarnings("rawtypes")
	private EntityDataModel<? extends AbstractEntity> enderecoDataModel;
	private Endereco endereco = new Endereco();
	private List<Pais> paises;
	private List<Estado> estados;
	private List<Municipio> municipios;
	private Cliente cliente;
	private DualListModel<Mensagem> mensagens = new DualListModel<>();
	private Long idMunicipio;
	private Long idEstado;
	private Long idPais;
	private boolean gridHabilitada = true;
	private SecureRandom secureRandom;

	public void novo() {
		logger.info("Criando novo Estado");
		limpar();
		limparEndereco();
		avancaPagina();
	}

	public void delete() {
		logger.info("Excluir Cliente: " + this.cliente);
		try {
			clienteService.remover(cliente);

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
      
	public void limpar() {
		logger.info("Limpar dados do Cliente");
		this.cliente = new Cliente();
		Usuario usuario = usuarioService.obter(usuarioLogado.getUserSession()
				.getId());
		if (usuario != null && usuario.getCliente() != null) {
			Cliente cliente = clienteService.find(usuario.getCliente().getId());
			if (cliente != null) {
				this.cliente.setContratante(cliente.getContratante());
			}
		}
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> listarClientes() {
		// TODO: Solução provisório. Aguardando definição da área de negócios
		// referente ao cliente estar ou não inserido no contexto.
		logger.debug("ClienteController.listaClientes");
		Usuario usuario = usuarioService.obter(usuarioLogado.getUserSession()
				.getId());
		if (usuario != null && usuario.getCliente() != null) {
			Cliente cliente = clienteService.find(usuario.getCliente().getId());
			if (cliente != null && cliente.getContratante() != null) {
				clienteDataModel = new EntityDataModel<>(
						clienteService.getClientesPorContratante(cliente
								.getContratante()));
			}
		}
		return clienteDataModel;
	}

	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		cliente = clienteService.find(((Cliente) event.getObject()).getId());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		cliente = clienteService.find(((Cliente) event.getObject()).getId());
		avancaPagina();
	}

	public void onRowSelectEndereco(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		this.endereco = ((Endereco) event.getObject());
		idPais = this.endereco.getMunicipio().getEstado().getPais().getId();
		idEstado = this.endereco.getMunicipio().getEstado().getId();
		idMunicipio = this.endereco.getMunicipio().getId();
		carregarEstadosPorPais();
		carregarMunicipiosPorEstado();
	}

	public void onRowUnselectEndereco(UnselectEvent event) {
		logger.debug("ClienteController.onRowUnselectEndereco");
		limparEndereco();
	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");

		this.paises = paisService.obterTodos();

		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/Cliente.nicbrain?faces-redirect=true");
	}

	public String mudarTab(FlowEvent event) {
		if (event.getNewStep().equals("tab_endereco")) {
			if (cliente != null && !cliente.isNew()) {
				this.clienteService.atualizar(cliente);
				buscarEnderecoPorCliente();
				limparEndereco();
			}
		} else if ("tab_mensagens".equals(event.getNewStep())) {
			if (cliente != null) {
				mensagens.setSource(clienteMensagemService
						.obterNaoAssociadasAoCliente(this.cliente.getId()));
				mensagens.setTarget(clienteMensagemService
						.obterAssociadasAoCliente(this.cliente.getId()));
			}
		}

		return event.getNewStep();
	}

	public void salvarEndereco() {
		if (endereco != null) {
			if (endereco.isNew()) {
				if (cliente.isNew()) {
					clienteService.salvar(cliente);
				}
				this.endereco.setCliente(cliente);
				Municipio municipio = this.municipioService.obter(idMunicipio);
				this.endereco.setMunicipio(municipio);
				this.enderecoService.salvarEnderecoCliente(this.endereco);
			} else {
				enderecoService.atualizar(getEndereco());
			}
			limparEndereco();
			buscarEnderecoPorCliente();
		}
	}

	public void excluirEndereco(Endereco endereco) {
		if (enderecoDataModel != null && enderecoDataModel.getRowCount() > 1) {
			logger.info("Excluindo endereco: " + endereco.getId());
			enderecoService.remover(endereco);
			buscarEnderecoPorCliente();
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

	public void limparEndereco() {
		this.endereco = new Endereco();
		this.estados = null;
		this.municipios = null;
		this.idEstado = null;
		this.idMunicipio = null;
		this.idPais = null;
	}

	public void salvar() {
		logger.debug("ClienteController.salvar");
		List<Mensagem> mensagenstarget = mensagens.getTarget();
		
		List<ClienteMensagem> clienteMensagems = new ArrayList<>();
		cliente = clienteService.find(cliente.getId());
		for (Mensagem mensagem : mensagenstarget) {
			Mensagem msg = mensagemService.obter(mensagem.getId());
			ClienteMensagem cMensagem = new ClienteMensagem(cliente, msg);
			clienteMensagems.add(cMensagem);
		}
		cliente.setClientesMensagens(clienteMensagems);
		clienteService.atualizar(cliente);

		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/ListaCliente.nicbrain?faces-redirect=true");
	}

	private void buscarEnderecoPorCliente() {
		this.enderecoDataModel = new EntityDataModel<>(
				enderecoService.listarPorCliente(cliente));
	}

	public void carregarEstadosPorPais() {
		if (idPais != null) {
			estados = estadoService.obterPorPais(idPais);
		}
	}

	public void carregarMunicipiosPorEstado() {
		if (idEstado != null) {
			Estado estado = new Estado(idEstado);
			municipios = municipioService.obterPorEstado(estado);
		}
	}
	
	public void fileUpload(FileUploadEvent event) {
		FacesMessage message = new FacesMessage();
		message.setDetail(BbLocale.getI18nMessage("message.info.file.upload"));
		message.setSummary(BbLocale.getI18nMessage("message.info.file.upload"));
		message.setSeverity(FacesMessage.SEVERITY_INFO);

		FacesContext.getCurrentInstance().addMessage(null, message);

		UploadedFile logo = event.getFile();
		if (cliente != null) {
			cliente.setLogo(logo.getContents());
			if (!cliente.isNew()) {
				clienteService.atualizar(cliente);
			}
		}
	}

	public StreamedContent getCarregarImagem() {
		if (cliente != null && cliente.getLogo() != null) {
			return new DefaultStreamedContent(new ByteArrayInputStream(
					cliente.getLogo()));
		}
		return null;
	}

	public long getId() {
		if (secureRandom == null) {
			secureRandom = new SecureRandom();
		}
		return secureRandom.nextLong();
	}

	public void habilitaGrid() {
		this.gridHabilitada = true;
	}

	public void desabilitaGrid() {
		this.gridHabilitada = false;
	}

	@SuppressWarnings("rawtypes")
	public EntityDataModel<? extends AbstractEntity> getEnderecoDataModel() {
		return enderecoDataModel;
	}

	@SuppressWarnings("rawtypes")
	public void setEnderecoDataModel(
			EntityDataModel<? extends AbstractEntity> enderecoDataModel) {
		this.enderecoDataModel = enderecoDataModel;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public List<Pais> getPaises() {
		return paises;
	}

	public void setPaises(List<Pais> paises) {
		this.paises = paises;
	}

	public List<Municipio> getMunicipios() {
		return municipios;
	}

	public void setMunicipios(List<Municipio> municipios) {
		this.municipios = municipios;
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

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public boolean isGridHabilitada() {
		return gridHabilitada;
	}

	public void setGridHabilitada(boolean gridHabilitada) {
		this.gridHabilitada = gridHabilitada;
	}

	public DualListModel<Mensagem> getMensagens() {
		return mensagens;
	}

	public void setMensagens(DualListModel<Mensagem> mensagens) {
		this.mensagens = mensagens;
	}

}
