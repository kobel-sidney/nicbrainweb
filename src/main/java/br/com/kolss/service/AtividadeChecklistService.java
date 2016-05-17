package br.com.kolss.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import br.com.kolss.dto.AtividadeChecklistDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.AtividadeComentario;
import br.com.kolss.model.entities.AtividadeMensagem;
import br.com.kolss.model.entities.Checklist;

public interface AtividadeChecklistService {

	/**
	 * Retorna a Atividade pelo seu ID, contendo todos os seus atributos
	 * populados.
	 * 
	 * @param idAtividade
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	Atividade obter(Serializable idAtividade) throws ServiceException;

	List<Atividade> listarAtividadeChecklist(Long idChecklist, Long idEvento)
			throws ServiceException;

	List<AtividadeChecklistDTO> preencherListaChecklistDTO(
			List<Atividade> listaAtividadeChecklist) throws ServiceException;

	/**
	 * Lista todas as Atividades em Aberto.
	 * 
	 * @param idChecklist
	 * @param filtroIdPessoaResponsavel
	 * @param filtroIdStatus
	 * @param filtroIdFormulario
	 * @param filtroDataHoraInicio
	 * @param idUsuarioContexto
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Atividade> getAtividadesEmAberto(Serializable idChecklist,
			Serializable filtroIdPessoaResponsavel,
			Serializable filtroIdStatus, Serializable filtroIdFormulario,
			Date filtroDataHoraInicio, Serializable idUsuarioContexto)
			throws ServiceException;

	/**
	 * Lista todas as Atividades de um Checklist.
	 * 
	 * @param idChecklist
	 * @param filtroIdUsuarioResponsavel
	 * @param filtroIdStatus
	 * @param filtroIdFormulario
	 * @param filtroDataHoraInicio
	 * @param idUsuarioContexto
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Atividade> getAtividades(Serializable idChecklist,
			Serializable filtroIdUsuarioResponsavel,
			Serializable filtroIdStatus, Serializable filtroIdFormulario,
			Date filtroDataHoraInicio, Serializable idUsuarioContexto)
			throws ServiceException;

	/**
	 * Inicia uma atividade, alterando seu status para 'Iniciado'.
	 * 
	 * @param idAtividade
	 * @param idUsuarioContexto
	 * 
	 * @return true: A atividade foi iniciada com sucesso.<br>
	 *         false: O Status da Atividade não pode ser alterada.
	 * 
	 * @throws ServiceException
	 */
	@Deprecated
	boolean iniciarAtividade(Serializable idAtividade, String latitude,
			String longitude, Serializable idUsuarioContexto)
			throws ServiceException;

	/**
	 * Inicia uma atividade, alterando seu status para 'Iniciado'.
	 * 
	 * @param idAtividade
	 * @param observacao
	 * @param latitude
	 * @param longitude
	 * @param idUsuarioContexto
	 * 
	 * @return true: A atividade foi iniciada com sucesso.<br>
	 *         false: O Status da Atividade não pode ser alterada.
	 * 
	 * @throws ServiceException
	 */
	boolean iniciarAtividade(Serializable idAtividade, String observacao,
			String latitude, String longitude, Serializable idUsuarioContexto)
			throws ServiceException;

	/**
	 * Conclui uma atividade, alterando seu status para 'Concluido'.
	 * 
	 * @param idAtividade
	 * @param observacao
	 * @param idUsuarioContexto
	 * 
	 * @return true: A atividade foi concluída com sucesso.<br>
	 *         false: O Status da Atividade não pode ser alterada.
	 * 
	 * @throws ServiceException
	 */
	boolean concluirAtividade(Serializable idAtividade, String observacao,
			String latitude, String longitude, Serializable idUsuarioContexto)
			throws ServiceException;

	/**
	 * Cancela uma atividade, alterando seu status para 'Cancelado' e tornando-o
	 * 'Inativo'.<br>
	 * 
	 * @param idAtividade
	 * @param observacao
	 * @param atividadeAuxiliar
	 *            Indica se deve ser gerado uma atividade auxiliar (caso
	 *            exista);
	 * @param idUsuarioContexto
	 * 
	 * @return true: A atividade foi cancelada com sucesso.<br>
	 *         false: O Status da Atividade não pode ser alterada.
	 * 
	 * @throws ServiceException
	 */
	boolean cancelarAtividade(Serializable idAtividade, String observacao,
			String latitude, String longitude, boolean atividadeAuxiliar,
			Serializable idUsuarioContexto) throws ServiceException;

	/**
	 * Grava um novo comentário para a Atividade.
	 * 
	 * @param idAtividade
	 * @param comentario
	 * @param idUsuarioContexto
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	public boolean novoComentario(Serializable idAtividade, String comentario,
			Serializable idUsuarioContexto) throws ServiceException;

	/**
	 * Retorna todas as Atividades Comentários de uma Atividade, ordenados pela
	 * data do Comentário de forma decrescente.
	 * 
	 * @param idAtividade
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<AtividadeComentario> getAtividadesComentarios(Serializable idAtividade)
			throws ServiceException;

	/**
	 * Retorna todas as Atividades Mensagens de uma Atividade, ordenados pela
	 * data de Envio de forma decrescente.
	 * 
	 * @param idAtividade
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<AtividadeMensagem> getAtividadesMensagens(Serializable idAtividade)
			throws ServiceException;

	List<Atividade> getAtividadesPrevistasPorCheckList(Checklist checklist);

	/**
	 * Atualiza o Usuário Responsável pela(s) Atividade(s).
	 * 
	 * @param atividades
	 * @param idUsuarioResponsavel
	 * 
	 * @throws ServiceException
	 */
	void atualizarUsuarioResponsavel(Collection<Atividade> atividades,
			Serializable idUsuarioResponsavel) throws ServiceException;

	@Deprecated
	Integer iniciarAtividadeMobile(Long idAtividade, Long idUsuario,
			String latitude, String longitude) throws ServiceException;

	@Deprecated
	boolean concluirAtividadeMobile(Long idAtividade, Long idUsuario,
			String observacao) throws ServiceException;

	@Deprecated
	boolean cancelarAtividadeMobile(Long idAtividade, String observacao,
			boolean atividadeAuxiliar) throws ServiceException;

	boolean hasAtividadeFormularioComQuestao(Long idAtividade);

	List<Atividade> buscarPorCheckListEmAberto(Long idCheckList, Long idUser);

}
