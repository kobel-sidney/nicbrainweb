package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Menu;

public interface MenuService {

	List<Menu> getMenuSuperiores() throws ServiceException;
	
	Menu find(Long id) throws ServiceException;
	
	List<Menu> getMenuSuperioresAssociadosAoContratante(Long idContratante);

	List<Menu> getMenuSuperioresNaoAssociadosAoContratante(Long idContratante);

	List<Menu>  obterTodos();

	void salvar(Menu model);

	void atualizar(Menu model);

	void remover(Menu model);

}