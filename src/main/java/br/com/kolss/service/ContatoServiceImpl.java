package br.com.kolss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contato;
import br.com.kolss.model.entities.PessoaNovoModelo;
import br.com.kolss.model.repository.ContatoRepository;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class ContatoServiceImpl implements ContatoService {

	@Autowired
	private ContatoRepository repository;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void adicionar(Contato contato) {
		repository.adicionar(contato);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void remover(Contato contato) {
		repository.remover(contato);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public Contato buscarPorPessoa(PessoaNovoModelo pessoa) {
		if (pessoa == null) {
			throw new ServiceException("Pessoa inválida.");
		}

		Contato contato = repository.buscarPorPessoa(pessoa);

		if (contato == null) {
			contato = new Contato();
			contato.setPessoa(pessoa);
			adicionar(contato);
		}

		return repository.buscarPorPessoa(pessoa);
	}
}
