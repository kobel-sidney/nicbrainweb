package br.com.kolss.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TelefoneUtil;
import br.com.kolss.model.repository.TelefoneUtilRepository;

@Service
public class TelefoneUtilServiceImpl implements TelefoneUtilService {

	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private TelefoneUtilRepository telefoneUtilRepository;
	
	
	@Override
	public List<TelefoneUtil> obterTodos(Contratante contratante) throws ServiceException {
		
		logger.info("TelefoneUtilServiceImpl.obterTodos");
		
		if(contratante==null || contratante.getId()==null){
			throw new ServiceException("Contratante inválido");
		}
		
		return telefoneUtilRepository.obterTodos(contratante);
	}

	@Override
	public void remover(TelefoneUtil telefoneUtil) {
		logger.info("TelefoneUtilServiceImpl.remover");
		
		if(telefoneUtil==null || telefoneUtil.getId()==null){
			throw new ServiceException("TelefoneUtil inválido");
		}
		
		telefoneUtilRepository.remover(telefoneUtil);
		
	}

	@Override
	public void atualizar(TelefoneUtil telefoneUtil) {
		logger.info("TelefoneUtilServiceImpl.atualizar");
		
		if(telefoneUtil==null || telefoneUtil.getId()==null){
			throw new ServiceException("TelefoneUtil inválido");
		}
		
		telefoneUtilRepository.atualizar(telefoneUtil);
	}

	@Override
	public void salvar(TelefoneUtil telefoneUtil) {
		logger.info("TelefoneUtilServiceImpl.salvar");
		
		if(telefoneUtil==null){
			throw new ServiceException("TelefoneUtil inválido");
		}
		
		telefoneUtilRepository.salvar(telefoneUtil);
	}
	
	

}
