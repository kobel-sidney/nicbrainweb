package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Cargo;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.repository.CargoRepository;


@Service("CargoService")
public class CargoServiceImpl implements CargoService {
	
	@Autowired
	private CargoRepository cargoRepository;

	@Override
	public void atualizar(Cargo cargo) {
		
		if(cargo==null){
			throw new ServiceException("Cargo inválido");
		}
		
		cargoRepository.atualizar(cargo);
	}

	@Override
	public void salvar(Cargo cargo){
		
		if(cargo==null){
			throw new ServiceException("Cargo inválido");
		}
		
		cargoRepository.salvar(cargo);
	}

	@Override
	public void remover(Cargo cargo) {
		
		if(cargo==null){
			throw new ServiceException("Cargo inválido");
		}
		cargoRepository.remover(cargo);
	}

	@Override
	public List<Cargo> obterTodos(Contratante contratante) {
		
		if(contratante==null){
			throw new ServiceException("Contratante inválido");
		}
		
		return cargoRepository.obterTodos(contratante);
		
	}

	@Override
	public Cargo obter(Serializable id) throws ServiceException {
		
		if(id==null){
			throw new ServiceException("ID inválido");
		}
		
		return cargoRepository.obter(id);
	}

	
	

}
