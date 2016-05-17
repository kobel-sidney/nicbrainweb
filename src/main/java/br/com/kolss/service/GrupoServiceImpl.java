package br.com.kolss.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Grupo;
import br.com.kolss.model.repository.GrupoRepository;

@Service
public class GrupoServiceImpl implements  GrupoService {
	
	@Autowired
	private GrupoRepository grupoRepository;

	@Override
	public void atualizar(Grupo grupo) throws ServiceException {
		
		if(grupo==null || grupo.getId()==null){
			throw new ServiceException("Grupo inválido");
		}
		
		grupoRepository.atualizar(grupo);
	}

	@Override
	public void salvar(Grupo grupo) throws ServiceException {
		
		if(grupo==null){
			throw new ServiceException("Grupo inválido");
		}
		grupo.setDataCadastro(new Date());
		grupoRepository.salvar(grupo);
	}

	@Override
	public void remover(Grupo grupo) throws ServiceException {
		
		if(grupo==null || grupo.getId()==null){
			throw new ServiceException("Grupo inválido");
		}
		
		grupoRepository.remover(grupo);
	}

	@Override
	public List<Grupo> obterTodos(Contratante contratante)throws ServiceException {
		
		if(contratante==null || contratante.getId()==null){
			throw new ServiceException("Contratante inválido");
		}
		
		return grupoRepository.obterTodos(contratante);
	}

	@Override
	public Grupo obter(Serializable id) throws ServiceException {
		
		if(id==null){
			throw new ServiceException("ID inválido");
		}
		
		return grupoRepository.obter(id);
	}


}
