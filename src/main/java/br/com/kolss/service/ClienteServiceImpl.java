package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.ClienteMensagem;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.repository.ClienteRepository;

@Service
public class ClienteServiceImpl implements ClienteService {

	protected Logger logger = Logger.getLogger(getClass());

	@Autowired
	private ClienteRepository clienteRepository;

	@Autowired
	private ClienteMensagemService clienteMensagemService;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvar(Cliente cliente) throws ServiceException {
		logger.debug("ClienteServiceImpl.salvar");
		if (cliente != null && cliente.isNew()) {
			clienteRepository.salvar(cliente);
		}
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void atualizar(Cliente cliente) throws ServiceException {
		logger.debug("ClienteServiceImpl.atualizar");
		if (cliente != null && !cliente.isNew()) {
			List<ClienteMensagem> clienteMensagems = clienteMensagemService.obterClientesMensagensPorCliente(cliente);
			for (ClienteMensagem clienteMensagem : clienteMensagems) {
				clienteMensagemService.excluir(clienteMensagem);
			}
			
			List<ClienteMensagem> clienteMensagemsParaAssociar = cliente.getClientesMensagens();
			
			clienteRepository.atualizar(cliente);
			
			for (ClienteMensagem clienteMensagem : clienteMensagemsParaAssociar) {
				clienteMensagemService.salvar(clienteMensagem);
			}
		}
	}

	@Override
	public List<Cliente> getClientes(Serializable idUsuarioContexto) throws ServiceException {
		logger.debug("ClienteServiceImpl.getClientes");

		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário inválido");
		}

		return clienteRepository.getClientes(idUsuarioContexto);
	}

	@Override
	public List<Cliente> getClientesPorContratante(Contratante contratante) {
		logger.debug("ClienteServiceImpl.getClientesPorContratante");
		return clienteRepository.getClientePorContratante(contratante);

	}

	@Override
	public Cliente find(Long id) throws ServiceException {
		return clienteRepository.find(id);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void remover(Cliente cliente) throws ServiceException {
		logger.debug("ClienteServiceImpl.remover()");
		clienteRepository.remover(cliente);
	}

}
