package br.com.kolss.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contato;
import br.com.kolss.model.entities.Email;
import br.com.kolss.model.entities.PessoaNovoModelo;
import br.com.kolss.model.repository.ContatoRepository;
import br.com.kolss.model.repository.EmailRepository;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class EmailServiceImpl implements EmailService {

	@Autowired
	private EmailRepository emailRepository;

	@Autowired
	private ContatoRepository contatoRepository;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void adicionar(Email email, PessoaNovoModelo pessoa)
			throws ServiceException {
		if (pessoa == null) {
			throw new ServiceException("Pessoa inválida.");
		}

		if (email == null) {
			throw new ServiceException("Email inválido");
		}

		Contato contato = contatoRepository.buscarPorPessoa(pessoa);
		email.setContato(contato);

		if (email.isNew()) {
			email.setDataCriacao(new Date());
		}

		emailRepository.adicionar(email);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void remover(Email email) throws ServiceException {
		if (email == null) {
			throw new ServiceException("Email inválido");
		}
		emailRepository.remover(email);
	}

	@Override
	public List<Email> listarPorPessoa(PessoaNovoModelo pessoa)
			throws ServiceException {
		if (pessoa == null) {
			throw new ServiceException("Pessoa Inválida.");
		}

		Contato contato = contatoRepository.buscarPorPessoa(pessoa);

		return emailRepository.listarPorContato(contato);
	}
}
