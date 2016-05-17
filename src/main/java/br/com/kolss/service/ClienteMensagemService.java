package br.com.kolss.service;

import java.util.List;

import org.springframework.stereotype.Service;

import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.ClienteMensagem;
import br.com.kolss.model.entities.Mensagem;

public interface ClienteMensagemService {

	/**
	 * 
	 * @param idCliente
	 * @return
	 */
	List<Mensagem> obterAssociadasAoCliente(Long idCliente);

	/**
	 * 
	 * @param idCliente
	 * @return
	 */
	List<Mensagem> obterNaoAssociadasAoCliente(Long idCliente);

	/**
	 * 
	 * @param clienteMensagem
	 */
	void excluir(ClienteMensagem clienteMensagem);
	
	/**
	 * 
	 * @param clienteMensagem
	 */
	void salvar(ClienteMensagem clienteMensagem);

	/**
	 * 
	 * @param cliente
	 * @return
	 */
	List<ClienteMensagem> obterClientesMensagensPorCliente(Cliente cliente);
}
