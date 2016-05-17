package br.com.kolss.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import br.com.kolss.dto.AtividadeOcorrenciaDTO;
import br.com.kolss.dto.OcorrenciaDTO;
import br.com.kolss.dto.OcorrenciaRondaDTO;
import br.com.kolss.dto.RetornoAberturaOcorrenciaDTO;
import br.com.kolss.dto.TipoClassificacaoOcorrenciaDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.AtividadeOcorrencia;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Ocorrencia;
import br.com.kolss.model.entities.Usuario;

public interface OcorrenciaService {

	/**
	 * Retorna a Atividade Ocorrência.
	 *
	 * @param idOcorrencia
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	Ocorrencia getOcorrencia(Serializable idOcorrencia) throws ServiceException;

	/**
	 * Retorna todas as Ocorrências em Aberto disponíveis e autorizadas para o
	 * Usuário selecionado (via contexto).
	 *
	 * @param filtroIdLocal
	 * @param filtroIdCliente
	 * @param filtroIdContratante
	 * @param idUsuario
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	@Deprecated
	List<Ocorrencia> getOcorrenciasEmAbertoPorContexto(Integer filtroIdLocal, Integer filtroIdCliente,
			Integer filtroIdContratante, Serializable idUsuario) throws ServiceException;

	/**
	 * Retorna todas as Ocorrências Em Andamento de um Local e autorizadas para
	 * o Usuário selecionado (via contexto).
	 *
	 * @param local
	 * @param idUsuario
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	@Deprecated
	List<Ocorrencia> getOcorrenciasEmAndamentoPorLocalPorContexto(Local local, Serializable idUsuario)
			throws ServiceException;

	/**
	 * Retorna todas as Ocorrências em Aberto disponíveis e autorizadas para o
	 * Usuário selecionado (via contexto).
	 *
	 * @param filtroIdLocal
	 * @param filtroIdCliente
	 * @param filtroIdContratante
	 * @param idUsuario
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	List<Ocorrencia> getOcorrenciasEmAndamentoPorLocalPorContexto(Serializable filtroIdLocal,
			Serializable filtroIdCliente, Serializable filtroIdContratante, Serializable idUsuario)
					throws ServiceException;

	/**
	 * Retorna todas as Ocorrências em Aberto de um Evento.
	 *
	 * @param filtroIdEvento
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	List<Ocorrencia> getOcorrenciasEmAndamentoPorEventoPorContexto(Integer filtroIdEvento) throws ServiceException;

	/**
	 * Retorna as Ocorrências ativas, ordenadas em ordem decrescente da data de
	 * criação podendo filtrar a consulta.
	 *
	 * @param filtroIdEvento
	 * @param filtroIdLocal
	 * @param filtroIdClassificacao
	 * @param filtroIdTipoClassificacao
	 * @param filtroIdStatus
	 * @param filtroIdResponsavel
	 * @param filtroIdSuperior
	 * @param filtroDataInicio
	 * @param idUsuarioContexto
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	List<Ocorrencia> getOcorrenciasEmAndamento(Serializable filtroIdEvento, Serializable filtroIdLocal,
			Serializable filtroIdClassificacao, Serializable filtroIdTipoClassificacao, Serializable filtroIdStatus,
			Serializable filtroIdResponsavel, Serializable filtroIdSuperior, Date filtroDataInicio,
			Serializable idUsuarioContexto) throws ServiceException;

	/**
	 * Gera uma nova Ocorrência.
	 *
	 * @param descricaoOcorrencia
	 * @param dataOcorrencia
	 * @param idClassificacaoOcorrencia
	 * @param idGravidadeOcorrencia
	 * @param idTipoClassificacao
	 * @param latitude
	 * @param longitude
	 * @param idEvento
	 * @param idAtividade
	 * @param idUsuario
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	RetornoAberturaOcorrenciaDTO abrirNovaOcorrencia(OcorrenciaDTO ocorrenciaDTO) throws ServiceException;

	/**
	 * Associa uma imagem a uma Ocorrência.
	 *
	 * @param idOcorrencia
	 * @param byteArrayImagem
	 *
	 * @throws ServiceException
	 */
	void salvarImagem(Serializable idOcorrencia, String byteArrayImagem) throws ServiceException;

