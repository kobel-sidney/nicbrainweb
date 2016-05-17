package br.com.kolss.dto;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import br.com.kolss.model.entities.Atividade;

@XmlRootElement
public class ChecklistDTO {
	
	/**
	 * Chave
	 */
	private String idChecklist;
	private String idEvento;
	private String idLocal;
	private String idCliente;
	
	
	private String nomeCheckList;
	private String dataPrevistaInicio;
	private String nomeStatus;
	private String nomeResponsavel;
	private String qtdAlerta;
	private String corSituacao;
	
	private List<Atividade> atividadesChecklist = new ArrayList<Atividade>();
	
	
	private static final long serialVersionUID = 1L;

	
	public ChecklistDTO(){
		
	}
	
	public ChecklistDTO(String idChecklist, String nomeCheckList,
			String dataPrevistaInicio, String nomeStatus, String nomeResponsavel, String corSituacao) {
		super();
		this.idChecklist = idChecklist;
		this.nomeCheckList = nomeCheckList;
		this.dataPrevistaInicio = dataPrevistaInicio;
		this.nomeStatus = nomeStatus;
		this.nomeResponsavel = nomeResponsavel;
		this.corSituacao = corSituacao;
	}

	public String getIdChecklist() {
		return idChecklist;
	}

	public void setIdChecklist(String idChecklist) {
		this.idChecklist = idChecklist;
	}

	public String getNomeCheckList() {
		return nomeCheckList;
	}

	public void setNomeCheckList(String nomeCheckList) {
		this.nomeCheckList = nomeCheckList;
	}

	public String getDataPrevistaInicio() {
		return dataPrevistaInicio;
	}

	public void setDataPrevistaInicio(String dataPrevistaInicio) {
		this.dataPrevistaInicio = dataPrevistaInicio;
	}

	public String getNomeStatus() {
		return nomeStatus;
	}

	public void setNomeStatus(String nomeStatus) {
		this.nomeStatus = nomeStatus;
	}

	public String getNomeResponsavel() {
		return nomeResponsavel;
	}

	public void setNomeResponsavel(String nomeResponsavel) {
		this.nomeResponsavel = nomeResponsavel;
	}

	public String getIdEvento() {
		return idEvento;
	}

	public void setIdEvento(String idEvento) {
		this.idEvento = idEvento;
	}

	public String getIdLocal() {
		return idLocal;
	}

	public void setIdLocal(String idLocal) {
		this.idLocal = idLocal;
	}

	public String getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(String idCliente) {
		this.idCliente = idCliente;
	}

	public List<Atividade> getAtividadesChecklist() {
		return atividadesChecklist;
	}

	public void setAtividadesChecklist(List<Atividade> atividadesChecklist) {
		this.atividadesChecklist = atividadesChecklist;
	}

	public String getQtdAlerta() {
		return qtdAlerta;
	}

	public void setQtdAlerta(String qtdAlerta) {
		this.qtdAlerta = qtdAlerta;
	}

	@Override
	public String toString() {
		return "ChecklistDTO [idChecklist=" + idChecklist + ", idEvento="
				+ idEvento + ", idLocal=" + idLocal + ", idCliente="
				+ idCliente + ", nomeCheckList=" + nomeCheckList
				+ ", dataPrevistaInicio=" + dataPrevistaInicio
				+ ", nomeStatus=" + nomeStatus + ", nomeResponsavel="
				+ nomeResponsavel + ", qtdAlerta=" + qtdAlerta
				+ ", atividadesChecklist=" + atividadesChecklist 
				+", corSituacao=" + corSituacao + "]";
	}
	
	public String getCorSituacao() {
		return corSituacao;
	}

	public void setCorSituacao(String corSituacao) {
		this.corSituacao = corSituacao;
	}
	
}
