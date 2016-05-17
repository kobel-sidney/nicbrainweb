package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Email;
import br.com.kolss.model.entities.PessoaNovoModelo;

public interface EmailService {

	void adicionar(Email email, PessoaNovoModelo pessoa) throws ServiceException;

	void remover(Email email) throws ServiceException;

	List<Email> listarPorPessoa(PessoaNovoModelo pessoa) throws ServiceException;
}
