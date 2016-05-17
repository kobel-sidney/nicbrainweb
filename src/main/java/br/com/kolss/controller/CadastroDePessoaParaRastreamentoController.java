package br.com.kolss.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;

import org.apache.log4j.Logger;
import org.primefaces.event.SelectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.datamodel.AgendamentoRastreamentoUsuarioDataModel;
import br.com.kolss.datamodel.UsuarioDataModel;
import br.com.kolss.model.entities.AgendamentoRastreamentoUsuario;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.AgendamentoRastreamentoUsuarioService;
import br.com.kolss.service.UsuarioService;


@Controller(value = "cadastroDeAgendamentoDeRastreamentoBean")
@Scope("session")
public class CadastroDePessoaParaRastreamentoController {
	
	private String nomeDoUsuarioParaBusca;
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	private UsuarioDataModel listaUsuarios;
	
	private AgendamentoRastreamentoUsuario agendamentoRastreamentoUsuario = new AgendamentoRastreamentoUsuario();
	private AgendamentoRastreamentoUsuarioDataModel rastreamentoDataModel;
	
	private Usuario device;
	private Long idUsuario;
	
	private boolean modoDeEdicao;
	
	
	@Autowired
	protected UsuarioService usuarioService;
	
	@Autowired
	protected AgendamentoRastreamentoUsuarioService rastreamentoService;
	
	

	public CadastroDePessoaParaRastreamentoController() {
		
	}


	public UsuarioDataModel getListaUsuarios() {
		
		// Para Remover a Selecão, seta null no Usuario
		setUsuario(null);
		
		if (getNomeDoUsuarioParaBusca() == null || getNomeDoUsuarioParaBusca().equals("") ){
			listaUsuarios = new UsuarioDataModel(usuarioService.getUsuariosAtivosComDeviceRegistrado());
		} else {
			listaUsuarios = new UsuarioDataModel(usuarioService.getUsuariosAtivosPorNome(getNomeDoUsuarioParaBusca()));
		}
		
		return listaUsuarios;
	}
	
	public void buscaUsuarioPorNome(ValueChangeEvent vce){
		   
		setNomeDoUsuarioParaBusca((String) vce.getNewValue());
	}

	public String getNomeDoUsuarioParaBusca() {
		return nomeDoUsuarioParaBusca == null ? "" : nomeDoUsuarioParaBusca;
	}

	public void setNomeDoUsuarioParaBusca(String nomeDoUsuarioParaBusca) {
		this.nomeDoUsuarioParaBusca = nomeDoUsuarioParaBusca;
	}


	public void avancaParaDefinicaoDoRastreamento() {
				
		try {
			
			FacesContext fc = FacesContext.getCurrentInstance();
			NavigationHandler nh = fc.getApplication().getNavigationHandler();
			nh.handleNavigation(fc, null, "/restrict/CadastroDePessoaParaRastreamento.nicbrain?faces-redirect=true");

			
		} catch (Exception e) {
			logger.info("Problema ao avançar da Lista de Usuários para o Cadastro de Pessoas para Rastreamento");
		}

	}
	
	public void voltarParaLista(){
				
		try {
			
			FacesContext fc = FacesContext.getCurrentInstance();
			NavigationHandler nh = fc.getApplication().getNavigationHandler();
			nh.handleNavigation(fc, null, "/restrict/ListaDoCadastroDePessoaParaRastreamento.nicbrain?faces-redirect=true");
			
		} catch (Exception e) {
			logger.info("Problema ao voltar do Cadastro de Pessoas para Rastreamento para a Lista de Usuários");
		}
		
	}

	public void onRowSelect(SelectEvent event) {
		
		setIdUsuario(((Usuario) event.getObject()).getId());
		avancaParaDefinicaoDoRastreamento();
		
	}
	
	public AgendamentoRastreamentoUsuarioDataModel getRastreamentoDataModel() {
				
		List<AgendamentoRastreamentoUsuario> listaDeRastreamento = new ArrayList<AgendamentoRastreamentoUsuario>();
		
		try {
			listaDeRastreamento = rastreamentoService.getRastreamentosPorUsuario(getIdUsuario());
		} catch (Exception e) {
			logger.debug("Problema no getRastreamentoDataModel: " + e.getLocalizedMessage());
		}				
		
		return new AgendamentoRastreamentoUsuarioDataModel(listaDeRastreamento);
	}
	
