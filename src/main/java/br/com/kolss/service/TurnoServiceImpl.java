package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Turno;
import br.com.kolss.model.repository.TurnoRespository;

@Service
public class TurnoServiceImpl implements TurnoService{
	
	
	@Autowired
	private TurnoRespository turnoRepository;

	@Override
	public void atualizar(Turno turno) throws ServiceException {
		
		if(turno==null || turno.getId()==null){
			throw new ServiceException("Turno inválido");
		}
		
		turnoRepository.atualizar(turno);
		
	}

	@Override
	public void salvar(Turno turno) throws ServiceException {

		if(turno==null){
			throw new ServiceException("Turno inválido");
		}
		
		turnoRepository.salvar(turno);
	}

	@Override
	public void remover(Turno turno) throws ServiceException {
		
		if(turno==null || turno.getId()==null){
			throw new ServiceException("Turno inválido");
		}
		
		turnoRepository.remover(turno);
	}

	@Override
	public List<Turno> obterTodos(Contratante contratante) throws ServiceException {
		
		if(contratante==null || contratante.getId()==null){
			throw new ServiceException("Contratante inválido");
		}
		
		return turnoRepository.obterTodos(contratante);
	}

	@Override
	public Turno obter(Serializable id) throws ServiceException {
		
		if(id==null){
			throw new ServiceException("ID inválido");
		}
		
		return turnoRepository.obter(id);
	}


}
