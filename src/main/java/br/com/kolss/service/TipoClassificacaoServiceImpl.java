package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TipoClassificacao;
import br.com.kolss.model.repository.TipoClassificacaoRepository;


@Service
public class TipoClassificacaoServiceImpl implements TipoClassificacaoService {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private TipoClassificacaoRepository tipoClassificacaoRepository;
	
	@Override
	public TipoClassificacao obter(Serializable idTipoClassificacao) throws ServiceException {
		logger.debug("TipoClassificacaoServiceImpl.obter");
		
		if (idTipoClassificacao == null) {
			throw new ServiceException("Tipo Classificação inválida");
		}
		
		return tipoClassificacaoRepository.obter(idTipoClassificacao);
	}
	
	@Override
	public List<TipoClassificacao> obterTodos(Contratante contratante)	throws ServiceException {
		logger.debug("TipoClassificacaoServiceImpl.obterTodos");
			if(contratante==null){
				throw new ServiceException("Contratante inválido");
			}
		return tipoClassificacaoRepository.obterTodos(contratante);
	}
}
