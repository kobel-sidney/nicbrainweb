package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Departamento;
import br.com.kolss.model.repository.DepartamentoRepository;


/**
 * @author adansbento
 *
 */
@Service
@Transactional(propagation = Propagation.REQUIRES_NEW)
public class DepartamentoServiceImpl implements DepartamentoService {
	
	@Autowired
	private DepartamentoRepository departamentoRepository;

	@Override
	public void atualizar(Departamento departamento) throws ServiceException {
		validar(departamento);
		departamentoRepository.atualizar(departamento);
	}

	@Override
	public void salvar(Departamento departamento) throws ServiceException {
		validar(departamento);
		departamentoRepository.salvar(departamento);
	}

	@Override
	public void remover(Departamento departamento) throws ServiceException {
		validar(departamento);
		departamentoRepository.remover(departamento);
	}

	@Override
	public List<Departamento> obterTodos(Contratante contratante)throws ServiceException {
		validarContratante(contratante);
		return departamentoRepository.obterTodos(contratante);
	}

	@Override
	public Departamento obter(Serializable id, Contratante contratante)	throws ServiceException {
		validarContratante(contratante);
		return departamentoRepository.obter(id,contratante);
	}

	private void validar(Departamento departamento) {
		if(departamento==null){
			throw new ServiceException("Departamento inválido");
		}
		validarContratante(departamento.getContratante());
	}

	private void validarContratante(Contratante contratante) {
		if(contratante==null || contratante.getId()==null ){
			throw new ServiceException("Contratante inválido");
		}
	}
	

	
}
