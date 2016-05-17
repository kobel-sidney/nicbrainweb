package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.PessoaNovoModelo;
import br.com.kolss.model.entities.Telefone;

public interface TelefoneService {

	void adicionar(Telefone telefone, PessoaNovoModelo pessoa) throws ServiceException;

	void remover(Telefone telefone) throws ServiceException;

	List<Telefone> listarPorPessoa(PessoaNovoModelo pessoa) throws ServiceException;
}
