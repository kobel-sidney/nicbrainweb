package br.com.kolss.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.dto.ClassificacaoOcorrenciaDTO;
import br.com.kolss.dto.TipoClassificacaoOcorrenciaDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.ClassificacaoOcorrencia;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TipoClassificacao;
import br.com.kolss.model.repository.ClassificacaoOcorrenciaRepository;


@Service
public class ClassificacaoOcorrenciaServiceImpl implements ClassificacaoOcorrenciaService {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private ClassificacaoOcorrenciaRepository classificacaoOcorrenciaRepository;
	
	@Override
	public ClassificacaoOcorrencia obter(Serializable id) throws ServiceException {
		
		logger.debug("ClassificacaoOcorrenciaServiceImpl.find(Serializable)");
		
		if(id == null){
			throw new ServiceException("ID Inválido");	
		}
		
		return classificacaoOcorrenciaRepository.obter(id);
	}
	
	@Override
	public ClassificacaoOcorrencia obterPorNome(String nomeClassificacaoOcorrencia,Contratante contratante) throws ServiceException {
		
		logger.debug("ClassificacaoOcorrenciaServiceImpl.obterPorNome(Serializable)");
		
		if(nomeClassificacaoOcorrencia == null || nomeClassificacaoOcorrencia.equals("")){
			throw new ServiceException("Nome Inválido");
		}
		
		if(contratante == null || contratante.getId()==null){
			throw new ServiceException("Contratante Inválido");
		}
		return classificacaoOcorrenciaRepository.obterPorNome(nomeClassificacaoOcorrencia,contratante);
	}
	
	@Override
	public List<ClassificacaoOcorrencia> obterTodos(Contratante contratante) {
		logger.debug("ClassificacaoOcorrenciaServiceImpl.getClassificacoesOcorrencias");
		
		if(contratante == null || contratante.getId()==null){
			throw new ServiceException("Contratante Inválido");
		}
		
		return classificacaoOcorrenciaRepository.obterTodos(contratante);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public List<ClassificacaoOcorrenciaDTO> getClassificacoesOcorrenciasDTO(Contratante contratante) {
		
		if(contratante == null || contratante.getId()==null){
			throw new ServiceException("Contratante Inválido");
		}
		
		List<ClassificacaoOcorrencia> listaDeClassificacaoOcorrencia = classificacaoOcorrenciaRepository.obterTodos(contratante);
		
		List<ClassificacaoOcorrenciaDTO> listaDeClassificacaoOcorrenciaDTO = new ArrayList<ClassificacaoOcorrenciaDTO>();
		List<TipoClassificacaoOcorrenciaDTO> listaDeTipoDeClassificacaoDeOcorrenciaDTO = new ArrayList<TipoClassificacaoOcorrenciaDTO>();
		
		for (ClassificacaoOcorrencia classificacaoOcorrencia : listaDeClassificacaoOcorrencia) {
			ClassificacaoOcorrenciaDTO classificacaoOcorrenciaDTO = new ClassificacaoOcorrenciaDTO();
			classificacaoOcorrenciaDTO.setId(String.valueOf(classificacaoOcorrencia.getId()));
			classificacaoOcorrenciaDTO.setNome(classificacaoOcorrencia.getNome());
			byte[] imgIcone = null;
			imgIcone = classificacaoOcorrencia.getIcone();
			classificacaoOcorrenciaDTO.setBitmapImageIcone(Base64.encodeBase64String(imgIcone));
			
			for (TipoClassificacao tipoClassificacaoOcorrencia : classificacaoOcorrencia.getTiposClassificacoes()) {
				
				TipoClassificacaoOcorrenciaDTO tipoClassificacaoOcorrenciaDTO = new TipoClassificacaoOcorrenciaDTO();
				tipoClassificacaoOcorrenciaDTO.setId(tipoClassificacaoOcorrencia.getId().toString());
				tipoClassificacaoOcorrenciaDTO.setNome(tipoClassificacaoOcorrencia.getNome());
				tipoClassificacaoOcorrenciaDTO.setIdGravidade(tipoClassificacaoOcorrencia.getGravidadeOcorrencia().getId().toString());
				tipoClassificacaoOcorrenciaDTO.setIdClassificacao(tipoClassificacaoOcorrencia.getClassificacaoOcorrencia().getId().toString()); 	
				listaDeTipoDeClassificacaoDeOcorrenciaDTO.add(tipoClassificacaoOcorrenciaDTO);
			}
			
			classificacaoOcorrenciaDTO.setListaDeTipoDeClassificacaoOcorrencia(listaDeTipoDeClassificacaoDeOcorrenciaDTO);
			classificacaoOcorrenciaDTO.setIdContratante(contratante.getId());
			listaDeClassificacaoOcorrenciaDTO.add(classificacaoOcorrenciaDTO);
			
		}
		
		return listaDeClassificacaoOcorrenciaDTO;
	}

	@Override
	public List<TipoClassificacaoOcorrenciaDTO> obterTipoClassificacoesOcorrenciasDTO(Long idGravidade, Contratante contratante) {
		
		List<TipoClassificacao> list = classificacaoOcorrenciaRepository.obterTipoClassificacoesOcorrenciasPorIdClasContrante(idGravidade,contratante);
		List<TipoClassificacaoOcorrenciaDTO> tipos = new ArrayList<TipoClassificacaoOcorrenciaDTO>();
		for (TipoClassificacao tipoClassificacao : list) {
			TipoClassificacaoOcorrenciaDTO tipoClassificacaoOcorrenciaDTO = new  TipoClassificacaoOcorrenciaDTO();
			tipoClassificacaoOcorrenciaDTO.setId(tipoClassificacao.getId().toString());
			tipoClassificacaoOcorrenciaDTO.setNome(tipoClassificacao.getNome());
			tipoClassificacaoOcorrenciaDTO.setIdClassificacao(tipoClassificacao.getClassificacaoOcorrencia().getId().toString()); 
			
			tipoClassificacaoOcorrenciaDTO.setIdGravidade(tipoClassificacao.getGravidadeOcorrencia().getId().toString());
			tipos.add(tipoClassificacaoOcorrenciaDTO);
		}
		
		return tipos;
	}


}
