package br.com.kolss.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contato;
import br.com.kolss.model.entities.PessoaNovoModelo;
import br.com.kolss.model.entities.Telefone;
import br.com.kolss.model.repository.ContatoRepository;
import br.com.kolss.model.repository.TelefoneRepository;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class TelefoneServiceImpl implements TelefoneService {

	@Autowired
	private TelefoneRepository telefoneRepository;

	@Autowired
	private ContatoRepository contatoRepository;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void adicionar(Telefone telefone, PessoaNovoModelo pessoa)
			throws ServiceException {
		if (pessoa == null) {
			throw new ServiceException("Pessoa inválida.");
		}

		if (telefone == null) {
			throw new ServiceException("Telefone inválido");
		}

		Contato contato = contatoRepository.buscarPorPessoa(pessoa);
		telefone.setContato(contato);

		if (telefone.isNew()) {
			telefone.setDataCriacao(new Date());
		}

		telefoneRepository.adicionar(telefone);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void remover(Telefone telefone) throws ServiceException {
		if (telefone == null) {
			throw new ServiceException("Endereço inválido");
		}
		telefoneRepository.remover(telefone);
	}

	@Override
	public List<Telefone> listarPorPessoa(PessoaNovoModelo pessoa)
			throws ServiceException {

		if (pessoa == null) {
			throw new ServiceException("Pessoa Inválida.");
		}

		Contato contato = contatoRepository.buscarPorPessoa(pessoa);

		return telefoneRepository.listarPorContato(contato);

	}
}
