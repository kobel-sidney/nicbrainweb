package br.com.kolss.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Endereco;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Municipio;
import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.TipoEndereco;
import br.com.kolss.model.repository.EnderecoRepository;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class EnderecoServiceImpl implements EnderecoService {

	@Autowired
	private EnderecoRepository enderecoRepository;

	@Autowired
	private TipoEnderecoService enderecoService;

	@Autowired
	private MunicipioService municipioService;

	@Autowired
	private PessoaService pessoaService;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvar(Endereco endereco) throws ServiceException {
		if (endereco == null) {
			throw new ServiceException("Endereço inválido.");
		}

		if (endereco.getPessoa() != null) {
			Pessoa pessoa = pessoaService.obter(endereco.getPessoa().getId());
			endereco.setPessoa(pessoa);
		}

		Municipio municipio = municipioService.obter(endereco.getMunicipio().getId());
		if (municipio == null) {
			throw new ServiceException("Município inválido.");
		}

		TipoEndereco tipoEndereco = enderecoService.buscar(endereco.getTipoEndereco().getId());
		if (tipoEndereco == null) {
			throw new ServiceException("Tipo de endereço inválido.");
		}

		try {
			endereco.setMunicipio(municipio);
			endereco.setTipoEndereco(tipoEndereco);

			if (endereco.isNew()) {
				endereco.setDataCadastro(new Date());
				enderecoRepository.salvar(endereco);
			} else {
				enderecoRepository.atualizar(endereco);
			}
		} catch (Exception e) {
			throw new ServiceException("Ocorreu um erro ao salvar");
		}
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvarEnderecoCliente(Endereco endereco) throws ServiceException {
		endereco.setDataCadastro(new Date());
		enderecoRepository.salvar(endereco);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void atualizar(Endereco endereco) throws ServiceException {
		enderecoRepository.atualizar(endereco);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void remover(Endereco endereco) throws ServiceException {
		enderecoRepository.remover(endereco);
	}

	@Override
	public Endereco buscar(Long id) throws ServiceException {
		return enderecoRepository.find(id);
	}

	@Override
	public List<Endereco> listarPorContratante(Contratante contratante) {
		return enderecoRepository.listarPorContratante(contratante);
	}

	@Override
	public Endereco listarEnderecoCompleto(Long id) {
		return enderecoRepository.listarEnderecoCompleto(id);
	}

	@Override
	public List<Endereco> listarPorCliente(Cliente cliente) throws ServiceException {
		return enderecoRepository.listarPorCliente(cliente);
	}

	@Override
	public List<Endereco> buscarPorLocal(Local local) {
		return enderecoRepository.buscarPorLocal(local);
	}

	@Override
	public List<Endereco> listarPorPessoa(Pessoa pessoa) throws ServiceException {
		if (pessoa.isNew() || pessoa == null) {
			throw new ServiceException("Pessoa inválida.");
		}

		return enderecoRepository.listarPorPessoa(pessoa);
	}

	@Override
	public List<Endereco> obterTodos() {
		return enderecoRepository.obterTodos();
	}
}
