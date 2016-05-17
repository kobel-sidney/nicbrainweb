package br.com.kolss.controller;

import java.io.ByteArrayInputStream;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

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
import org.primefaces.model.StreamedContent;
import org.primefaces.model.UploadedFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.DocumentoAnexo;
import br.com.kolss.model.entities.Endereco;
import br.com.kolss.model.entities.Estado;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Municipio;
import br.com.kolss.model.entities.Pais;
import br.com.kolss.model.entities.TipoLocal;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.ClienteService;
import br.com.kolss.service.DocumentoAnexoService;
import br.com.kolss.service.EnderecoService;
import br.com.kolss.service.EstadoService;
import br.com.kolss.service.LocalService;
import br.com.kolss.service.MunicipioService;
import br.com.kolss.service.PaisService;
import br.com.kolss.service.TipoLocalService;
import br.com.kolss.service.UsuarioService;

@Controller(value = "localBean")
@Scope("session")
public class LocalController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private LocalService localService;
	@Autowired
	private EnderecoService enderecoService;
	@Autowired
	private ClienteService clienteService;
	@Autowired
	private PaisService paisService;
	@Autowired
	private EstadoService estadoService;
	@Autowired
	private MunicipioService municipioService;
	@Autowired
	private TipoLocalService tipoLocalService;
	@Autowired
	private DocumentoAnexoService documentoAnexoService;
	@Autowired
	protected BbUsuarioLogado bbUsuarioLogado;
	
	@Autowired
	private UsuarioService usuarioService;
	
	private List<Local> locais;
	private List<Cliente> clientes;
	private List<Pais> paises;
	private List<Estado> estados;
	private List<Municipio> municipios;
	private List<Endereco> enderecos;
	private List<TipoLocal> tiposLocal;
	private SortedSet<DocumentoAnexo> documentosAnexos;
	private Local local;
	private Endereco endereco;
	private Long idMunicipio;
	private Long idEstado;
	private Long idPais;
	private SecureRandom secureRandom;
	private boolean gridHabilitada = true;
	
	@PostConstruct
	public void init() {
		this.endereco = new Endereco();
		this.local = new Local();
		this.locais = localService.getLocaisPorContratante(bbUsuarioLogado.obterContratanteUsuarioLogado());
		this.clientes = clienteService.getClientes(bbUsuarioLogado.getUserSession().getId());
		this.tiposLocal = tipoLocalService.getTiposLocal();
		this.documentosAnexos = new TreeSet<>();
		this.endereco = new Endereco();
	}
	
	public String novo() {
		logger.info("Criando novo Estado");
		this.local = new Local();
		this.local.setUsuarioResponsavel(null);
		limparEndereco();
		avancaPagina();
		return null;
	}

	public void avancaPagina() {
		logger.info("Avancando para a pagina de edicao/adicao");
		
		this.paises = paisService.obterTodos();

		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/Local.nicbrain?faces-redirect=true");
	}
	
	public void onRowSelect(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setLocal((Local) event.getObject());
		local = localService.getLocal(local.getId());
		avancaPagina();
	}

	public void onRowUnselect(UnselectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		setLocal(null);
	}
	
	public void onRowSelectEndereco(SelectEvent event) {
		logger.info("Seta o objeto selecionado na lista");
		this.endereco = ((Endereco) event.getObject());
		idPais = this.endereco.getMunicipio().getEstado().getPais().getId();
		idEstado = this.endereco.getMunicipio().getEstado().getId();
		idMunicipio = this.endereco.getMunicipio().getId();
		buscarEstadosPorPais();
		buscarMunicipiosPorEstado();
	}

	public void onRowUnselectEndereco(UnselectEvent event) {
		logger.debug("ClienteController.onRowUnselectEndereco");
		limparEndereco();
	}
	
	public void limparEndereco() {
		this.endereco = new Endereco();
		this.estados = null;
		this.municipios = null;
		this.idEstado = null;
		this.idMunicipio = null;
		this.idPais = null;
	}
	
	public void salvarEndereco() {
		if(endereco != null) {
			Set<Endereco> enderecos = new HashSet<Endereco>();
			Municipio municipio = this.municipioService.obter(idMunicipio);
			
			endereco.setLocal(local);
			endereco.setMunicipio(municipio);
			endereco.setDataCadastro(new Date());
			enderecos.add(endereco);
			
			this.local.setEnderecos(enderecos);
			
			localService.salvarOuAtualizar(local);
			
			this.locais = localService.getLocaisPorContratante(bbUsuarioLogado.obterContratanteUsuarioLogado());
			
			limparEndereco();
			buscarEnderecoPorLocal();
		}
	}

	public void excluirEndereco(Endereco endereco) {
		if(enderecos != null && enderecos.size() > 1) {
			logger.info("Excluindo endereco: " + endereco.getId());
			enderecoService.remover(endereco);
			buscarEnderecoPorLocal();		
		} else {
			FacesMessage message = new FacesMessage();
            message.setDetail(BbLocale.getI18nMessage("message.required_field.address_size"));
            message.setSummary(BbLocale.getI18nMessage("message.required_field.address_size"));               
            message.setSeverity(FacesMessage.SEVERITY_ERROR);
            FacesContext.getCurrentInstance().addMessage(null, message);
		}
	}
	
	public void excluirDocumentoAnexo(DocumentoAnexo documentoAnexo) {
		if(documentoAnexo != null) {
			logger.info("Excluindo documento anexo: " + documentoAnexo.getId());
			documentoAnexoService.excluir(documentoAnexo);
			documentosAnexos.remove(documentoAnexo);
		}
	}
	
	public String mudarTab(FlowEvent event) {
		if(event.getNewStep().equals("tab_endereco")) {
			if (local != null && !local.isNew()) {

				Usuario usuario = usuarioService.obter(local.getUsuarioResponsavel().getId());
				local.setUsuarioResponsavel(usuario);
				this.localService.salvarOuAtualizar(local);
				buscarEnderecoPorLocal();
				limparEndereco();
			}
		}else if("tab_documentos".equals(event.getNewStep())) {
			if(local != null && !local.isNew()) {
				documentosAnexos = new TreeSet<>(documentoAnexoService.listarPorLocal(local));				
			}
		}
		return event.getNewStep();
	}

	private void buscarEnderecoPorLocal(){
		enderecos = enderecoService.buscarPorLocal(local);
	}
	
	public void buscarEstadosPorPais(){
		if(idPais != null) {
			estados = estadoService.obterPorPais(idPais);			
		}
	}

	public void buscarMunicipiosPorEstado() {
		if(idEstado != null) {
			municipios = municipioService.obterPorEstado(new Estado(idEstado));
		}
	}
	
	public StreamedContent carregarImagem() {
		if(local != null && local.getLogo() != null){
			return new DefaultStreamedContent(new ByteArrayInputStream(local.getLogo()));			
		}
		return null;
	}
	
	public void fileUploadLogo(FileUploadEvent event) {
		FacesMessage message = new FacesMessage();
		
		message.setDetail(BbLocale.getI18nMessage("message.info.file.upload"));
		message.setSummary(BbLocale.getI18nMessage("message.info.file.upload"));
		message.setSeverity(FacesMessage.SEVERITY_INFO);

		FacesContext.getCurrentInstance().addMessage(null, message);

		UploadedFile logo = event.getFile();
		local.setLogo(logo.getContents());
		if (!local.isNew()) {
			this.localService.salvarOuAtualizar(local);
		}
	}
	
	public void salvarDocumentoAnexo(FileUploadEvent event) {
		FacesMessage message = new FacesMessage();
		if(event != null && event.getFile() != null) {
			
			message.setDetail(BbLocale.getI18nMessage("message.info.file.upload"));
			message.setSummary(BbLocale.getI18nMessage("message.info.file.upload"));
			message.setSeverity(FacesMessage.SEVERITY_INFO);
			
			FacesContext.getCurrentInstance().addMessage(null, message);
			
			UploadedFile document = event.getFile();
			
			DocumentoAnexo documentoAnexo = new DocumentoAnexo();
			documentoAnexo.setDocumento(document.getContents());
			documentoAnexo.setNome(document.getFileName());
			documentoAnexo.setLocal(local);
			
			if(!documentosAnexos.contains(documentoAnexo)) {
				documentoAnexoService.salvar(documentoAnexo);				
				documentosAnexos.add(documentoAnexo);
			}
		}
	}
	
	public void salvar() {
		logger.debug("LocalController.salvar");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/ListaLocal.nicbrain?faces-redirect=true");
	}
	
	public void habilitarGrid() {
		this.gridHabilitada = true;
	}
	
	public void desabilitarGrid() {
		this.gridHabilitada = false;
	}
	
	public long getId() {
		if (secureRandom == null) {
			secureRandom = new SecureRandom();
		}
		return secureRandom.nextLong();
	}
	
	public List<DocumentoAnexo> getDocumentosAnexosAsList() {
		ArrayList<DocumentoAnexo> listDocumentosAnexos = new ArrayList<DocumentoAnexo>(documentosAnexos);
		return listDocumentosAnexos;
	}

	public Local getLocal() {
		return local;
	}

	public void setLocal(Local local) {
		this.local = local;
	}

	public List<Local> getLocais() {
		return locais;
	}

	public void setLocais(List<Local> locais) {
		this.locais = locais;
	}

	public List<Cliente> getClientes() {
		return clientes;
	}

	public void setClientes(List<Cliente> clientes) {
		this.clientes = clientes;
	}

	public List<Pais> getPaises() {
		return paises;
	}

	public void setPaises(List<Pais> paises) {
		this.paises = paises;
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

	public List<Endereco> getEnderecos() {
		return enderecos;
	}

	public void setEnderecos(List<Endereco> enderecos) {
		this.enderecos = enderecos;
	}

	public List<TipoLocal> getTiposLocal() {
		return tiposLocal;
	}

	public void setTiposLocal(List<TipoLocal> tiposLocal) {
		this.tiposLocal = tiposLocal;
	}

	public SortedSet<DocumentoAnexo> getDocumentosAnexos() {
		return documentosAnexos;
	}

	public void setDocumentosAnexos(SortedSet<DocumentoAnexo> documentosAnexos) {
		this.documentosAnexos = documentosAnexos;
	}

}
