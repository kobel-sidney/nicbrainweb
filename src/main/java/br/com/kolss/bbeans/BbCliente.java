package br.com.kolss.bbeans;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.repository.ClienteRepository;
import br.com.kolss.service.ClienteService;


@Controller(value = "bbCliente")
@Scope("request")
public class BbCliente {

	protected Logger logger = Logger.getLogger(getClass());

	@Autowired
	protected ClienteService clienteService;

	@Autowired
	protected ClienteRepository clienteRepository;

	@Autowired
	protected BbUsuarioLogado bbUsuarioLogado;


	public List<Cliente> getClientes() {
		return clienteRepository.listarClientes();
	}

	/**
	 * Retorna todos os Clientes que o Usuário solicitante tem permissão de
	 * visualização.
	 *
	 * @return
	 */
	public List<Cliente> getClientesPorContexto() {
		logger.debug("BbCliente.getClientesPorContexto");

		return clienteService.getClientes(
				bbUsuarioLogado.getUserSession().getId());
	}
	
	public List<Cliente> getClientesPorContratante() {

		return clienteService.getClientesPorContratante(bbUsuarioLogado.obterContratanteUsuarioLogado());
	}
}