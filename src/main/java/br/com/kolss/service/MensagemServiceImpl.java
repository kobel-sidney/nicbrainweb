package br.com.kolss.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.AtividadeMensagem;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.ChecklistMensagem;
import br.com.kolss.model.entities.ChecklistPadrao;
import br.com.kolss.model.entities.ChecklistPadraoMensagem;
import br.com.kolss.model.entities.ClassificacaoOcorrencia;
import br.com.kolss.model.entities.ClassificacaoOcorrenciaMensagem;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Mensagem;
import br.com.kolss.model.entities.ProcedimentoMensagem;
import br.com.kolss.model.entities.TipoMensagem;
import br.com.kolss.model.repository.MensagemRepository;
import br.com.kolss.model.repository.MensagemRepositoryImpl;


@Service
@Transactional(propagation=Propagation.REQUIRED)
public class MensagemServiceImpl implements MensagemService {

	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	protected MensagemRepository mensagemRepository;
	
	public MensagemServiceImpl() {}
	
	
	@Override
	public Mensagem obter(Serializable idMensagem) {
		
		logger.debug("MensagemServiceImpl.find");
		return mensagemRepository.obter(idMensagem);
	}
	
	@Override
	public ProcedimentoMensagem obterProcedimentoMensagem(Serializable idProcedimentoMensagem) throws ServiceException {
		
		logger.debug("MensagemServiceImpl.getProcedimentoMensagem");
		
		if (idProcedimentoMensagem == null) {
			throw new ServiceException("ProcedimentoMensagem inválido!");
		}
		
		return mensagemRepository.obterProcedimentoMensagem(
				idProcedimentoMensagem);
	}
	
	@Override
	public List<ProcedimentoMensagem> obterProcedimentosMensagens(Collection<Serializable> idMensagens, Serializable idProcedimento,
			Serializable idUsuario) throws ServiceException {

		logger.debug("MensagemServiceImpl.getProcedimentosMensagens");
		
		if (idUsuario == null) {
			throw new ServiceException("Usuário inválido!");
		}

		return mensagemRepository.obterProcedimentosMensagens(idMensagens,
				idProcedimento, idUsuario);
	}
	
	@Override
	public List<Mensagem> ObterTodos(Contratante contratante) throws ServiceException {

		logger.debug("MensagemServiceImpl.getMensagens");
		return mensagemRepository.obterTodos(contratante);
	}
	
