package br.com.kolss.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.AtividadeOcorrencia;
import br.com.kolss.model.entities.OperacaoAtividadeOcorrencia;
import br.com.kolss.model.entities.Status;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.repository.OperacaoAtividadeOcorrenciaRepository;


@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class OperacaoAtividadeOcorrenciaServiceImpl
		implements OperacaoAtividadeOcorrenciaService{

	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private OperacaoAtividadeOcorrenciaRepository repository;
	
	@Autowired
	private OcorrenciaService ocorrenciaService;
	
	
	public OperacaoAtividadeOcorrenciaServiceImpl() {
	}
	
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void executarOperacao(Serializable idAtividadeOcorrencia,
			Usuario usuario, Status status, String latitude, String longitude,
			Date dtHrStatus) throws ServiceException {
		logger.debug("OperacaoAtividadeOcorrenciaServiceImpl.executarOperacao");
		
		AtividadeOcorrencia atividadeOcorrencia =
				ocorrenciaService.getAtividadeOcorrencia(
						idAtividadeOcorrencia);
		OperacaoAtividadeOcorrencia opAtvOcorrencia =
				new OperacaoAtividadeOcorrencia(
						null,
						dtHrStatus,
						atividadeOcorrencia.getObservacao(),
						latitude,
						longitude,
						status,
						usuario,
						atividadeOcorrencia);
		repository.salvar(opAtvOcorrencia);
		
//		atividadeOcorrencia.getOperacoesAtividadesOcorrencias().add(
//				opAtvOcorrencia);
//		ocorrenciaService.atualizar(atividadeOcorrencia);
	}
	
	@Override
	public List<OperacaoAtividadeOcorrencia> getOperacoesAtividadesOcorrencias(
			AtividadeOcorrencia atividadeOcorrencia) throws ServiceException {
		logger.info("OperacaoAtividadeOcorrenciaServiceImpl.getOperacoesAtividadesOcorrencias");
		
		return repository.getOperacoesAtividadesOcorrencias(atividadeOcorrencia);
	}
	
}
