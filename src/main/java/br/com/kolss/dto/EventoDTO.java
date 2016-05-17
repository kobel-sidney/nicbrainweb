package br.com.kolss.dto;

import javax.xml.bind.annotation.XmlRootElement;

import br.com.kolss.model.entities.Evento;

@XmlRootElement
public class EventoDTO {

	private String idEvento;
	private String nomeEvento;
	private long dataInicioPrevisto;
	private LocalDTO localDTO;

	public EventoDTO() {
	}

	public EventoDTO(String idEvento, String nomeEvento, Long dataInicioPrevisto, LocalDTO localDTO) {
		super();
		this.idEvento = idEvento;
		this.nomeEvento = nomeEvento;
		this.dataInicioPrevisto = dataInicioPrevisto;
		this.localDTO = localDTO;
	}

	public EventoDTO(Evento evento) {
		this.idEvento = evento.getId().toString();
		this.nomeEvento = evento.getNome();
		this.dataInicioPrevisto = evento.getDataInicio().getTime();
		this.localDTO = new LocalDTO(evento.getLocal());
	}

	public String getIdEvento() {
		return idEvento;
	}

	public void setIdEvento(String idEvento) {
		this.idEvento = idEvento;
	}

	public String getNomeEvento() {
		return nomeEvento;
	}

	public void setNomeEvento(String nomeEvento) {
		this.nomeEvento = nomeEvento;
	}

	public LocalDTO getLocalDTO() {
		return localDTO;
	}

	public void setLocalDTO(LocalDTO localDTO) {
		this.localDTO = localDTO;
	}

	public long getDataInicioPrevisto() {
		return dataInicioPrevisto;
	}

	public void setDataInicioPrevisto(long dataInicioPrevisto) {
		this.dataInicioPrevisto = dataInicioPrevisto;
	}

}
