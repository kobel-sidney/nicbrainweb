package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TipoServico;
import br.com.kolss.model.repository.TipoServicoRepository;

@Service
public class TipoServicoServiceImpl implements TipoServicoService {
	
	@Autowired
	private TipoServicoRepository tipoServicoRepository; 

	@Override
	public void atualizar(TipoServico tipoServico) throws ServiceException {
		  
		if(tipoServico==null || tipoServico.getId()==null){
			throw new ServiceException("Tipo Serviço inválido");
		}
		
		tipoServicoRepository.atualizar(tipoServico);
		
	}

	@Override
	public void salvar(TipoServico tipoServico) throws ServiceException {
		if(tipoServico==null){
			throw new ServiceException("Tipo Serviço inválido");
		}
		
		tipoServicoRepository.salvar(tipoServico);
	}
	@Override
	public void remover(TipoServico tipoServico) throws ServiceException {
		
		if(tipoServico==null || tipoServico.getId()==null){
			throw new ServiceException("Tipo Serviço inválido");
		}
		
		tipoServicoRepository.remover(tipoServico);
	}

	@Override
	public List<TipoServico> obterTodos(Contratante contratante) throws ServiceException {
		
		if(contratante==null || contratante.getId()==null){
			throw new ServiceException("Contratante inválido");
		}
		
		return tipoServicoRepository.obterTodos(contratante);
	}

	@Override
	public TipoServico obter(Serializable id) throws ServiceException {
		
		if(id==null){
			throw new ServiceException("ID inválido");
		}
		
		return tipoServicoRepository.obter(id);
	}

	@Override
	public List<TipoServico> obterTodos() throws ServiceException {
		return tipoServicoRepository.obterTodos();
	}
}
