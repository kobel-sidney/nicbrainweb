package br.com.kolss.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.ClienteMensagem;
import br.com.kolss.model.entities.Mensagem;
import br.com.kolss.model.repository.ClienteMensagemRepository;

@Service
public class ClienteMensagemServiceImpl implements ClienteMensagemService {

	@Autowired
	ClienteMensagemRepository clienteMensagemRepository;

	public ClienteMensagemServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Mensagem> obterAssociadasAoCliente(Long idCliente) {
		return clienteMensagemRepository.obterAssociadasAoCliente(idCliente);
	}

	public List<Mensagem> obterNaoAssociadasAoCliente(Long idCliente) {
		return clienteMensagemRepository.obterNaoAssociadasAoCliente(idCliente);
	}

	@Override
	public void excluir(ClienteMensagem clienteMensagem) {
		clienteMensagemRepository.excluir(clienteMensagem);
	}

	@Override
	public List<ClienteMensagem> obterClientesMensagensPorCliente(Cliente cliente) {
		return clienteMensagemRepository.obterClientesMensagensPorCliente(cliente);
	}

	@Override
	public void salvar(ClienteMensagem clienteMensagem) {
		clienteMensagemRepository.salvar(clienteMensagem);
	}

}
