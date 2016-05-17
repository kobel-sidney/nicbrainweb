package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.dto.EnvioFormularioDTO;
import br.com.kolss.dto.PerfilFormularioDTO;
import br.com.kolss.dto.RespostaQuestaoDTO;
import br.com.kolss.dto.RetornoDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.PerfilFormulario;

/**
 * 
 * @author hamseshenrique
 *
 */
public interface PerfilFormularioService {

	/**
	 * 
	 * @param id
	 * @return
	 */
	PerfilFormularioDTO obterPerfilFormulario(final Long id);
    /**
     * 
     * @return
     */
	List<PerfilFormulario> obterTodos(Contratante contratante);
	
    /**
     * 
     * @param perfilFormulario
     */
	void remover(PerfilFormulario perfilFormulario);
	
    /**
     * 
     * @param perfilFormulario
     */
	void atualizar(PerfilFormulario perfilFormulario);
	
    /**
     * 
     * @param perfilFormulario
     */
	void salvar(PerfilFormulario perfilFormulario);
	
	
	/**
	 * Retorna o Perfil Formulário.
	 * 
	 * @param idPerfilFormulario
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	PerfilFormulario find(Serializable idPerfilFormulario)
				throws ServiceException;
	
	/**
	 * 
	 * @return
	 */
	RetornoDTO salvarEnvioPerfilFormulario(final EnvioFormularioDTO envio);
	/**
	 * 
	 * @param listResposta
	 * @return
	 */
	RetornoDTO salvarAssinatura(final List<RespostaQuestaoDTO> listResposta);

}
