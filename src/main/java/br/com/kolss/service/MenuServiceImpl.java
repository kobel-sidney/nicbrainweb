package br.com.kolss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Menu;
import br.com.kolss.model.repository.MenuRepository;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuRepository menuRepository;

	@Override
	public List<Menu> getMenuSuperiores() throws ServiceException {

		return menuRepository.getMenuSuperiores();
	}

	@Override
	public Menu find(Long id) throws ServiceException {
		return menuRepository.find(id);
	}
	
	@Override
	public List<Menu> getMenuSuperioresAssociadosAoContratante(Long idContratante) {
		return menuRepository.getMenuSuperioresAssociadosAoContratante(idContratante);
	}

	@Override
	public List<Menu> getMenuSuperioresNaoAssociadosAoContratante(Long idContratante) {
		return menuRepository.getMenuSuperioresNaoAssociadosAoContratante(idContratante);
	}

	@Override
	public List<Menu> obterTodos() {
		return menuRepository.obterTodos();
	}

	@Override
	public void salvar(Menu model) {
		menuRepository.salvar(model);
	}

	@Override
	public void atualizar(Menu model) {
		menuRepository.atualizar(model);
	}

	@Override
	public void remover(Menu model) {
		menuRepository.remover(model);
	}

}