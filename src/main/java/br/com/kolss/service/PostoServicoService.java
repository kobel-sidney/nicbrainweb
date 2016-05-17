package br.com.kolss.service;

import br.com.kolss.dto.PostoServicoDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.PostoServico;
import java.io.Serializable;
import java.util.List;

public interface PostoServicoService {

	/**
	 * Obtém os Postos de Serviço por Contexto.
	 * 
	 * @param filtroIdTipoServico
	 * @param filtroIdSetor
	 * @param filtroIdLocal
	 * @param idUsuarioContexto
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	List<PostoServico> getPostoServicos(Serializable filtroIdTipoServico,
			Serializable filtroIdSetor, Serializable filtroIdLocal,
			Serializable idUsuarioContexto) throws ServiceException;

	List<PostoServico> obterTodos();
        
        List<PostoServicoDTO> obterTodosDTO();

	void remover(PostoServico postoServico);

	void salvar(PostoServico postoServico);

	void atualizar(PostoServico postoServico);

	PostoServico obter(Long id);

	List<PostoServico> obterPostoServicos(Contratante contratante);
}