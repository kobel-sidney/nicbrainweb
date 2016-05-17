package br.com.kolss.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.List;

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


public interface MensagemService {

	Mensagem obter(Serializable idMensagem);
	
	ProcedimentoMensagem obterProcedimentoMensagem(Serializable idProcedimentoMensagem) throws ServiceException;
	
	@Deprecated
	boolean existeAlertaPorLocal(Integer idLocal, boolean ativo)throws ServiceException;
	
	boolean existeAvisoPorLocal(Integer idLocal, boolean ativo)	throws ServiceException;
	
	List<ProcedimentoMensagem> obterProcedimentosMensagens(Collection<Serializable> idMensagens, Serializable idProcedimento,Serializable idUsuario) throws ServiceException;
	
	List<Mensagem> ObterTodos(Contratante contratante) throws ServiceException;
	
	List<Mensagem> obterPorUsuario(Serializable idUsuario) throws ServiceException;
	
	List<AtividadeMensagem> obterAlertasMensagensEnviadas(Atividade atividade)throws ServiceException;
	
	List<ChecklistMensagem> obterAlertaChecklistMensagem(Serializable idCheckList ,Contratante contratante) throws ServiceException;
	
	List<ChecklistPadraoMensagem> obterChecklistPadraoMensagemSelecionadas(ChecklistPadrao checklistPadrao,Contratante contratante) throws ServiceException;
	
	List<Mensagem> obterMensagensAssociadasAoCliente(Long idCliente);
	
	List<Mensagem> obterMensagensNaoAssociadasAoCliente(Long idCliente);
	
	List<ChecklistMensagem> obterChecklistMensagensRelatorio(Integer idCheckList, Integer idEvento, Integer idLocal,Integer idCliente, Integer idContratante, Integer idTipoMensagem);
	
	@Deprecated
	List<Mensagem> getMensagensNaoSelecionadas(ChecklistPadrao checklistPadrao) throws ServiceException;
	
	List<Mensagem> obterMensagensNaoSelecionadas(ChecklistPadrao checklistPadrao,	Serializable idUsuario) throws ServiceException;
	
	List<Mensagem> obterMensagensSelecionadas(ChecklistPadrao checklistPadrao, Contratante contratante) throws ServiceException;
	
	Serializable salvar(ProcedimentoMensagem procedimentoMensagem)throws ServiceException;

	List<AtividadeMensagem> obterAtividadesMensagem(Serializable idAtividade, Long iD_TIPO_ALERTA);

	List<ChecklistMensagem> obterChecklistsMensagensComInicioAtrasadoSemAlerta();

	List<AtividadeMensagem> obterAtividadesMensagensComInicioAtrasadoSemAlerta();

	void atualizar(AtividadeMensagem atvMsg);
	
	void atualizar(ProcedimentoMensagem procedimentoMensagem) throws ServiceException;	
	
	void atualizar(ChecklistMensagem checklistMensagem);

	void atualizar(Collection<ChecklistPadraoMensagem> checklistPadraoMensagens) throws ServiceException;

	void remover(ProcedimentoMensagem procedimentoMensagem) throws ServiceException;
	
	void remover(Collection<ProcedimentoMensagem> procedimentosMensagens) throws ServiceException;
	
	void removerAssociacao(ChecklistPadrao checklistPadrao)	throws ServiceException;
	
	void associarMensagens(ChecklistPadrao checklistPadrao,	List<Serializable> idMensagens) throws ServiceException;

	List<ChecklistMensagem> obterChecklistsMensagensComTerminoAtrasadoSemAlerta();

	List<AtividadeMensagem> obterAtividadesMensagensComTerminoAtrasadoSemAlerta();

	List<ChecklistMensagem> obterChecklistsMensagensComInicioNaoRealizadoSemAlerta(Date dtAtual);

	List<AtividadeMensagem> obterAtividadesMensagensComInicioNaoRealizadoSemAlerta(Date dataReferencia);

	ClassificacaoOcorrenciaMensagem obterClassificacaoOcorrenciaMensagem(Serializable idMensagem,ClassificacaoOcorrencia classificacaoOcorrencia);

	ChecklistMensagem obterChecklistMensagem(Serializable idMensagem,Checklist checklist);

	AtividadeMensagem obterAtividadeMensagem(Serializable idMensagem,Atividade atividade);


}
