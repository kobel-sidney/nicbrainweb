package br.com.kolss.service;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.EmailPessoa;
import br.com.kolss.model.entities.Endereco;
import br.com.kolss.model.entities.Genero;
import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.TelefonePessoa;
import br.com.kolss.model.entities.TipoPessoa;
import br.com.kolss.model.repository.PessoaRepository;

@Service("pessoaService")
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class PessoaServiceImpl implements PessoaService {

	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	protected PessoaRepository pessoaRepository;

	@Autowired
	private GeneroService generoService;
	
	@Autowired
	private TipoPessoaService tipoPessoaService;
	
	@Autowired
	private EnderecoService enderecoService;
	
	@Autowired
	private TelefonePessoaService telefonePessoaService;
	
	@Autowired
	private EmailPessoaService emailPessoaService;
	
	@Autowired
	private ClienteService clienteService;

	@Override
	public Pessoa obter(Serializable idPessoa) throws ServiceException {
		logger.info("PessoaServiceImpl.getPessoa");

		if (idPessoa == null) {
			throw new ServiceException("Chave inválida!");
		}
		Pessoa pessoaRetorno = pessoaRepository.obter(idPessoa);
		Genero genero = generoService.obter(pessoaRetorno.getGenero().getId());
		TipoPessoa tipoPessoa = tipoPessoaService.obter(pessoaRetorno.getTipoPessoa().getId());
		
		pessoaRetorno.setGenero(genero);
		pessoaRetorno.setTipoPessoa(tipoPessoa);
		
		return pessoaRetorno;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void excluir(Pessoa pessoa) throws ServiceException {
		if (pessoa == null) {
			throw new ServiceException("Pessoa inválida.");
		}

		Set<Endereco> enderecos = pessoa.getEnderecos();
		Set<TelefonePessoa> telefones = pessoa.getTelefonesPessoais();
		Set<EmailPessoa> emails = pessoa.getEmailsPessoais();

		for (Endereco endereco : enderecos) {
			Endereco end = enderecoService.buscar(endereco.getId());
			if (end != null) {
				enderecoService.remover(endereco);
			}
		}

		for (TelefonePessoa telefonePessoa : telefones) {
			TelefonePessoa telefone = telefonePessoaService.buscar(telefonePessoa.getId());
			if (telefone != null) {
				telefonePessoaService.excluir(telefone);
			}
		}

		for (EmailPessoa emailPessoa : emails) {
			EmailPessoa email = emailPessoaService.buscar(emailPessoa.getId());
			if (email != null) {
				emailPessoaService.excluir(email);
			}
		}

		pessoaRepository.excluir(pessoa);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvar(Pessoa pessoa) throws ServiceException {
		if (pessoa == null) {
			throw new ServiceException("Pessoa inválida.");
		}

		Genero genero = generoService.obter(pessoa.getGenero().getId());
		TipoPessoa tipoPessoa = tipoPessoaService.obter(pessoa.getTipoPessoa().getId());
		
		Cliente cliente = clienteService.find(pessoa.getCliente().getId());
		if (cliente != null) {
			pessoa.setCliente(cliente);
		}

		pessoa.setGenero(genero);
		pessoa.setTipoPessoa(tipoPessoa);
		pessoa.setDataUltimaAlteracao(new Date());

		try {
			if (pessoa.isNew()) {
				pessoa.setAtivo(true);
				pessoaRepository.salvar(pessoa);
			} else {
				pessoaRepository.atualizar(pessoa);
			}
		} catch (ConstraintViolationException e) {
			throw new ServiceException("O CPF informado já existe.");
		}
	}

	@Override
	public Set<Pessoa> obterTodos(Cliente cliente) throws ServiceException {
		logger.info("PessoaServiceImpl.getPessoasPorCliente");

		if (cliente == null || cliente.getId() == null) {
			throw new ServiceException("Chave inválida!");
		}

		return new HashSet<>(pessoaRepository.findPessoasPorCliente(cliente));
	}
	
	public List<Pessoa> obterTodos(Contratante contratante) throws ServiceException {
		 try {
			return pessoaRepository.obterTodos(contratante);
		} catch (Exception e) {
			throw new ServiceException("Não Foi possivel lista pessoas!");
		}
	}

}
