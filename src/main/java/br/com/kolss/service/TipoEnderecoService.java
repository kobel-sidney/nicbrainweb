package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.TipoEndereco;

public interface TipoEnderecoService {

	List<TipoEndereco> obterTodos() throws ServiceException;

	TipoEndereco buscar(Long id);

	void remover(TipoEndereco tipoEndereco);

	void salvar(TipoEndereco tipoEndereco);

	void atualizar(TipoEndereco tipoEndereco);
}
