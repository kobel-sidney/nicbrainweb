package br.com.kolss.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.EmailPessoa;
import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.repository.EmailPessoaRepository;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class EmailPessoaServiceImpl implements EmailPessoaService {

	@Autowired
	private EmailPessoaRepository emailPessoaRepository;

	@Autowired
	private PessoaService pessoaService;

	@Override
	public List<EmailPessoa> listarPorPessoa(Pessoa pessoa) throws ServiceException {
		if (pessoa == null || pessoa.isNew()) {
			throw new ServiceException("Pessoa inválida");
		}

		return emailPessoaRepository.listarPorPessoa(pessoa);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvar(EmailPessoa email) throws ServiceException {
		if (email == null) {
			throw new ServiceException("Telefone inválido");
		}

		Pessoa pessoa = pessoaService.obter(email.getPessoa().getId());
		if (pessoa == null) {
			throw new ServiceException("Pessoa inválida.");
		}

		try {
			email.setPessoa(pessoa);

			if (email.isNew()) {
				email.setDataCadastro(new Date());
			}

			emailPessoaRepository.salvar(email);
		} catch (Exception e) {
			throw new ServiceException("Ocorreu um erro ao salvar");
		}
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void excluir(EmailPessoa email) throws ServiceException {
		if (email == null) {
			throw new ServiceException("Email inválido");
		}

		emailPessoaRepository.excluir(email);
	}

	@Override
	public EmailPessoa buscar(Long id) {
		return emailPessoaRepository.buscar(id);
	}
}