	@Override
	public List<Mensagem> obterPorUsuario(Serializable idUsuario)throws ServiceException {
		
		logger.debug("MensagemServiceImpl.getMensagens(idUsuario)");
		
		if (idUsuario == null) {
			throw new ServiceException("Usuário inválido!");
		}
		
		return mensagemRepository.obterTodosPorUsuario(idUsuario);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public Serializable salvar(ProcedimentoMensagem procedimentoMensagem)throws ServiceException {
		
		logger.debug("MensagemServiceImpl.salvar(ProcedimentoMensagem)");
		return mensagemRepository.salvar(procedimentoMensagem);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void atualizar(ProcedimentoMensagem procedimentoMensagem)
			throws ServiceException {
		logger.debug("MensagemServiceImpl.atualizar(ProcedimentoMensagem)");
		
		mensagemRepository.atualizar(procedimentoMensagem);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void remover(ProcedimentoMensagem procedimentoMensagem)	throws ServiceException {
		
		logger.debug("MensagemServiceImpl.remover");
		mensagemRepository.remover(procedimentoMensagem);
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void remover(Collection<ProcedimentoMensagem> procedimentosMensagens)throws ServiceException {
		
		logger.debug("MensagemServiceImpl.remover(Collection<ProcedimentoMensagem>)");
		
		for (ProcedimentoMensagem entity : procedimentosMensagens) {
			mensagemRepository.remover(entity);
		}
	}
	
	@Override
	public List<AtividadeMensagem> obterAlertasMensagensEnviadas(Atividade atividade) throws ServiceException {
		logger.debug("MensagemServiceImpl.getAlertasMensagensEnviadas");
		
		if (atividade == null || atividade.getId() == null
							  || atividade.getId().intValue() <= 0) {
			throw new ServiceException("Atividade Inválida!");
		}
		
		return mensagemRepository.obterMensagensEnviadas(atividade,	TipoMensagem.ID_TIPO_ALERTA);
	}
	
	@Override
	public List<ChecklistMensagem> obterAlertaChecklistMensagem(Serializable idCheckList ,Contratante contratante) throws ServiceException {
		logger.debug("MensagemServiceImpl.obterAlertaChecklistMensagem");
		
		return mensagemRepository.obterChecklistMensagens(idCheckList,TipoMensagem.ID_TIPO_ALERTA, contratante);
	}
	
	@Override
	@Deprecated
	public boolean existeAlertaPorLocal(Integer idLocal, boolean ativo)
			throws ServiceException {
		logger.debug("MensagemServiceImpl.existeAlertaPorLocal");
		return existeMensagemPorLocal(idLocal, TipoMensagem.ID_TIPO_ALERTA, ativo);
	}
	
	@Override
	public boolean existeAvisoPorLocal(Integer idLocal, boolean ativo)
			throws ServiceException {
		logger.debug("MensagemServiceImpl.existeAvisoPorLocal");
		return existeMensagemPorLocal(idLocal, TipoMensagem.ID_TIPO_AVISO, ativo);
	}
	
	/**
	 * Pesquisa se existe algum tipo de Mensagem para o local a ser pesquisado.
	 *  
	 * @param idLocal
	 * @param idTipoMensagem
	 * @param ativo
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	private boolean existeMensagemPorLocal(Serializable idLocal,
			Serializable idTipoMensagem, boolean ativo) throws ServiceException {
		logger.debug("MensagemServiceImpl.existeMensagemPorLocal");
		
		try {
			final int qtd = mensagemRepository.obterQuantidadeMensagem(
					idLocal, idTipoMensagem, ativo);
			return (qtd > 0 ? true : false);
		} catch (Exception e) {
			throw new ServiceException(e);
		}
	}
	
	@Deprecated
	@Override
	public List<Mensagem> getMensagensNaoSelecionadas(
			ChecklistPadrao checklistPadrao) throws ServiceException {
		logger.debug("MensagemServiceImpl.getMensagensNaoSelecionadas");
		
		if (checklistPadrao == null || checklistPadrao.isNew()) {
			throw new ServiceException("Checklist Padrão inválido!");
		}
		
		return mensagemRepository.obterMensagensNaoSelecionadas(checklistPadrao);
	}
	
	@Override
	public List<Mensagem> obterMensagensNaoSelecionadas(ChecklistPadrao checklistPadrao, Serializable idUsuario)
					throws ServiceException {
		logger.debug("MensagemServiceImpl.getMensagensNaoSelecionadas");
		
		if (checklistPadrao == null || checklistPadrao.isNew()) {
			throw new ServiceException("Checklist Padrão inválido!");
		}
		if (idUsuario == null) {
			throw new ServiceException("Usuário Inválido!");
		}
		
		return mensagemRepository.obterMensagensNaoSelecionadas(checklistPadrao,idUsuario);
	}
	
	@Override
	public List<Mensagem> obterMensagensSelecionadas(ChecklistPadrao checklistPadrao, Contratante contratante) throws ServiceException {
		
		logger.debug("MensagemServiceImpl.getMensagensSelecionadas");
		
		if (checklistPadrao == null || checklistPadrao.isNew() || contratante == null) {
			throw new ServiceException("Checklist Padrão inválido!");
		}
		
		return mensagemRepository.obterMensagensSelecionadas(checklistPadrao);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void removerAssociacao(ChecklistPadrao checklistPadrao)throws ServiceException {
		
		logger.debug("MensagemServiceImpl.removerAssociacao");
		
		if (checklistPadrao == null || checklistPadrao.isNew()) {
			throw new ServiceException("Checklist Padrão inválido!");
		}
		
		mensagemRepository.removerAssociacao(checklistPadrao);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void associarMensagens(ChecklistPadrao checklistPadrao,List<Serializable> idMensagens) throws ServiceException {
		
		logger.debug("MensagemServiceImpl.removerAssociacao");
		
		if (checklistPadrao == null || checklistPadrao.isNew()) {
			throw new ServiceException("Checklist Padrão inválido!");
		}
		
		mensagemRepository.associarMensagens(checklistPadrao, idMensagens);
	}
	
	@Override
	public List<ChecklistPadraoMensagem> obterChecklistPadraoMensagemSelecionadas(
			ChecklistPadrao checklistPadrao ,Contratante contratante) throws ServiceException {
		
		logger.debug("MensagemServiceImpl.getChecklistPadraoMensagemSelecionadas");
		
		if (checklistPadrao == null || checklistPadrao.isNew()) {
			throw new ServiceException("Checklist Padrão inválido!");
		}
		
		return mensagemRepository.obterChecklistPadraoMensagemSelecionadas(checklistPadrao);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void atualizar(Collection<ChecklistPadraoMensagem> checklistPadraoMensagens)
					throws ServiceException {
		logger.debug("MensagemServiceImpl.atualizar");
		
		if (checklistPadraoMensagens != null && !checklistPadraoMensagens.isEmpty()) {
			mensagemRepository.atualizar(checklistPadraoMensagens);
		}
	}
	
	public void setMensagemRepository(MensagemRepositoryImpl mensagemRepository) {
		this.mensagemRepository = mensagemRepository;
	}

	@Override
	public List<Mensagem> obterMensagensAssociadasAoCliente(Long idCliente) {
		return this.mensagemRepository.obterMensagensAssociadasAoCliente(idCliente);
	}

	@Override
	public List<Mensagem> obterMensagensNaoAssociadasAoCliente(Long idCliente) {
		return this.mensagemRepository.obterMensagensNaoAssociadasAoCliente(idCliente);
	}

	@Override
	public List<ChecklistMensagem> obterChecklistMensagensRelatorio(
			Integer idCheckList, Integer idEvento, Integer idLocal,
			Integer idCliente, Integer idContratante, Integer idTipoMensagem) {
		return this.mensagemRepository.obterChecklistMensagensRelatorio(idCheckList, idEvento, idLocal, idCliente, idContratante, idTipoMensagem);
	}

	@Override
	public List<AtividadeMensagem> obterAtividadesMensagem(Serializable idAtividade, Long idTipoMensagem) {
		return this.mensagemRepository.obterAtividadesMensagem(idAtividade, idTipoMensagem);
	}


	@Override
	public List<ChecklistMensagem> obterChecklistsMensagensComInicioAtrasadoSemAlerta() {
		return mensagemRepository.obterChecklistsMensagensComInicioAtrasadoSemAlerta();
	}


	@Override
	public List<AtividadeMensagem> obterAtividadesMensagensComInicioAtrasadoSemAlerta() {
		return mensagemRepository.obterAtividadesMensagensComInicioAtrasadoSemAlerta();
	}


	@Override
	public void atualizar(AtividadeMensagem atividadeMensagem) {
		mensagemRepository.atualizar(atividadeMensagem);
	}


	@Override
	public void atualizar(ChecklistMensagem checklistMensagem) {
		mensagemRepository.atualizar(checklistMensagem);
	}


	@Override
	public List<ChecklistMensagem> obterChecklistsMensagensComTerminoAtrasadoSemAlerta() {
		return mensagemRepository.obterChecklistsMensagensComTerminoAtrasadoSemAlerta();
	}


	@Override
	public List<AtividadeMensagem> obterAtividadesMensagensComTerminoAtrasadoSemAlerta() {
		return mensagemRepository.obterAtividadesMensagensComTerminoAtrasadoSemAlerta();
	}


	@Override
	public List<ChecklistMensagem> obterChecklistsMensagensComInicioNaoRealizadoSemAlerta(Date dtAtual) {
		if(dtAtual==null){
			throw new ServiceException("Data atual inválida!");
		}
		return mensagemRepository.obterChecklistsMensagensComInicioNaoRealizadoSemAlerta(dtAtual);
	}


	@Override
	public List<AtividadeMensagem> obterAtividadesMensagensComInicioNaoRealizadoSemAlerta(Date dataReferencia) {
		if(dataReferencia==null){
			throw new ServiceException("Data Referencia inválida!");
		}
		return mensagemRepository.obterAtividadesMensagensComInicioNaoRealizadoSemAlerta(dataReferencia);
	}


	@Override
	public ClassificacaoOcorrenciaMensagem obterClassificacaoOcorrenciaMensagem(Serializable idMensagem,ClassificacaoOcorrencia classificacaoOcorrencia) {
		return mensagemRepository.obterClassificacaoOcorrenciaMensagem(idMensagem,classificacaoOcorrencia);
	}


	@Override
	public ChecklistMensagem obterChecklistMensagem(Serializable idMensagem,Checklist checklist) {
		return mensagemRepository.obterChecklistMensagem(idMensagem,checklist);
	}


	@Override
	public AtividadeMensagem obterAtividadeMensagem(Serializable idMensagem,Atividade atividade) {
		return mensagemRepository.obterAtividadeMensagem(idMensagem,atividade);
	}

}
