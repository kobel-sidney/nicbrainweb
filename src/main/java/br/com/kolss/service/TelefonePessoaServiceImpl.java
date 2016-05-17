package br.com.kolss.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.TelefonePessoa;
import br.com.kolss.model.entities.TipoTelefone;
import br.com.kolss.model.repository.TelefonePessoaRepository;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class TelefonePessoaServiceImpl implements TelefonePessoaService {

	@Autowired
	private TelefonePessoaRepository telefonePessoaRepository;

	@Autowired
	private PessoaService pessoaService;
	
	@Autowired
	private TipoTelefoneService tipoTelefoneService;

	@Override
	public List<TelefonePessoa> listarPorPessoa(Pessoa pessoa) throws ServiceException {
		if (pessoa == null || pessoa.isNew()) {
			throw new ServiceException("Pessoa inválida");
		}
		return telefonePessoaRepository.listarPorPessoa(pessoa);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvar(TelefonePessoa telefone) throws ServiceException {
		if (telefone == null) {
			throw new ServiceException("Telefone inválido");
		}

		Pessoa pessoa = pessoaService.obter(telefone.getPessoa().getId());
		if (pessoa == null) {
			throw new ServiceException("Pessoa inválida.");
		}

		TipoTelefone tipoTelefone = tipoTelefoneService.obter(telefone.getTipoTelefone().getId());
		if (tipoTelefone == null) {
			throw new ServiceException("Tipo de telefone inválido.");
		}

		try {
			telefone.setPessoa(pessoa);
			telefone.setTipoTelefone(tipoTelefone);

			if (telefone.isNew()) {
				telefone.setDataCadastro(new Date());
			}

			telefonePessoaRepository.salvar(telefone);
		} catch (Exception e) {
			throw new ServiceException("Ocorreu um erro ao salvar");
		}
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void excluir(TelefonePessoa telefone) throws ServiceException {
		if (telefone == null) {
			throw new ServiceException("Telefone inválido");
		}

		telefonePessoaRepository.excluir(telefone);
	}

	@Override
	public TelefonePessoa buscar(Long id) {
		return telefonePessoaRepository.buscar(id);
	}
}
