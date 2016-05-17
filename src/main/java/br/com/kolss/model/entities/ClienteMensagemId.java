package br.com.kolss.model.entities;

import java.io.Serializable;


public class ClienteMensagemId implements Serializable {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 5721533338572106670L;
	
	private Long cliente;
	private Long mensagem;
	
	
	/** Método Construtor padrão. */
	public ClienteMensagemId() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param cliente
	 * @param mensagem
	 */
	public ClienteMensagemId(Long cliente, Long mensagem) {
		this.cliente = cliente;
		this.mensagem = mensagem;
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param cliente
	 * @param mensagem
	 */
	public ClienteMensagemId(Cliente cliente, Mensagem mensagem) {
		if (cliente != null) {
			this.cliente = cliente.getId();
		}
		if (mensagem != null) {
			this.mensagem = mensagem.getId();
		}
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cliente == null) ? 0 : cliente.hashCode());
		result = prime * result
				+ ((mensagem == null) ? 0 : mensagem.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ClienteMensagemId other = (ClienteMensagemId) obj;
		if (cliente == null) {
			if (other.cliente != null)
				return false;
		} else if (!cliente.equals(other.cliente))
			return false;
		if (mensagem == null) {
			if (other.mensagem != null)
				return false;
		} else if (!mensagem.equals(other.mensagem))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "ClienteMensagemId [cliente=" + cliente
				+ ", mensagem="	+ mensagem
				+ "]";
	}
	
	
	public Long getCliente() {
		return cliente;
	}
	
	public void setCliente(Long cliente) {
		this.cliente = cliente;
	}
	
	public Long getMensagem() {
		return mensagem;
	}
	
	public void setMensagem(Long mensagem) {
		this.mensagem = mensagem;
	}
	
}
