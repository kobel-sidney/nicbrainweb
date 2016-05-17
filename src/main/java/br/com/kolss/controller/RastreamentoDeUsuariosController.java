package br.com.kolss.controller;

import java.util.Date;

import javax.faces.application.FacesMessage;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;

import org.apache.log4j.Logger;
import org.primefaces.event.SelectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.datamodel.RastreamentoDataModel;
import br.com.kolss.model.entities.AgendamentoRastreamentoUsuario;
import br.com.kolss.model.entities.RastreamentoUsuario;
import br.com.kolss.service.AgendamentoRastreamentoUsuarioService;
import br.com.kolss.service.PessoaService;
import br.com.kolss.service.RastreamentoUsuarioService;
import br.com.kolss.service.UsuarioService;
import br.com.kolss.util.DataUtil;


@Controller(value = "rastreamentoDeUsuariosBean")
@Scope("session")
public class RastreamentoDeUsuariosController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	private String cabecalho = "Rastreamento de Usuários";
	
	private String nomeDoUsuarioParaBusca;
	
	private boolean modoDePesquisa;
	
	private AgendamentoRastreamentoUsuario rastreamento = new AgendamentoRastreamentoUsuario();
	private RastreamentoDataModel listaDeRastreamentos;
	 
	
	private Date filtroDoPeriodoInicialDoRastreamento;
	private Date filtroDoPeriodoFinalDoRastreamento;
	
	@Autowired
	protected UsuarioService usuarioService;
	
	@Autowired
	protected AgendamentoRastreamentoUsuarioService agendamentoRastreamentoService;
	
	@Autowired
	protected RastreamentoUsuarioService rastreamentoUsuarioService;
	
	@Autowired
	protected PessoaService pessoaService;
	
	private RastreamentoUsuario primeiroPontoRastreadoDoRastreamento;
	private RastreamentoUsuario ultimoPontoRastreadoDoRastreamento;
	

	public RastreamentoDeUsuariosController() {
	}


	public RastreamentoDataModel getListaDeRastreamentos() {
			
		return listaDeRastreamentos;
	}
	
	public RastreamentoDataModel getListaDeRastreamentosAtivos() {
		
		listaDeRastreamentos = new RastreamentoDataModel(agendamentoRastreamentoService.getRastreamentosAtivos());
		return listaDeRastreamentos;
	}
	
	public RastreamentoDataModel getListaDeRastreamentosAtivosPeloNomeDoUsuarioEPorPeriodo(String nomeDoUsuario, Date dataInicial, Date dataFinal) {
		
		listaDeRastreamentos = new RastreamentoDataModel(agendamentoRastreamentoService.getRastreamentosAtivosPeloNomeDoUsuarioEPorPeriodo(nomeDoUsuario, dataInicial, dataFinal));
		return listaDeRastreamentos;
	}
	
	public RastreamentoDataModel getListaDeRastreamentosAtivosPorPeriodo(Date dataInicial, Date dataFinal) {
		
		listaDeRastreamentos = new RastreamentoDataModel(agendamentoRastreamentoService.getRastreamentosAtivosPorPeriodo(dataInicial, dataFinal));
		return listaDeRastreamentos;
	}
	
	public RastreamentoDataModel getListaDeRastreamentosAtivosPeloNomeDoUsuario(String nomeDoUsuario) {
		
		listaDeRastreamentos = new RastreamentoDataModel(agendamentoRastreamentoService.getRastreamentosAtivosPeloNomeDoUsuario(nomeDoUsuario));
		return listaDeRastreamentos;
	}
	
	public void beforePhase(PhaseEvent event) {
		
		try {
		
			if (event.getPhaseId().equals(PhaseId.RENDER_RESPONSE)){
				
				if(isModoDePesquisa()){
					
					executaFiltro();
					
				} else {
					
					limpaFiltro();
					
				}
	
			}
			
		} catch(Exception e) {
			
			logger.debug("Problemas no PhaseListener do RastreamentoDeUsuariosController : " + e.getLocalizedMessage());
			
		}
		
	}

	public String getNomeDoUsuarioParaBusca() {
		return nomeDoUsuarioParaBusca;
	}

	public void setNomeDoUsuarioParaBusca(String nomeDoUsuarioParaBusca) {
		this.nomeDoUsuarioParaBusca = nomeDoUsuarioParaBusca;
	}


	public void retornaParaListaDeRastreamentosAtivos() {
		
		try {
			
			FacesContext fc = FacesContext.getCurrentInstance();
			NavigationHandler nh = fc.getApplication().getNavigationHandler();
			nh.handleNavigation(fc, null, "/restrict/ListaDeRastreamentosAtivos.nicbrain?faces-redirect=true");

			
		} catch (Exception e) {
			logger.info("Problema ao retornar do Mapa de Rastreamento para a Lista de Usuários Rastreados");
		}

	}

	void avancaParaMapaDeRastreamentoDeUsuarios() {
				
		try {
			
			FacesContext fc = FacesContext.getCurrentInstance();
			NavigationHandler nh = fc.getApplication().getNavigationHandler();
			nh.handleNavigation(fc, null, "/restrict/MapaDoRastreamentoDeUsuarios.nicbrain?faces-redirect=true");

			
		} catch (Exception e) {
			logger.info("Problema ao avançar da Lista de Usuários Rastreados para o Mapa de Rastreamento");
		}

	}
	
	public void voltarParaLista(){
				
		try {
			
			FacesContext fc = FacesContext.getCurrentInstance();
			NavigationHandler nh = fc.getApplication().getNavigationHandler();
			nh.handleNavigation(fc, null, "/restrict/ListaDoCadastroDePessoaParaRastreamento.nicbrain");
			
		} catch (Exception e) {
			logger.info("Problema ao voltar do Cadastro de Pessoas para Rastreamento para a Lista de Usuários");
		}
		
	}
	
	public void atualizaOsPontosRastreados(){
		
		avancaParaMapaDeRastreamentoDeUsuarios();
		
	}

	public void onRowSelect(SelectEvent event) {
		
		setRastreamento((AgendamentoRastreamentoUsuario) event.getObject());
		setPrimeiroPontoRastreadoDoRastreamento(rastreamentoUsuarioService.getPrimeiroPontoRastreadoDoRastreamento(getRastreamento()));
		setUltimoPontoRastreadoDoRastreamento(rastreamentoUsuarioService.getUltimoPontoRastreadoDoRastreamento(getRastreamento()));
		
		avancaParaMapaDeRastreamentoDeUsuarios();
		
	}
	
	public void limpaFiltro(){
				
		setNomeDoUsuarioParaBusca(null);
		setFiltroDoPeriodoInicialDoRastreamento(null);
		setFiltroDoPeriodoFinalDoRastreamento(null);
		
		getListaDeRastreamentosAtivos();
		
	}
	
	public void preparaFiltroParaExecucao(){
		
		setModoDePesquisa(true);
		
	}
	
	public void preparaLimpezaParaExecucao(){
		
		setModoDePesquisa(false);
		
	}
	
	public String executaFiltro(){
				
		try {
		
			if (oPeriodoDeveSerFiltrado() && oNomeDoUsuarioDeveSerFiltrado()){
				
				if(asDatasEstaoValidas()){
				
					getListaDeRastreamentosAtivosPeloNomeDoUsuarioEPorPeriodo(getNomeDoUsuarioParaBusca(), getFiltroDoPeriodoInicialDoRastreamento(), getFiltroDoPeriodoFinalDoRastreamento());
					
				}
				
			} else {
			
				if(oPeriodoDeveSerFiltrado()){
					
					if(asDatasEstaoValidas()){
					
						getListaDeRastreamentosAtivosPorPeriodo(getFiltroDoPeriodoInicialDoRastreamento(), getFiltroDoPeriodoFinalDoRastreamento());
					
					}
					
				} else if(oNomeDoUsuarioDeveSerFiltrado()){
					
					getListaDeRastreamentosAtivosPeloNomeDoUsuario(getNomeDoUsuarioParaBusca());
					
				} else {
					
					getListaDeRastreamentosAtivos();
					
				}
				
			}
			
		} catch (Exception e) {
			logger.debug("Problema na Execução do Filtro do Rastreamento: " + e.getLocalizedMessage());
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	public boolean asDatasEstaoValidas(){
		
		
		if(getFiltroDoPeriodoInicialDoRastreamento() == null){
			mostraMensagemDeQueADataInicialEstaVazia();
			return false;
		}
		
		if(getFiltroDoPeriodoFinalDoRastreamento() == null) {
			mostraMensagemDeQueADataFinalEstaVazia();
			return false;
		}
		
		if(getFiltroDoPeriodoInicialDoRastreamento().equals("")){
			mostraMensagemDeQueADataInicialEstaVazia();
			return false;
		}
		
		if(getFiltroDoPeriodoFinalDoRastreamento().equals("")) {
			mostraMensagemDeQueADataFinalEstaVazia();
			return false;
		}
						
		if (getFiltroDoPeriodoInicialDoRastreamento().before(getFiltroDoPeriodoFinalDoRastreamento())){
			return true;
		} else {
			mostraMensagemDeQueADataDeInicioPrecisaSerMenorDoQueADataFinal();
			return false;
		}
		
	}
	
	public boolean oPeriodoDeveSerFiltrado(){
		
		if(getFiltroDoPeriodoInicialDoRastreamento() != null || getFiltroDoPeriodoFinalDoRastreamento() != null){
			return true;
		} else {
			return false;
		}
		
	}
	
	public boolean oNomeDoUsuarioDeveSerFiltrado(){
		
		if(getNomeDoUsuarioParaBusca() != null){
			
			if(!getNomeDoUsuarioParaBusca().equals("")){
				return true;
			} else {
				return false;
			}
			
		} else {
			return false;
		}
		
	}

	public AgendamentoRastreamentoUsuario getRastreamento() {
		return rastreamento;
	}


	public void setRastreamento(AgendamentoRastreamentoUsuario rastreamento) {
		this.rastreamento = rastreamento;
	}


	public Date getFiltroDoPeriodoInicialDoRastreamento() {
		return filtroDoPeriodoInicialDoRastreamento;
	}


	public void setFiltroDoPeriodoInicialDoRastreamento( Date filtroDoPeriodoInicialDoRastreamento) {
		this.filtroDoPeriodoInicialDoRastreamento = filtroDoPeriodoInicialDoRastreamento;
	}


	public Date getFiltroDoPeriodoFinalDoRastreamento() {
		return filtroDoPeriodoFinalDoRastreamento;
	}


	public void setFiltroDoPeriodoFinalDoRastreamento(Date filtroDoPeriodoFinalDoRastreamento) {
		this.filtroDoPeriodoFinalDoRastreamento = filtroDoPeriodoFinalDoRastreamento;
	}


	public String getCabecalho() {
		return cabecalho;
	}
	

	public void setCabecalho(String cabecalho) {
		this.cabecalho = cabecalho;
	}
	
	public boolean isModoDePesquisa() {
		return modoDePesquisa;
	}


	public void setModoDePesquisa(boolean modoDePesquisa) {
		this.modoDePesquisa = modoDePesquisa;
	}


	public void mostraMensagemDeQueADataDeInicioPrecisaSerMenorDoQueADataFinal(){
		
		FacesContext.getCurrentInstance().addMessage(null, 
	              new FacesMessage(FacesMessage.SEVERITY_ERROR,
	                "A Data Ínicial da pesquisa precisa ser anterior a Data Final!", 
	                "A Data Ínicial da pesquisa precisa ser anterior a Data Final!"));
		
	}

	public void mostraMensagemDeQueADataInicialEstaVazia(){
		
		FacesContext.getCurrentInstance().addMessage(null, 
	              new FacesMessage(FacesMessage.SEVERITY_ERROR,
	                "Por favor, escolha um Período Inicial para Pesquisa!", 
	                "Por favor, escolha um Período Inicial para Pesquisa!"));
		
	}

	public void mostraMensagemDeQueADataFinalEstaVazia(){
		
		FacesContext.getCurrentInstance().addMessage(null, 
	              new FacesMessage(FacesMessage.SEVERITY_ERROR,
	            	"Por favor, escolha um Período Final para Pesquisa!", 
	            	"Por favor, escolha um Período Final para Pesquisa!"));
		
	}
	
	
	
	/*
	 * 
	 * 	METODOS E FLUXOS DO MAPA
	 * 
	 */

	
	public String getPontosRastreados() {
		
		StringBuilder stringComOsPontosRastreados = new StringBuilder();

		try {
						
			for (RastreamentoUsuario pontoRastreado : rastreamentoUsuarioService.getPontosDeRastreamentoPorRastreamento(getRastreamento())) {
						
				// apenas na primeira iteracao não deve incluir:
				if (stringComOsPontosRastreados.length() > 0) {
					stringComOsPontosRastreados.append(",");
					stringComOsPontosRastreados.append(" ");
					stringComOsPontosRastreados.append(",");
				}
				
				stringComOsPontosRastreados.append("Descrição");
				stringComOsPontosRastreados.append(",");
				stringComOsPontosRastreados.append(pontoRastreado.getId());
				stringComOsPontosRastreados.append(",");
				stringComOsPontosRastreados.append(pontoRastreado.getLatitude());
				stringComOsPontosRastreados.append(",");
				stringComOsPontosRastreados.append(pontoRastreado.getLongitude());
				stringComOsPontosRastreados.append(",");
				stringComOsPontosRastreados.append(DataUtil.formataData(
						pontoRastreado.getDataHoraRastreamento()));
	
			}
		
		} catch (Exception e) {
			logger.info("Exceção no getPontosRastreados: " + e.getLocalizedMessage());
			
		}
				
		return stringComOsPontosRastreados.toString();
	}	
	
	public String getCoordenadasDosPontosRastreados(){
		
		StringBuilder stringComOsPontosRastreados = new StringBuilder();

		try {
			
			for (RastreamentoUsuario pontoRastreado : rastreamentoUsuarioService.getPontosDeRastreamentoPorRastreamento(getRastreamento())) {
								
				// apenas na primeira iteracao não deve incluir:
				if (stringComOsPontosRastreados.length() > 0) {
					stringComOsPontosRastreados.append(",");
					stringComOsPontosRastreados.append(" ");
					stringComOsPontosRastreados.append(",");
				}
				
				stringComOsPontosRastreados.append(pontoRastreado.getLatitude());
				stringComOsPontosRastreados.append(",");
				stringComOsPontosRastreados.append(pontoRastreado.getLongitude());
	
			}
		
		} catch (Exception e) {
			// TODO: handle exception
			logger.info("Exceção no getCoordenadasDosPontosRastreados: " + e.getLocalizedMessage());
			
		}
				
		return stringComOsPontosRastreados.toString();
		
	}
	

	
	public void mostraMensagemDeQuePaginaFoiAtualizada(){
		
		FacesContext.getCurrentInstance().addMessage(null, 
	              new FacesMessage(FacesMessage.SEVERITY_ERROR,
	                "A página foi atualizada!", "A página foi atualizada!"));
		
	}
	
	public void mostraMensagemDeQueNaoExistemPontosDeRastreamento(){
		
		FacesContext.getCurrentInstance().addMessage(null, 
	              new FacesMessage(FacesMessage.SEVERITY_ERROR,
	                "Não existem Pontos de Rastreamento!", "Não existem Pontos de Rastreamento!"));
		
	}


	public RastreamentoUsuario getPrimeiroPontoRastreadoDoRastreamento() {
		return primeiroPontoRastreadoDoRastreamento;
	}


	public void setPrimeiroPontoRastreadoDoRastreamento(RastreamentoUsuario primeiroPontoRastreadoDoRastreamento) {
		this.primeiroPontoRastreadoDoRastreamento = primeiroPontoRastreadoDoRastreamento;
	}


	public RastreamentoUsuario getUltimoPontoRastreadoDoRastreamento() {
		return ultimoPontoRastreadoDoRastreamento;
	}


	public void setUltimoPontoRastreadoDoRastreamento(RastreamentoUsuario ultimoPontoRastreadoDoRastreamento) {
		this.ultimoPontoRastreadoDoRastreamento = ultimoPontoRastreadoDoRastreamento;
	}
	
	

	
}
