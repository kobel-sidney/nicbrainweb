package br.com.kolss.model.entities;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "cliente_mensagem")
@IdClass(ClienteMensagemId.class)
public class ClienteMensagem extends AbstractEntity<ClienteMensagemId> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 4394809808687313217L;
	
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_cliente")
	private Cliente cliente = new Cliente();
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "id_mensagem")
	private Mensagem mensagem = new Mensagem();
	
	
	/** Método Construtor padrão. */
	public ClienteMensagem() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param cliente
	 * @param mensagem
	 */
	public ClienteMensagem(Cliente cliente, Mensagem mensagem) {
		this.cliente = cliente;
		this.mensagem = mensagem;
	}
	
	
	@Override
	public boolean isNew() {
		return (cliente == null
					|| mensagem == null
					|| cliente.isNew()
					|| mensagem.isNew());
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
		ClienteMensagem other = (ClienteMensagem) obj;
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
		return "ClienteMensagem [cliente=" + cliente
				+ ", mensagem=" + mensagem
				+ "]";
	}
	
	@Override
	public ClienteMensagemId getId() {
		return new ClienteMensagemId(getCliente(), getMensagem());
	}
	
	
	public Cliente getCliente() {
		return cliente;
	}
	
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
	public Mensagem getMensagem() {
		return mensagem;
	}
	
	public void setMensagem(Mensagem mensagem) {
		this.mensagem = mensagem;
	}
	
}
