package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.AtividadeComentario;
import br.com.kolss.model.entities.AtividadeMensagem;
import br.com.kolss.model.entities.Checklist;

public interface AtividadeRepository {

	Atividade obter(Serializable idAtividade);

	void atualizar(Atividade atividade);

	Integer getQuantidadeAtividadesEmAndamento(Serializable idChecklist,boolean inicioChecklist);

	List<Atividade> getAtividadesPrevistasPorCheckList(Checklist checklist);

	List<AtividadeComentario> getAtividadesComentarios(Serializable idAtividade);

	List<AtividadeMensagem> getAtividadesMensagens(Serializable s);

	List<Atividade> getAtividadesEmAberto(Serializable idChecklist,
										  Serializable filtroIdUsuarioResponsavel,
										  Serializable filtroIdStatus, Serializable filtroIdFormulario,
										  Date filtroDataHoraInicio, Serializable idUsuarioContexto);

	List<Atividade> getAtividades(Serializable idChecklist,
								  Serializable filtroIdUsuarioResponsavel,
								  Serializable filtroIdStatus, Serializable filtroIdFormulario,
								  Date filtroDataHoraInicio, Serializable idUsuarioContexto);

	void salvar(AtividadeComentario atvComentario);

	List<Atividade> obterAtividadeComFormulario(Long idAtividade);

	boolean hasAtividadeFormularioComQuestao(Long idAtividade);

	List<Atividade> buscarPorCheckListEmAberto(Long idCheckList, Long idUser);
}
