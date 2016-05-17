package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.ClienteMensagem;
import br.com.kolss.model.entities.Mensagem;

public interface ClienteMensagemRepository {

	List<Mensagem> obterAssociadasAoCliente(Long idCliente);

	List<Mensagem> obterNaoAssociadasAoCliente(Long idCliente);
	
	/**
	 * 
	 * @param clienteMensagem
	 */
	void excluir(ClienteMensagem clienteMensagem);
	
	/**
	 * 
	 * @param cliente
	 * @return
	 */
	List<ClienteMensagem> obterClientesMensagensPorCliente(Cliente cliente);

	/**
	 * 
	 * @param clienteMensagem
	 */
	void salvar(ClienteMensagem clienteMensagem);
}
