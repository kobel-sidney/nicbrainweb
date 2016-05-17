package br.com.kolss.controller;

import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import org.apache.log4j.Logger;
import org.joda.time.DateTime;
import org.joda.time.Seconds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;

import br.com.kolss.dto.CoordenadaDTO;
import br.com.kolss.dto.ListaOperacaoAtividadeCoordenadasDTO;
import br.com.kolss.dto.OperacaoAtividadeCoordenadasDTO;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.OperacaoAtividade;
import br.com.kolss.service.AtividadeChecklistService;
import br.com.kolss.service.OperacaoAtividadeChecklistService;
import br.com.kolss.service.OperacaoChecklistService;
import br.com.kolss.util.DataUtil;


@Controller(value = "rastreamentoDeOperacoesDoChecklist")
@Scope("session")
public class RastreamentoDeOperacoesDoChecklistController {
	
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private OperacaoChecklistService operacaoDoChecklistService;
	
	@Autowired
	private OperacaoAtividadeChecklistService operacaoDaAtividadeDoChecklistService;
		
	@Autowired
	private AtividadeChecklistService atividadeService;
	
	private Checklist checklist;

	private Local localDaPrimeiraOperacaoDoCheckList;
	private Local localDaUltimaOperacaoDoCheckList;
	
	private boolean oEventoSelecionadoPossuiLatitudeLongitude;
	
	public RastreamentoDeOperacoesDoChecklistController(){
		
	}
		
	public Checklist getChecklist() {
		return checklist;
	}

	public void setChecklist(Checklist checklist) {
		this.checklist = checklist;
	}

	/**
	 * Retorna os dados para exibir os Checklists Realizados no Mapa.
	 * 
	 * @return
	 */
	public String getChecklistsPrevistos() {
		
		logger.info("RastreamentoDeOperacoesDoChecklistController.getChecklistsPrevistos");

		List<Atividade> listaDeAtividadesPrevistasDoChecklist = atividadeService.getAtividadesPrevistasPorCheckList(checklist);
				
		StringBuilder stringComAtividadesPrevistasDoCheckList = new StringBuilder();
		
		try {
								
			for (Atividade atividadeBuffer : listaDeAtividadesPrevistasDoChecklist) {
				
				// apenas na primeira iteracao não deve incluir:
				if (stringComAtividadesPrevistasDoCheckList.length() > 0) {
					stringComAtividadesPrevistasDoCheckList.append(",");
					stringComAtividadesPrevistasDoCheckList.append(" ");
					stringComAtividadesPrevistasDoCheckList.append(",");
				}
				
				stringComAtividadesPrevistasDoCheckList.append("Descrição");
				stringComAtividadesPrevistasDoCheckList.append(",");
				stringComAtividadesPrevistasDoCheckList.append(atividadeBuffer.getNome().replace(",","."));
				stringComAtividadesPrevistasDoCheckList.append(",");
				stringComAtividadesPrevistasDoCheckList.append(atividadeBuffer.getLatitude());
				stringComAtividadesPrevistasDoCheckList.append(",");
				stringComAtividadesPrevistasDoCheckList.append(atividadeBuffer.getLongitude());
				stringComAtividadesPrevistasDoCheckList.append(",");
				stringComAtividadesPrevistasDoCheckList.append(getChecklist().getEvento().getNome().toString());
				stringComAtividadesPrevistasDoCheckList.append(",");
				stringComAtividadesPrevistasDoCheckList.append(getChecklist().getNome());
				stringComAtividadesPrevistasDoCheckList.append(",");
				stringComAtividadesPrevistasDoCheckList.append(atividadeBuffer.getStatus().getNome());
				stringComAtividadesPrevistasDoCheckList.append(",");
				stringComAtividadesPrevistasDoCheckList.append(getChecklist().getUsuarioResponsavel().getPessoa().getNome());
				stringComAtividadesPrevistasDoCheckList.append(",");
				stringComAtividadesPrevistasDoCheckList.append(
						DataUtil.formataData(
								atividadeBuffer.getDataInicioPrevisto()));

			}
		} catch (Exception e) {
			// TODO: handle exception
			logger.info("Exceção no Rastreamento De Checklist: " + e.getLocalizedMessage());
			
		}
				
		return stringComAtividadesPrevistasDoCheckList.toString();
	}	
	
