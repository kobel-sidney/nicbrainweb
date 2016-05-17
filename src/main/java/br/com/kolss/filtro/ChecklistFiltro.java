package br.com.kolss.filtro;

import java.io.Serializable;
import java.util.Date;

public class ChecklistFiltro {
	
	private Serializable idEvento;
	private Serializable idLocal;
	private Serializable idUsuarioResponsavel;
	private Serializable idStatus;
	private Date dataHoraInicio;
	private Serializable idUsuarioContexto;
	private Date DataPrevistaInicio;
	private Date DataPrevistaFim;

	

	public ChecklistFiltro(Serializable filtroIdEvento,
			Serializable filtroIdLocal,
			Serializable filtroIdUsuarioResponsavel,
			Serializable filtroIdStatus, Date filtroDataHoraInicio,
			Serializable idUsuarioContexto) {
		this.idEvento = filtroIdEvento;
		this.idLocal = filtroIdLocal;
		this.idUsuarioResponsavel = filtroIdUsuarioResponsavel;
		this.idStatus = filtroIdStatus;
		this.dataHoraInicio = filtroDataHoraInicio;
		this.idUsuarioContexto = idUsuarioContexto;
	}
	
	

	public ChecklistFiltro(Serializable idEvento,Serializable idUsuarioContexto, 
			Date dataHoraInicio) {
		super();
		this.idEvento = idEvento;
		this.dataHoraInicio = dataHoraInicio;
		this.idUsuarioContexto = idUsuarioContexto;
	}



	public ChecklistFiltro() {
	}

	public Serializable getIdEvento() {
		return idEvento;
	}

	public void setIdEvento(Serializable idEvento) {
		this.idEvento = idEvento;
	}

	public Serializable getIdLocal() {
		return idLocal;
	}

	public void setIdLocal(Serializable idLocal) {
		this.idLocal = idLocal;
	}

	public Serializable getIdUsuarioResponsavel() {
		return idUsuarioResponsavel;
	}

	public void setIdUsuarioResponsavel(Serializable idUsuarioResponsavel) {
		this.idUsuarioResponsavel = idUsuarioResponsavel;
	}

	public Serializable getIdStatus() {
		return idStatus;
	}

	public void setIdStatus(Serializable idStatus) {
		this.idStatus = idStatus;
	}

	public Date getDataHoraInicio() {
		return dataHoraInicio;
	}

	public void setDataHoraInicio(Date dataHoraInicio) {
		this.dataHoraInicio = dataHoraInicio;
	}

	public Serializable getIdUsuarioContexto() {
		return idUsuarioContexto;
	}

	public void setIdUsuarioContexto(Serializable idUsuarioContexto) {
		this.idUsuarioContexto = idUsuarioContexto;
	}



	public Date getDataPrevistaInicio() {
		return DataPrevistaInicio;
	}



	public void setDataPrevistaInicio(Date dataPrevistaInicio) {
		DataPrevistaInicio = dataPrevistaInicio;
	}



	public Date getDataPrevistaFim() {
		return DataPrevistaFim;
	}



	public void setDataPrevistaFim(Date dataPrevistaFim) {
		DataPrevistaFim = dataPrevistaFim;
	}
	
	
	
}