	/**
	 * Lista as Atividade Ocorrências
	 *
	 * @param idOcorerncia
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	List<AtividadeOcorrencia> getAtividadesOcorrencias(Serializable idOcorerncia) throws ServiceException;

	/**
	 * Retorna a Atividade Ocorrência.
	 *
	 * @param idAtividadeOcorrencia
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	AtividadeOcorrencia getAtividadeOcorrencia(Serializable idAtividadeOcorrencia) throws ServiceException;

	/**
	 * Atualizar uma Ocorrência.
	 *
	 * @param ocorrencia
	 *
	 * @throws ServiceException
	 */
	void atualizar(Ocorrencia ocorrencia) throws ServiceException;

	/**
	 * Atualizar uma Atividade Ocorrência.
	 *
	 * @param atividadeOcorrencia
	 *
	 * @throws ServiceException
	 */
	void atualizar(AtividadeOcorrencia atividadeOcorrencia) throws ServiceException;

	/**
	 * Conclui uma Atividade Ocorrência.
	 *
	 * @param idAtividadeOcorrencia
	 * @param latitude
	 * @param longitude
	 * @param observacao
	 * @param idUsuarioResponsavel
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	boolean concluirAtividadeOcorrencia(Serializable idAtividadeOcorrencia, String latitude, String longitude,
			String observacao, Serializable idUsuarioResponsavel) throws ServiceException;

	/**
	 * Cancela uma Atividade Ocorrência.
	 *
	 * @param idAtividadeOcorrencia
	 * @param latitude
	 * @param longitude
	 * @param observacao
	 * @param idUsuarioResponsavel
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	boolean cancelarAtividadeOcorrencia(Serializable idAtividadeOcorrencia, String latitude, String longitude,
			String observacao, Serializable idUsuarioResponsavel) throws ServiceException;

	/**
	 * Finaliza a Ocorrência e todas as Atividades Ocorrências em aberto.
	 *
	 * @param idOcorrencia
	 * @param latitude
	 * @param longitude
	 * @param observacao
	 * @param idUsuarioResponsavel
	 *
	 * @throws ServiceException
	 */
	void concluirOcorrencia(Serializable idOcorrencia, String latitude, String longitude, String observacao,
			Serializable idUsuarioResponsavel) throws ServiceException;

	/**
	 * Cancela a Ocorrência e todas as Atividades Ocorrências em aberto.
	 *
	 * @param idOcorrencia
	 * @param latitude
	 * @param longitude
	 * @param observacao
	 * @param idUsuarioResponsavel
	 *
	 * @throws ServiceException
	 */
	void falharOcorrencia(Serializable idOcorrencia, String latitude, String longitude, String observacao,
			Serializable idUsuarioResponsavel) throws ServiceException;

	List<OcorrenciaRondaDTO> listarOcorrenciasEmEspera(Usuario usuario) throws ServiceException;

	/**
	 * 
	 * @param usuario
	 * @return
	 */
	List<OcorrenciaRondaDTO> obterOcorrenciasEmEsperaPorUsuario(Usuario usuario) throws ServiceException;

	/**
	 * 
	 * @param usuario
	 * @return
	 * @throws ServiceException
	 */
	List<OcorrenciaRondaDTO> obterOcorrenciasFinalizadasPorUsuario(Usuario usuario) throws ServiceException;

	/**
	 * 
	 * @param ocorrenciaRondaDTO
	 * @throws ServiceException
	 */
	void alterarResponsavel(OcorrenciaRondaDTO ocorrenciaRondaDTO) throws ServiceException;

	/**
	 * 
	 * @param userID
	 * @return
	 */
	List<OcorrenciaRondaDTO> obterOcorrenciasEmEsperaPorResponsavel(Long userID) throws ServiceException;

	/**
	 * 
	 * @param occurrenceID
	 * @return
	 * @throws ServiceException
	 */
	OcorrenciaRondaDTO getOccurrenceByIDDTO(Long occurrenceID) throws ServiceException;

	List<AtividadeOcorrenciaDTO> obterAtividadeOcorrenciaPorIdOcorrencia(Long idOcorrencia);

	/**
	 * 
	 * @param classificationID
	 * @return
	 * @throws ServiceException
	 */
	List<TipoClassificacaoOcorrenciaDTO> getTypeByClassificationDTO(Long classificationID) throws ServiceException;

	
	/**
	 * 
	 * @param idUsuario
	 * @return
	 * @throws ServiceException
	 */
	List<AtividadeOcorrenciaDTO> listarAtividadeOcorrenciaPorUsuario(String idUsuario);
}
