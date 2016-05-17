package br.com.kolss.bbeans;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.dto.UsuarioDTO;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.UsuarioService;


@Controller(value = "bbUsuario")
@Scope("request")
public class BbUsuario {

	protected Logger logger = Logger.getLogger(getClass());

	@Autowired
	protected UsuarioService service;

	@Autowired
	protected BbUsuarioLogado bbUsuarioLogado;

	/**
	 * Lista todos os Usuários Responsáveis pelos Eventos visiveis do Usuário
	 * Logado.
	 *
	 * @return
	 */
	public List<Usuario> getUsuariosResposaveisPorEventosPorContexto() {
		logger.debug("BbUsuario.getUsuariosPorEventosPorContexto");

		Serializable idUsuario = bbUsuarioLogado.getUserSession().getId();
		return service.getUsuariosPorEventosPorContexto(idUsuario);
	}

	/**
	 * Lista todos os Usuários Responsáveis pelos Checklists visiveis do Usuário
	 * Logado.
	 *
	 * @return
	 */
	public List<Usuario> getUsuariosResposaveisPorChecklistsPorContexto() {
		logger.debug("BbUsuario.getUsuariosResposaveisPorChecklistsPorContexto");

		Serializable idUsuario = bbUsuarioLogado.getUserSession().getId();
		return service.getUsuariosPorChecklistsPorContexto(idUsuario);
	}

	/**
	 * Lista todos os Usuários Responsáveis pelas Atividades visiveis do Usuário
	 * Logado.
	 *
	 * @return
	 */
	public List<Usuario> getUsuariosResposaveisPorAtividadesPorContexto() {
		logger.debug("BbUsuario.getUsuariosResposaveisPorAtividadesPorContexto");

		Serializable idUsuario = bbUsuarioLogado.getUserSession().getId();
		return service.getUsuariosPorAtividadesPorContexto(idUsuario);
	}

	/**
	 * Retorna todos os Usuários que estão no mesmo Contexto.
	 *
	 * @param idUsuario
	 *
	 * @return
	 */
	public List<Usuario> getUsuariosPorContexto() {
		logger.debug("BbUsuario.getUsuariosPorContexto");

		return service.getUsuariosPorContexto(
				bbUsuarioLogado.getUserSession().getId());
	}
	
	public List<Usuario> getUsuariosPorContratante() {
		return service.obterTodos(bbUsuarioLogado.obterContratanteUsuarioLogado());
	}
	
	public List<Usuario> getUsuariosPorContextoNoEvento() {
		logger.debug("BbUsuario.getUsuariosPorContexto");

		return service.getUsuariosPorEventosPorContexto(bbUsuarioLogado.getUserSession().getId());
	}

	public List<Usuario> getUsuariosFuncionariosPorEvento() {
		// FIXME: Necessita de análise de arquitetura do sistema!
		return this.getUsuariosPorContexto();
	}

	/**
	 * Lista os Usuários Superiores de um Responsável.
	 *
	 * @param idUsuario
	 *
	 * @return
	 */
	public List<Usuario> getUsuariosSuperioresPorContexto() {
		logger.debug("BbUsuario.getUsuariosSuperioresPorContexto");

		return service.getUsuariosSuperioresPorContexto(
				bbUsuarioLogado.getUserSession().getId());
	}

	public List<UsuarioDTO> getUsuariosDTO() {

		return service.listarUsuariosDTO(bbUsuarioLogado.obterContratanteUsuarioLogado());
	}

}
