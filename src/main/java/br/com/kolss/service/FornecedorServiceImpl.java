package br.com.kolss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Fornecedor;
import br.com.kolss.model.repository.FornecedorRepository;

@Service
public class FornecedorServiceImpl implements FornecedorService {

	@Autowired
	private FornecedorRepository fornecedorRepository;

	@Override
	public List<Fornecedor> obterTodos(Contratante  contratante) throws ServiceException {
		if(contratante==null || contratante.getId() ==null){
			throw new ServiceException("Contratante inválido");
		}
		return fornecedorRepository.obterTodos(contratante);
	}

	@Override
	public void salvar(Fornecedor fornecedor) {
		if(fornecedor==null){
			throw new ServiceException("Fornecedor inválido");
		}
		fornecedorRepository.salvar(fornecedor);
	}

	@Override
	public void atualizar(Fornecedor fornecedor) {
		if(fornecedor==null){
			throw new ServiceException("Fornecedor inválido");
		}
		fornecedorRepository.atualizar(fornecedor);
	}

	@Override
	public void remover(Fornecedor fornecedor) {
		if(fornecedor==null){
			throw new ServiceException("Fornecedor inválido");
		}
		fornecedorRepository.remover(fornecedor);		
	}
}
