package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.AbstractEntity;
import br.com.kolss.model.repository.DadosMestresRepository;

public abstract class DadosMestresServiceImpl<T extends AbstractEntity<?>> implements DadosMestresService<T> {

	private DadosMestresRepository<T> dadosMestresRepository;
	private final Class<T> clazz;
	
	public DadosMestresServiceImpl(DadosMestresRepository<T> dadosMestresRepository,Class<T> clazz){
		this.dadosMestresRepository = dadosMestresRepository;
		this.clazz = clazz;
	}
	
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvar(T entity)throws ServiceException {
		antesSalvar(entity);
		dadosMestresRepository.salvar(entity);
		depoisSalvar(entity);
	}

	

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void atualizar(T entity)	throws ServiceException {
		antesAtualizar(entity);
		dadosMestresRepository.atualizar(entity);
		depoisAtualizar(entity);
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void remover(T entity)throws ServiceException {
		antesRemover(entity);
		dadosMestresRepository.remover(entity);
		depoisRemover(entity);
	}

	@Override
	public T obter(Serializable id) throws ServiceException {
		return dadosMestresRepository.obter(id,clazz);
	}

	@Override
	public List<T> obterTodos() throws ServiceException {
		return (List<T>) dadosMestresRepository.obterTodos(clazz);
	}


	protected DadosMestresRepository<T> getDadosMestresRepository() {
		return dadosMestresRepository;
	}

	protected void antesSalvar(T entity){}

	protected void depoisSalvar(T entity) {}

	protected void antesAtualizar(T entity) {}
	
	protected void depoisAtualizar(T entity) {}

	protected void antesRemover(T entity){}

	protected void depoisRemover(T entity) {}


}
