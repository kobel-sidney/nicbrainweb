package br.com.kolss.controller;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.ModeloEquipamento;
import br.com.kolss.model.repository.ModeloEquipamentoRepository;

@Service
public class ModeloEquipamentoServiceImpl implements ModeloEquipamentoService {
	
	@Autowired
	private ModeloEquipamentoRepository modeloEquipamentoRepository;

	@Override
	public List<ModeloEquipamento> obterTodos(Contratante contratante) throws ServiceException {
		
		if(contratante==null || contratante.getId()==null){
			throw new ServiceException("Contratante Inválido");
		}
		
		return modeloEquipamentoRepository.obterTodos(contratante);
	}

	@Override
	public ModeloEquipamento obter(Serializable id) throws ServiceException {
		
		if(id==null){
			throw new ServiceException("ID Inválido");
		}
		
		return modeloEquipamentoRepository.obter(id);
	}

	@Override
	public void atualizar(ModeloEquipamento modeloEquipamento) throws ServiceException {
		
		if(modeloEquipamento==null){
			throw new ServiceException("ModeloEquipamento Inválido");
		}
		
		modeloEquipamentoRepository.atualizar(modeloEquipamento);
	}

	@Override
	public void salvar(ModeloEquipamento modeloEquipamento) throws ServiceException {
		
		if(modeloEquipamento==null){
			throw new ServiceException("ModeloEquipamento Inválido");
		}
		
		modeloEquipamentoRepository.salvar(modeloEquipamento);

	}

	@Override
	public void remover(ModeloEquipamento modeloEquipamento) throws ServiceException {
		
		if(modeloEquipamento==null){
			throw new ServiceException("ModeloEquipamento Inválido");
		}
		
		modeloEquipamentoRepository.remover(modeloEquipamento);

	}

}