	/**
	 * Retorna os dados para exibir os Checklists Realizados no Mapa.
	 * 
	 * @return
	 */
	public String getChecklistsRealizados() {
		
		logger.info("RastreamentoDeOperacoesDoChecklistController.getChecklistsRealizados");
		
		List<OperacaoAtividade> listaDeOperacoesRealizadasDaAtividadeDoChecklist =
				operacaoDaAtividadeDoChecklistService.getOperacoesDaAtividadeDoChecklist(checklist);
				
		StringBuilder stringComOperacoesDeCheckList = new StringBuilder();
		
		try {
								
			for (OperacaoAtividade operacaoAtividadeBuffer : listaDeOperacoesRealizadasDaAtividadeDoChecklist) {
				
				
				if (operacaoAtividadeBuffer.getLatitude() != null && operacaoAtividadeBuffer.getLongitude() != null){
				
					// apenas na primeira iteracao não deve incluir:
					if (stringComOperacoesDeCheckList.length() > 0) {
						stringComOperacoesDeCheckList.append(",");
						stringComOperacoesDeCheckList.append(" ");
						stringComOperacoesDeCheckList.append(",");
					}
					
					stringComOperacoesDeCheckList.append("Descrição");
					stringComOperacoesDeCheckList.append(",");
					stringComOperacoesDeCheckList.append(operacaoAtividadeBuffer.getAtividade().getNome());
					stringComOperacoesDeCheckList.append(",");
					stringComOperacoesDeCheckList.append(operacaoAtividadeBuffer.getLatitude());
					stringComOperacoesDeCheckList.append(",");
					stringComOperacoesDeCheckList.append(operacaoAtividadeBuffer.getLongitude());
					stringComOperacoesDeCheckList.append(",");
					stringComOperacoesDeCheckList.append(getChecklist().getEvento().getNome().toString());
					stringComOperacoesDeCheckList.append(",");
					stringComOperacoesDeCheckList.append(getChecklist().getNome());
					stringComOperacoesDeCheckList.append(",");
					stringComOperacoesDeCheckList.append(operacaoAtividadeBuffer.getStatus().getNome());
					stringComOperacoesDeCheckList.append(",");
					stringComOperacoesDeCheckList.append(operacaoAtividadeBuffer.getUsuario().getNome());
					stringComOperacoesDeCheckList.append(",");
					stringComOperacoesDeCheckList.append(
							DataUtil.formataData(
									operacaoAtividadeBuffer.getDataStatus()));
				
				}
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			logger.info("Exceção no Rastreamento De Checklist: " + e.getLocalizedMessage());
			
		}
				
		return stringComOperacoesDeCheckList.toString();
	}
	
	public String getCoordenadasDosChecklistsRealizados() {
		
		logger.info("RastreamentoDeOperacoesDoChecklistController.getCoordenadasDosChecklistsRealizados");			
		
		List<OperacaoAtividade> listaOperacoesRealizadasAtividadeChecklist = operacaoDaAtividadeDoChecklistService.getOperacoesDaAtividadeDoChecklist(checklist);

		ListaOperacaoAtividadeCoordenadasDTO operacaoCoordenadas = new ListaOperacaoAtividadeCoordenadasDTO();
		
		operacaoCoordenadas.setInicio(checklist.getDataInicioRealizado().toString());
		
		DateTime dataInicio = new DateTime(checklist.getDataInicioRealizado());
		DateTime dataFim = null;
		
		if (checklist.getDataFimRealizado() != null) {
			operacaoCoordenadas.setFim(checklist.getDataFimRealizado().toString());
			dataFim = new DateTime(checklist.getDataFimRealizado());
			
			operacaoCoordenadas.setDuracao(Integer.toString(Seconds.secondsBetween(dataInicio, dataFim).getSeconds()));
		} else {
			operacaoCoordenadas.setDuracao("Em andamento");
			operacaoCoordenadas.setFim("Em andamento");
		}
		
		List<OperacaoAtividadeCoordenadasDTO> listaCoordenadas = new ArrayList<>();	
		
		for (OperacaoAtividade operacaoAtividade : listaOperacoesRealizadasAtividadeChecklist) {
			OperacaoAtividadeCoordenadasDTO coordenadaDTO = new OperacaoAtividadeCoordenadasDTO();
			coordenadaDTO.setLatitude(operacaoAtividade.getLatitude());
			coordenadaDTO.setLongitude(operacaoAtividade.getLongitude());
			listaCoordenadas.add(coordenadaDTO);
		}
		operacaoCoordenadas.setCoordenadas(listaCoordenadas);
		
		Gson gson = new Gson();
				
		return gson.toJson(operacaoCoordenadas);
	}
	

	public Local getLocalDaPrimeiraOperacaoDoCheckList() {
		return localDaPrimeiraOperacaoDoCheckList;
	}

	public void setLocalDaPrimeiraOperacaoDoCheckList(
			Local localDaPrimeiraOperacaoDoCheckList) {
		this.localDaPrimeiraOperacaoDoCheckList = localDaPrimeiraOperacaoDoCheckList;
	}

	public Local getLocalDaUltimaOperacaoDoCheckList() {
		return localDaUltimaOperacaoDoCheckList;
	}

	public void setLocalDaUltimaOperacaoDoCheckList(
			Local localDaUltimaOperacaoDoCheckList) {
		this.localDaUltimaOperacaoDoCheckList = localDaUltimaOperacaoDoCheckList;
	}
	
	public void setEventoSelecionadoPossuiLatitudeLongitude(boolean oEventoSelecionadoPossuiLatitudeLongitude) {
		this.oEventoSelecionadoPossuiLatitudeLongitude = oEventoSelecionadoPossuiLatitudeLongitude;
	}
	
	public String getEventoSelecionadoPossuiLatitudeLongitude(){
		return String.valueOf(oEventoSelecionadoPossuiLatitudeLongitude);
	}
	
	public void mostraMensagemDeLatitudeLongitudeNulaNoEvento() {

		FacesContext.getCurrentInstance().addMessage(null,
						new FacesMessage(FacesMessage.SEVERITY_ERROR,
								"Esse Evento, juntamente com seus CheckList's, não possui Latitude e Longitude, e " + 
								"por esse motivo, um local não pode ser identificado para o Mapeamento do Rastreamento!",
								"Esse Evento, juntamente com seus CheckList's, não possui Latitude e Longitude, e " + 
								"por esse motivo, um local não pode ser identificado para o Mapeamento do Rastreamento!"));

	}
	
	public void mostraMensagemDeQueNaoExistemCheckListsPrevistos(){
		
		FacesContext.getCurrentInstance().addMessage(null, 
	              new FacesMessage(FacesMessage.SEVERITY_ERROR,
	                "Não existem CheckList's Previstos!", "Não existem CheckList's Previstos!"));
		
	}
	
	public void mostraMensagemDeQueNaoExistemCheckListsRealizados(){
		
		FacesContext.getCurrentInstance().addMessage(null,
	              new FacesMessage(FacesMessage.SEVERITY_ERROR,
	                "Não existem CheckList's Realizados!", "Não existem CheckList's Realizados!"));
		
	}
	
	public void mostraMensagemDeQueNaoExisteRotaParaCheckListsRealizados(){
		
		FacesContext.getCurrentInstance().addMessage(null, 
	              new FacesMessage(FacesMessage.SEVERITY_ERROR,
	                "Não é possível traçar uma rota, já que não existem CheckList's Realizados!", "Não é possível traçar uma rota, já que não existem CheckList's Realizados!"));
		
	}
	

}
