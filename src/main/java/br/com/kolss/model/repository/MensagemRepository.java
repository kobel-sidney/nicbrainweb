package br.com.kolss.model.repository;

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

public interface MensagemRepository {

	Mensagem obter(Serializable idMensagem);
	
	Mensagem obter(Long id);
	
	ProcedimentoMensagem obterProcedimentoMensagem(Serializable idProcedimentoMensagem);
	
	Serializable salvar(AtividadeMensagem atividadeMensagem);
	
	Serializable salvar(ChecklistMensagem checklistMensagem);
	
	Serializable salvar(ProcedimentoMensagem procedimentoMensagem);
	
	ClassificacaoOcorrenciaMensagem obterClassificacaoOcorrenciaMensagem(Serializable idMensagem,ClassificacaoOcorrencia classificacaoOcorrencia);
	
	AtividadeMensagem obterAtividadeMensagem(Serializable idMensagem,Atividade atividade);
	
	ChecklistMensagem obterChecklistMensagem(Serializable idMensagem,Checklist checklist);
	
	Integer obterQuantidadeMensagem(Serializable idLocal,Serializable idTipoMensagem, boolean ativo);
	
	List<Mensagem> obterTodos( Contratante contratante);
	
	List<Mensagem> obterTodosPorUsuario(Serializable idUsuario);
	
	List<ProcedimentoMensagem> obterProcedimentosMensagens(Collection<Serializable> idMensagens, Serializable idProcedimento,Serializable idUsuario);
	
	List<ChecklistMensagem> obterChecklistMensagens(Serializable idCheckList,Serializable idTipoMensagem , Contratante contratante);

	List<AtividadeMensagem> obterMensagensEnviadas(Atividade atividade,	Serializable idTipoMensagem);
	
	List<AtividadeMensagem> obterAtividadesMensagensComInicioAtrasadoSemAlerta();
	
	List<AtividadeMensagem> obterAtividadesMensagensComTerminoNaoRealizadoSemAlerta(Date dataReferencia);
	
	List<AtividadeMensagem> obterAtividadesMensagensComTerminoAtrasadoSemAlerta() throws ServiceException;
	
	List<AtividadeMensagem> obterAtividadesMensagem(Serializable idAtividade, Serializable idTipoMensagem);
	
	List<AtividadeMensagem> obterAtividadesMensagensComInicioNaoRealizadoSemAlerta(Date dataReferencia);
	
	List<ChecklistMensagem> obterChecklistMensagens(Checklist checklist,Serializable idTipoMensagem);
	
	List<ChecklistMensagem> obterChecklistsMensagensComInicioAtrasadoSemAlerta();
	
	List<ChecklistMensagem> obterChecklistsMensagensComInicioNaoRealizadoSemAlerta(Date dataReferencia);
	
	List<ChecklistMensagem> obterChecklistsMensagensComTerminoAtrasadoSemAlerta();
	
	List<ChecklistMensagem> obterChecklistComTerminoNaoRealizadoSemAlerta(Date dtAtual);
	
	List<ChecklistMensagem> obterChecklistMensagensRelatorio(Serializable idCheckList, Integer idEvento, Integer idLocal,Integer idCliente, Integer idContratante,Serializable idTipoMensagem);
	
	List<ChecklistPadraoMensagem> obterChecklistPadraoMensagemSelecionadas(ChecklistPadrao checklistPadrao);
	
	List<Mensagem> obterMensagensAssociadasAoCliente(Long idCliente);
	
	List<Mensagem> obterMensagensNaoAssociadasAoCliente(Long idCliente);
	
	List<Mensagem> obterMensagensNaoSelecionadas(ChecklistPadrao checklistPadrao);
	
	List<Mensagem> obterMensagensNaoSelecionadas(ChecklistPadrao checklistPadrao, Serializable idUsuario);
	
	List<Mensagem> obterMensagensSelecionadas(ChecklistPadrao checklistPadrao);
	
	void removerAssociacao(ChecklistPadrao checklistPadrao);
	
	void associarMensagens(ChecklistPadrao checklistPadrao,List<Serializable> idMensagens);
	
	void atualizar(Collection<ChecklistPadraoMensagem> checklistPadraoMensagens);
	
	void atualizar(AtividadeMensagem atividadeMensagem);
	
	void atualizar(ChecklistMensagem checklistMensagem);
	
	void atualizar(ProcedimentoMensagem procedimentoMensagem);
	
	void remover(ProcedimentoMensagem procedimentoMensagem);

	

}
