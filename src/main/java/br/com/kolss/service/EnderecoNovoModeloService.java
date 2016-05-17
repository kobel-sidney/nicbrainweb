package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.EnderecoContato;
import br.com.kolss.model.entities.PessoaNovoModelo;

public interface EnderecoNovoModeloService {

	void adicionar(EnderecoContato enderecoContato, PessoaNovoModelo pessoa) throws ServiceException;

	void remover(EnderecoContato enderecoContato) throws ServiceException;

	List<EnderecoContato> buscarPorPessoa(PessoaNovoModelo pessoa) throws ServiceException;
}
