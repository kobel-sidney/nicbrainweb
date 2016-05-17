package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.dto.FormularioDTO;
import br.com.kolss.dto.PerguntaDTO;
import br.com.kolss.dto.TopicoDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Formulario;
import br.com.kolss.model.entities.Topico;


public interface FormularioService {

	/**
	 * Retorna o Formulário.
	 * 
	 * @param idFormulario
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	Formulario getFormulario(Serializable idFormulario) throws ServiceException;
	
	boolean responderPergunta(Integer idPergunta, Integer idUsuario, String resposta) throws ServiceException;
	
	boolean cancelarPergunta(Integer idPergunta, Integer idUsuario) throws ServiceException;
	
	boolean sincronizarMobileWeb() throws ServiceException;
	
	FormularioDTO buscarFormulario(Serializable idFormulario) throws ServiceException;
	
	FormularioDTO preencherFormularioDTO(Formulario formulario) throws ServiceException;
	
	List<TopicoDTO> preencherTopicosDoFormulario(List<Topico> topicos) throws ServiceException;
	
	List<PerguntaDTO> buscarPerguntas(Serializable idTopico) throws ServiceException;
	
	/**
	 * Retorna todos os Formulário ativos, ordenados em ordem alfabética do nome.
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<Formulario> obterTodos() throws ServiceException;

	void salvar(Formulario model);

	void atualizar(Formulario model);

	void remover(Formulario model);
	
}