	public void novoRastreamento(){
		
		setAgendamentoRastreamentoUsuario(new AgendamentoRastreamentoUsuario());
		setModoDeEdicao(false);
		getAgendamentoRastreamentoUsuario().setDataInicioRastreamento(null);
		getAgendamentoRastreamentoUsuario().setDataFimRastreamento(null);
		
	}
	
	public void salvarRastreamento(){
		
		try {
		
			if (asDatasEstaoValidas()){
				
				getAgendamentoRastreamentoUsuario().setUsuario(usuarioService.obter(getIdUsuario()));
				getAgendamentoRastreamentoUsuario().setDataCadastro(new Date());
				getAgendamentoRastreamentoUsuario().setRastreamentoPorRota(false);
				
				rastreamentoService.salvar(getAgendamentoRastreamentoUsuario());
				
				mostraMensagemDeQueORastreamentoFoiInseridoComSucesso();
				
			} else {
				mostraMensagemDeQueADataDeInicioPrecisaSerMenorDoQueADataFinal();
			}
			
		} catch (Exception e) {
			
			logger.debug("Problema na Inclusão do Rastreamento: " + e.getLocalizedMessage());

		}
		
		
	}
	
	public void alterarRastreamento(){
		
		try {
			
			if (asDatasEstaoValidas()){
			
				rastreamentoService.alterar(getAgendamentoRastreamentoUsuario());
				mostraMensagemDeQueORastreamentoFoiAlteradoComSucesso();
				
			} else {
				mostraMensagemDeQueADataDeInicioPrecisaSerMenorDoQueADataFinal();
			}
			
		} catch (Exception e) {
			logger.debug("Problema na Alteração do Rastreamento: " + e.getLocalizedMessage());
		}
		
	}

	
	public void excluirRastreamento(){
				
		try {
			rastreamentoService.excluir(getAgendamentoRastreamentoUsuario());
			mostraMensagemDeQueORastreamentoFoiExcluidoComSucesso();
		} catch (Exception e) {
			logger.debug("Problema na Exclusao do Rastreamento: " + e.getLocalizedMessage());
		}
		
		
	}
	
	public void mostraMensagemDeQueADataDeInicioPrecisaSerMenorDoQueADataFinal(){
		
		FacesContext.getCurrentInstance().addMessage(null, 
	              new FacesMessage(FacesMessage.SEVERITY_ERROR,
	                "A Data de Ínicio do Rastreamento precisa ser anterior a Data Final!", 
	                "A Data de Ínicio do Rastreamento precisa ser anterior a Data Final!"));
		
	}

	public void mostraMensagemDeQueORastreamentoFoiInseridoComSucesso(){
		
		FacesContext.getCurrentInstance().addMessage(null, 
	              new FacesMessage(FacesMessage.SEVERITY_ERROR,
	                "Rastreamento Inserido com Sucesso!", 
	                "Rastreamento Inserido com Sucesso!"));
		
	}

	public void mostraMensagemDeQueORastreamentoFoiAlteradoComSucesso(){
		
		FacesContext.getCurrentInstance().addMessage(null, 
	              new FacesMessage(FacesMessage.SEVERITY_ERROR,
	                "Rastreamento Alterado com Sucesso!", 
	                "Rastreamento Alterado com Sucesso!"));
		
	}

	public void mostraMensagemDeQueORastreamentoFoiExcluidoComSucesso(){
		
		FacesContext.getCurrentInstance().addMessage(null, 
	              new FacesMessage(FacesMessage.SEVERITY_ERROR,
	                "Rastreamento Excluído com Sucesso!", 
	                "Rastreamento Excluído com Sucesso!"));
		
	}
	
	public boolean asDatasEstaoValidas(){
		
		if (getAgendamentoRastreamentoUsuario().getDataInicioRastreamento().before(getAgendamentoRastreamentoUsuario().getDataFimRastreamento())){
			return true;
		} else {
			return false;
		}
		
	}
	
	public Usuario getUsuario() {
		return device;
	}


	public void setUsuario(Usuario device) {
		this.device = device;
	}


	public Long getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Long idUsuario) {
		this.idUsuario = idUsuario;
	}


	public AgendamentoRastreamentoUsuario getAgendamentoRastreamentoUsuario() {
		return agendamentoRastreamentoUsuario;
	}


	public void setAgendamentoRastreamentoUsuario(AgendamentoRastreamentoUsuario rastreamento) {
		this.agendamentoRastreamentoUsuario = rastreamento;
	}
	
	public void setModoDeEdicao(boolean modoDeEdicao){
		this.modoDeEdicao = modoDeEdicao;
	}
	
	public boolean getModoDeEdicao(){
		return modoDeEdicao;
	}

	
	

	
}
